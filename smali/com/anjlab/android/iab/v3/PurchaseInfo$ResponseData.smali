.class public Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;
.super Ljava/lang/Object;
.source "PurchaseInfo.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anjlab/android/iab/v3/PurchaseInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ResponseData"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public autoRenewing:Z

.field public developerPayload:Ljava/lang/String;

.field public orderId:Ljava/lang/String;

.field public packageName:Ljava/lang/String;

.field public productId:Ljava/lang/String;

.field public purchaseState:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

.field public purchaseTime:Ljava/util/Date;

.field public purchaseToken:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 94
    new-instance v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData$1;

    invoke-direct {v0}, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData$1;-><init>()V

    sput-object v0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 8
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v4, 0x0

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->orderId:Ljava/lang/String;

    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->packageName:Ljava/lang/String;

    .line 84
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->productId:Ljava/lang/String;

    .line 85
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    .line 86
    .local v2, "tmpPurchaseTime":J
    const-wide/16 v6, -0x1

    cmp-long v1, v2, v6

    if-nez v1, :cond_0

    move-object v1, v4

    :goto_0
    iput-object v1, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseTime:Ljava/util/Date;

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 88
    .local v0, "tmpPurchaseState":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    :goto_1
    iput-object v4, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseState:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->developerPayload:Ljava/lang/String;

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseToken:Ljava/lang/String;

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    :goto_2
    iput-boolean v1, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->autoRenewing:Z

    .line 92
    return-void

    .line 86
    .end local v0    # "tmpPurchaseState":I
    :cond_0
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    goto :goto_0

    .line 88
    .restart local v0    # "tmpPurchaseState":I
    :cond_1
    invoke-static {}, Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;->values()[Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    move-result-object v1

    aget-object v4, v1, v0

    goto :goto_1

    .line 91
    :cond_2
    const/4 v1, 0x0

    goto :goto_2
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 63
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 68
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->orderId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 69
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->packageName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 70
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->productId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseTime:Ljava/util/Date;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseTime:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    :goto_0
    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 72
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseState:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    if-nez v0, :cond_1

    const/4 v0, -0x1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 73
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->developerPayload:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseToken:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 75
    iget-boolean v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->autoRenewing:Z

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    :goto_2
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 76
    return-void

    .line 71
    :cond_0
    const-wide/16 v0, -0x1

    goto :goto_0

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/PurchaseInfo$ResponseData;->purchaseState:Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;

    invoke-virtual {v0}, Lcom/anjlab/android/iab/v3/PurchaseInfo$PurchaseState;->ordinal()I

    move-result v0

    goto :goto_1

    .line 75
    :cond_2
    const/4 v0, 0x0

    goto :goto_2
.end method
