.class public Lcom/anjlab/android/iab/v3/SkuDetails;
.super Ljava/lang/Object;
.source "SkuDetails.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/anjlab/android/iab/v3/SkuDetails;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final currency:Ljava/lang/String;

.field public final description:Ljava/lang/String;

.field public final isSubscription:Z

.field public final priceLong:J

.field public final priceText:Ljava/lang/String;

.field public final priceValue:Ljava/lang/Double;

.field public final productId:Ljava/lang/String;

.field public final title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 115
    new-instance v0, Lcom/anjlab/android/iab/v3/SkuDetails$1;

    invoke-direct {v0}, Lcom/anjlab/android/iab/v3/SkuDetails$1;-><init>()V

    sput-object v0, Lcom/anjlab/android/iab/v3/SkuDetails;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    .line 106
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->title:Ljava/lang/String;

    .line 107
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->description:Ljava/lang/String;

    .line 108
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->isSubscription:Z

    .line 109
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->currency:Ljava/lang/String;

    .line 110
    invoke-virtual {p1}, Landroid/os/Parcel;->readDouble()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    iput-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceValue:Ljava/lang/Double;

    .line 111
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceLong:J

    .line 112
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceText:Ljava/lang/String;

    .line 113
    return-void

    .line 108
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "source"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const-string v1, "type"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "responseType":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 52
    const-string v0, "inapp"

    .line 53
    :cond_0
    const-string v1, "productId"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    .line 54
    const-string v1, "title"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->title:Ljava/lang/String;

    .line 55
    const-string v1, "description"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->description:Ljava/lang/String;

    .line 56
    const-string v1, "subs"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->isSubscription:Z

    .line 57
    const-string v1, "price_currency_code"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->currency:Ljava/lang/String;

    .line 58
    const-string v1, "price_amount_micros"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceLong:J

    .line 59
    iget-wide v2, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceLong:J

    long-to-double v2, v2

    const-wide v4, 0x412e848000000000L    # 1000000.0

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceValue:Ljava/lang/Double;

    .line 60
    const-string v1, "price"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceText:Ljava/lang/String;

    .line 61
    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 89
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 70
    if-ne p0, p1, :cond_1

    .line 76
    :cond_0
    :goto_0
    return v1

    .line 71
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

    .line 73
    check-cast v0, Lcom/anjlab/android/iab/v3/SkuDetails;

    .line 75
    .local v0, "that":Lcom/anjlab/android/iab/v3/SkuDetails;
    iget-boolean v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->isSubscription:Z

    iget-boolean v4, v0, Lcom/anjlab/android/iab/v3/SkuDetails;->isSubscription:Z

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 76
    :cond_4
    iget-object v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    if-eqz v3, :cond_6

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    iget-object v4, v0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_5
    move v1, v2

    goto :goto_0

    :cond_6
    iget-object v3, v0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    if-nez v3, :cond_5

    goto :goto_0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 82
    iget-object v2, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 83
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-boolean v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->isSubscription:Z

    if-eqz v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    add-int v0, v2, v1

    .line 84
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 82
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 65
    const-string v0, "%s: %s(%s) %f in %s (%s)"

    const/4 v1, 0x6

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->title:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->description:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceValue:Ljava/lang/Double;

    aput-object v3, v1, v2

    const/4 v2, 0x4

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->currency:Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x5

    iget-object v3, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceText:Ljava/lang/String;

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
    .line 94
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->productId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 97
    iget-boolean v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->isSubscription:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 98
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->currency:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 99
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceValue:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeDouble(D)V

    .line 100
    iget-wide v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceLong:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 101
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/SkuDetails;->priceText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 102
    return-void

    .line 97
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
