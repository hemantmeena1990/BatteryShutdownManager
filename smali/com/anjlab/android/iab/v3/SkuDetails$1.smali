.class final Lcom/anjlab/android/iab/v3/SkuDetails$1;
.super Ljava/lang/Object;
.source "SkuDetails.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anjlab/android/iab/v3/SkuDetails;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/anjlab/android/iab/v3/SkuDetails;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/anjlab/android/iab/v3/SkuDetails;
    .locals 1
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 117
    new-instance v0, Lcom/anjlab/android/iab/v3/SkuDetails;

    invoke-direct {v0, p1}, Lcom/anjlab/android/iab/v3/SkuDetails;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 115
    invoke-virtual {p0, p1}, Lcom/anjlab/android/iab/v3/SkuDetails$1;->createFromParcel(Landroid/os/Parcel;)Lcom/anjlab/android/iab/v3/SkuDetails;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/anjlab/android/iab/v3/SkuDetails;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 121
    new-array v0, p1, [Lcom/anjlab/android/iab/v3/SkuDetails;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 115
    invoke-virtual {p0, p1}, Lcom/anjlab/android/iab/v3/SkuDetails$1;->newArray(I)[Lcom/anjlab/android/iab/v3/SkuDetails;

    move-result-object v0

    return-object v0
.end method
