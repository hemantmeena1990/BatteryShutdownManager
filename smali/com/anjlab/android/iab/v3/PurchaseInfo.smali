.class public Lcom/anjlab/android/iab/v3/PurchaseInfo;
.super Ljava/lang/Object;
.source "PurchaseInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;,
        Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/anjlab/android/iab/v3/PurchaseInfo;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOG_TAG:Ljava/lang/String; = "iabv3.purchaseInfo"


# instance fields
.field public final responseData:Ljava/lang/String;

.field public final signature:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 156
    new-instance v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$1;

    invoke-direct {v0}, Lcom/anjlab/android/iab/v3/PurchaseInfo$1;-><init>()V

    sput-object v0, Lcom/anjlab/android/iab/v3/PurchaseInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 151
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 152
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo;->responseData:Ljava/lang/String;

    .line 153
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo;->signature:Ljava/lang/String;

    .line 154
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "responseData"    # Ljava/lang/String;
    .param p2, "signature"    # Ljava/lang/String;

    .prologue
    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo;->responseData:Ljava/lang/String;

    .line 47
    iput-object p2, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo;->signature:Ljava/lang/String;

    .line 48
    return-void
.end method

.method public static getPurchaseState(I)Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;
    .locals 1
    .param p0, "state"    # I

    .prologue
    .line 106
    packed-switch p0, :pswitch_data_0

    .line 116
    sget-object v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;->Canceled:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    :goto_0
    return-object v0

    .line 108
    :pswitch_0
    sget-object v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;->PurchasedSuccessfully:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    goto :goto_0

    .line 110
    :pswitch_1
    sget-object v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;->Canceled:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    goto :goto_0

    .line 112
    :pswitch_2
    sget-object v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;->Refunded:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    goto :goto_0

    .line 114
    :pswitch_3
    sget-object v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;->SubscriptionExpired:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    goto :goto_0

    .line 106
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 142
    const/4 v0, 0x0

    return v0
.end method

.method public parseResponseData()Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;
    .locals 12

    .prologue
    const-wide/16 v10, 0x0

    const/4 v3, 0x0

    .line 122
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    iget-object v6, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo;->responseData:Ljava/lang/String;

    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 123
    .local v2, "json":Lorg/json/JSONObject;
    new-instance v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;

    invoke-direct {v0}, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;-><init>()V

    .line 124
    .local v0, "data":Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;
    const-string v6, "orderId"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->orderId:Ljava/lang/String;

    .line 125
    const-string v6, "packageName"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->packageName:Ljava/lang/String;

    .line 126
    const-string v6, "productId"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->productId:Ljava/lang/String;

    .line 127
    const-string v6, "purchaseTime"

    const-wide/16 v8, 0x0

    invoke-virtual {v2, v6, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    .line 128
    .local v4, "purchaseTimeMillis":J
    cmp-long v6, v4, v10

    if-eqz v6, :cond_0

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6, v4, v5}, Ljava/util/Date;-><init>(J)V

    :goto_0
    iput-object v6, v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseTime:Ljava/util/Date;

    .line 129
    const-string v6, "purchaseState"

    const/4 v7, 0x1

    invoke-virtual {v2, v6, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v6

    invoke-static {v6}, Lcom/anjlab/android/iab/v3/PurchaseInfo;->getPurchaseState(I)Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    move-result-object v6

    iput-object v6, v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseState:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    .line 130
    const-string v6, "developerPayload"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->developerPayload:Ljava/lang/String;

    .line 131
    const-string v6, "purchaseToken"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseToken:Ljava/lang/String;

    .line 132
    const-string v6, "autoRenewing"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v6

    iput-boolean v6, v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->autoRenewing:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v0    # "data":Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v4    # "purchaseTimeMillis":J
    :goto_1
    return-object v0

    .restart local v0    # "data":Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;
    .restart local v2    # "json":Lorg/json/JSONObject;
    .restart local v4    # "purchaseTimeMillis":J
    :cond_0
    move-object v6, v3

    .line 128
    goto :goto_0

    .line 134
    .end local v0    # "data":Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v4    # "purchaseTimeMillis":J
    :catch_0
    move-exception v1

    .line 135
    .local v1, "e":Lorg/json/JSONException;
    const-string v6, "iabv3.purchaseInfo"

    const-string v7, "Failed to parse response data"

    invoke-static {v6, v7, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v0, v3

    .line 136
    goto :goto_1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 147
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo;->responseData:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo;->signature:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 149
    return-void
.end method
