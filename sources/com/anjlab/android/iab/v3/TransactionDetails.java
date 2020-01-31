package com.anjlab.android.iab.v3;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.Date;
import org.json.JSONException;
import org.json.JSONObject;

public class TransactionDetails implements Parcelable {
    public static final Parcelable.Creator<TransactionDetails> CREATOR = new Parcelable.Creator<TransactionDetails>() {
        public TransactionDetails createFromParcel(Parcel source) {
            return new TransactionDetails(source);
        }

        public TransactionDetails[] newArray(int size) {
            return new TransactionDetails[size];
        }
    };
    public final String orderId;
    public final String productId;
    public final PurchaseInfo purchaseInfo;
    public final Date purchaseTime;
    public final String purchaseToken;

    public TransactionDetails(PurchaseInfo info) throws JSONException {
        JSONObject source = new JSONObject(info.responseData);
        this.purchaseInfo = info;
        this.productId = source.getString(Constants.RESPONSE_PRODUCT_ID);
        this.orderId = source.optString(Constants.RESPONSE_ORDER_ID);
        this.purchaseToken = source.getString(Constants.RESPONSE_PURCHASE_TOKEN);
        this.purchaseTime = new Date(source.getLong(Constants.RESPONSE_PURCHASE_TIME));
    }

    public String toString() {
        return String.format("%s purchased at %s(%s). Token: %s, Signature: %s", new Object[]{this.productId, this.purchaseTime, this.orderId, this.purchaseToken, this.purchaseInfo.signature});
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        TransactionDetails details = (TransactionDetails) o;
        if (this.orderId != null) {
            if (this.orderId.equals(details.orderId)) {
                return true;
            }
        } else if (details.orderId == null) {
            return true;
        }
        return false;
    }

    public int hashCode() {
        if (this.orderId != null) {
            return this.orderId.hashCode();
        }
        return 0;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.productId);
        dest.writeString(this.orderId);
        dest.writeString(this.purchaseToken);
        dest.writeLong(this.purchaseTime != null ? this.purchaseTime.getTime() : -1);
        dest.writeParcelable(this.purchaseInfo, flags);
    }

    protected TransactionDetails(Parcel in) {
        this.productId = in.readString();
        this.orderId = in.readString();
        this.purchaseToken = in.readString();
        long tmpPurchaseTime = in.readLong();
        this.purchaseTime = tmpPurchaseTime == -1 ? null : new Date(tmpPurchaseTime);
        this.purchaseInfo = (PurchaseInfo) in.readParcelable(PurchaseInfo.class.getClassLoader());
    }
}
