package com.anjlab.android.iab.v3;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import java.util.Date;
import org.json.JSONException;
import org.json.JSONObject;

public class PurchaseInfo implements Parcelable {
    public static final Parcelable.Creator<PurchaseInfo> CREATOR = new Parcelable.Creator<PurchaseInfo>() {
        public PurchaseInfo createFromParcel(Parcel source) {
            return new PurchaseInfo(source);
        }

        public PurchaseInfo[] newArray(int size) {
            return new PurchaseInfo[size];
        }
    };
    private static final String LOG_TAG = "iabv3.purchaseInfo";
    public final String responseData;
    public final String signature;

    public enum PurchaseState {
        PurchasedSuccessfully,
        Canceled,
        Refunded,
        SubscriptionExpired
    }

    PurchaseInfo(String responseData2, String signature2) {
        this.responseData = responseData2;
        this.signature = signature2;
    }

    public static class ResponseData implements Parcelable {
        public static final Parcelable.Creator<ResponseData> CREATOR = new Parcelable.Creator<ResponseData>() {
            public ResponseData createFromParcel(Parcel source) {
                return new ResponseData(source);
            }

            public ResponseData[] newArray(int size) {
                return new ResponseData[size];
            }
        };
        public boolean autoRenewing;
        public String developerPayload;
        public String orderId;
        public String packageName;
        public String productId;
        public PurchaseState purchaseState;
        public Date purchaseTime;
        public String purchaseToken;

        public int describeContents() {
            return 0;
        }

        public void writeToParcel(Parcel dest, int flags) {
            dest.writeString(this.orderId);
            dest.writeString(this.packageName);
            dest.writeString(this.productId);
            dest.writeLong(this.purchaseTime != null ? this.purchaseTime.getTime() : -1);
            dest.writeInt(this.purchaseState == null ? -1 : this.purchaseState.ordinal());
            dest.writeString(this.developerPayload);
            dest.writeString(this.purchaseToken);
            dest.writeByte(this.autoRenewing ? (byte) 1 : 0);
        }

        public ResponseData() {
        }

        protected ResponseData(Parcel in) {
            PurchaseState purchaseState2 = null;
            this.orderId = in.readString();
            this.packageName = in.readString();
            this.productId = in.readString();
            long tmpPurchaseTime = in.readLong();
            this.purchaseTime = tmpPurchaseTime == -1 ? null : new Date(tmpPurchaseTime);
            int tmpPurchaseState = in.readInt();
            this.purchaseState = tmpPurchaseState != -1 ? PurchaseState.values()[tmpPurchaseState] : purchaseState2;
            this.developerPayload = in.readString();
            this.purchaseToken = in.readString();
            this.autoRenewing = in.readByte() != 0;
        }
    }

    public static PurchaseState getPurchaseState(int state) {
        switch (state) {
            case 0:
                return PurchaseState.PurchasedSuccessfully;
            case 1:
                return PurchaseState.Canceled;
            case 2:
                return PurchaseState.Refunded;
            case 3:
                return PurchaseState.SubscriptionExpired;
            default:
                return PurchaseState.Canceled;
        }
    }

    public ResponseData parseResponseData() {
        Date date;
        try {
            JSONObject json = new JSONObject(this.responseData);
            ResponseData data = new ResponseData();
            data.orderId = json.optString(Constants.RESPONSE_ORDER_ID);
            data.packageName = json.optString("packageName");
            data.productId = json.optString(Constants.RESPONSE_PRODUCT_ID);
            long purchaseTimeMillis = json.optLong(Constants.RESPONSE_PURCHASE_TIME, 0);
            if (purchaseTimeMillis != 0) {
                date = new Date(purchaseTimeMillis);
            } else {
                date = null;
            }
            data.purchaseTime = date;
            data.purchaseState = getPurchaseState(json.optInt("purchaseState", 1));
            data.developerPayload = json.optString(Constants.RESPONSE_PAYLOAD);
            data.purchaseToken = json.getString(Constants.RESPONSE_PURCHASE_TOKEN);
            data.autoRenewing = json.optBoolean("autoRenewing");
            return data;
        } catch (JSONException e) {
            Log.e(LOG_TAG, "Failed to parse response data", e);
            return null;
        }
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.responseData);
        dest.writeString(this.signature);
    }

    protected PurchaseInfo(Parcel in) {
        this.responseData = in.readString();
        this.signature = in.readString();
    }
}
