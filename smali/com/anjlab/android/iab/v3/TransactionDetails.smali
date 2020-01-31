.class public Lcom/anjlab/android/iab/v3/TransactionDetails;
.super Ljava/lang/Object;
.source "TransactionDetails.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/anjlab/android/iab/v3/TransactionDetails;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final orderId:Ljava/lang/String;

.field public final productId:Ljava/lang/String;

.field public final purchaseInfo:Lcom/anjlab/android/iab/v3/PurchaseInfo;

.field public final purchaseTime:Ljava/util/Date;

.field public final purchaseToken:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 91
    new-instance v0, Lcom/anjlab/android/iab/v3/TransactionDetails$1;

    invoke-direct {v0}, Lcom/anjlab/android/iab/v3/TransactionDetails$1;-><init>()V

    sput-object v0, Lcom/anjlab/android/iab/v3/TransactionDetails;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->productId:Ljava/lang/String;

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseToken:Ljava/lang/String;

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    .line 87
    .local v0, "tmpPurchaseTime":J
    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    iput-object v2, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseTime:Ljava/util/Date;

    .line 88
    const-class v2, Lcom/anjlab/android/iab/v3/PurchaseInfo;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/anjlab/android/iab/v3/PurchaseInfo;

    iput-object v2, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseInfo:Lcom/anjlab/android/iab/v3/PurchaseInfo;

    .line 89
    return-void

    .line 87
    :cond_0
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2, v0, v1}, Ljava/util/Date;-><init>(J)V

    goto :goto_0
.end method

.method public constructor <init>(Lcom/anjlab/android/iab/v3/PurchaseInfo;)V
    .locals 4
    .param p1, "info"    # Lcom/anjlab/android/iab/v3/PurchaseInfo;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p1, Lcom/anjlab/android/iab/v3/PurchaseInfo;->responseData:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 40
    .local v0, "source":Lorg/json/JSONObject;
    iput-object p1, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseInfo:Lcom/anjlab/android/iab/v3/PurchaseInfo;

    .line 41
    const-string v1, "productId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->productId:Ljava/lang/String;

    .line 42
    const-string v1, "orderId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    .line 43
    const-string v1, "purchaseToken"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseToken:Ljava/lang/String;

    .line 44
    new-instance v1, Ljava/util/Date;

    const-string v2, "purchaseTime"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseTime:Ljava/util/Date;

    .line 45
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 70
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 54
    if-ne p0, p1, :cond_1

    .line 59
    :cond_0
    :goto_0
    return v1

    .line 55
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 57
    check-cast v0, Lcom/anjlab/android/iab/v3/TransactionDetails;

    .line 59
    .local v0, "details":Lcom/anjlab/android/iab/v3/TransactionDetails;
    iget-object v3, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    iget-object v4, v0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_4
    move v1, v2

    goto :goto_0

    :cond_5
    iget-object v3, v0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    if-nez v3, :cond_4

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 49
    const-string v0, "%s purchased at %s(%s). Token: %s, Signature: %s"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->productId:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseTime:Ljava/util/Date;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseToken:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseInfo:Lcom/anjlab/android/iab/v3/PurchaseInfo;

    iget-object v3, v3, Lcom/anjlab/android/iab/v3/PurchaseInfo;->signature:Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 75
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->productId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 76
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->orderId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseToken:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 78
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseTime:Ljava/util/Date;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseTime:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    :goto_0
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 79
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/TransactionDetails;->purchaseInfo:Lcom/anjlab/android/iab/v3/PurchaseInfo;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 80
    return-void

    .line 78
    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0
.end method
