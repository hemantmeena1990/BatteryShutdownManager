.class public Lcom/thetonyp/batteryshutdownmanager/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-string v0, "Resource error"

    .line 20
    .local v0, "result":Ljava/lang/String;
    const-string v1, "shutdown_progress"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 21
    const-string v0, "Shutting down\u2026"

    .line 29
    :cond_0
    :goto_0
    return-object v0

    .line 22
    :cond_1
    const-string v1, "shutdown_confirm"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 23
    const-string v0, "Your device will shut down."

    goto :goto_0

    .line 24
    :cond_2
    const-string v1, "lockscreen_low_battery"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 25
    const-string v0, "Connect your charger."

    goto :goto_0

    .line 26
    :cond_3
    const-string v1, "power_off"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 27
    const-string v0, "Power off"

    goto :goto_0
.end method

.method public static isPackageInstalled(Ljava/lang/String;Landroid/content/Context;)Z
    .locals 4
    .param p0, "packageName"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x1

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 11
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const/4 v3, 0x1

    :try_start_0
    invoke-virtual {v1, p0, v3}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    :goto_0
    return v2

    .line 13
    :catch_0
    move-exception v0

    .line 14
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static swapIt(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 52
    move-object v0, p0

    .line 55
    .local v0, "base64EncodedPublicKey":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    .line 58
    .local v1, "bytes":[B
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_2

    .line 59
    aget-byte v3, v1, v2

    const/16 v4, 0x41

    if-lt v3, v4, :cond_1

    aget-byte v3, v1, v2

    const/16 v4, 0x5a

    if-gt v3, v4, :cond_1

    .line 60
    aget-byte v3, v1, v2

    add-int/lit8 v3, v3, -0x41

    add-int/lit8 v3, v3, 0x61

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 58
    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 61
    :cond_1
    aget-byte v3, v1, v2

    const/16 v4, 0x61

    if-lt v3, v4, :cond_0

    aget-byte v3, v1, v2

    const/16 v4, 0x7a

    if-gt v3, v4, :cond_0

    .line 62
    aget-byte v3, v1, v2

    add-int/lit8 v3, v3, -0x61

    add-int/lit8 v3, v3, 0x41

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    goto :goto_1

    .line 66
    :cond_2
    new-instance v0, Ljava/lang/String;

    .end local v0    # "base64EncodedPublicKey":Ljava/lang/String;
    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 68
    .restart local v0    # "base64EncodedPublicKey":Ljava/lang/String;
    return-object v0
.end method
