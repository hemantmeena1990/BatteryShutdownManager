.class public Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;
.super Ljava/lang/Object;
.source "BatteryDialog.java"

# interfaces
.implements Lde/robv/android/xposed/IXposedHookLoadPackage;
.implements Lde/robv/android/xposed/IXposedHookZygoteInit;
.implements Lde/robv/android/xposed/IXposedHookInitPackageResources;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;,
        Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$ScreenReceiver;
    }
.end annotation


# static fields
.field public static final CLASS_ACTIVITY_MANAGER_NATIVE:Ljava/lang/String; = "android.app.ActivityManagerNative"

.field public static final CLASS_BATTERY_SERVICE:Ljava/lang/String; = "com.android.server.BatteryService"

.field private static final DEBUG:Z = false

.field static final ID_NOTIFICATION:I = 0x3b9ac9ff

.field public static MODULE_PATH:Ljava/lang/String; = null

.field public static final PACKAGE_NAME:Ljava/lang/String;

.field private static final RELOAD_INTERVAL:J = 0x7d0L

.field private static final TAG:Ljava/lang/String; = "BatterySManager"

.field public static alertDialog:Landroid/app/AlertDialog;

.field public static batteryLevel:I

.field public static countDown:Landroid/os/CountDownTimer;

.field public static countPreventedShutdowns:I

.field public static fakeResBatteryOutline:I

.field public static fakeResPower:I

.field public static isOverride:Z

.field public static isPoweredLocked:Z

.field public static isScreenOn:Z

.field private static lastReload:J

.field public static mContext:Landroid/content/Context;

.field public static mHandler:Landroid/os/Handler;

.field public static mModRes:Landroid/content/res/XModuleResources;

.field public static mNotifManager:Landroid/app/NotificationManager;

.field public static mReceiver:Landroid/content/BroadcastReceiver;

.field public static myObject:Ljava/lang/Object;

.field public static prefChosenTime:I

.field public static prefDisableShutdown:Z

.field public static prefScreenOff:Z

.field public static prefTranslation:Z

.field public static prefs:Lde/robv/android/xposed/XSharedPreferences;

.field public static res:Landroid/content/res/Resources;

.field public static sharedPrefs:Landroid/content/SharedPreferences;

.field public static showedDialog:Z

.field public static shutdownReceiver:Landroid/content/BroadcastReceiver;

.field public static userDebugging:Z


# instance fields
.field final BATTERY_PLUGGED_AC:I

.field final BATTERY_PLUGGED_ANY:I

.field final BATTERY_PLUGGED_USB:I

.field final BATTERY_PLUGGED_WIRELESS:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 49
    const-class v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->PACKAGE_NAME:Ljava/lang/String;

    .line 59
    sput-object v3, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    .line 60
    sput-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showedDialog:Z

    .line 61
    const/4 v0, 0x1

    sput-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isScreenOn:Z

    .line 62
    sput-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefScreenOff:Z

    .line 63
    sput-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefTranslation:Z

    .line 64
    sput-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isPoweredLocked:Z

    .line 66
    sput-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefDisableShutdown:Z

    .line 67
    sput-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isOverride:Z

    .line 68
    const/16 v0, 0x3e7

    sput v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->batteryLevel:I

    .line 69
    sput v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countPreventedShutdowns:I

    .line 78
    const-wide/16 v0, 0x0

    sput-wide v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->lastReload:J

    .line 81
    sput v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResBatteryOutline:I

    .line 82
    sput v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResPower:I

    .line 83
    sput-object v3, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->MODULE_PATH:Ljava/lang/String;

    .line 89
    sput-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->userDebugging:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    const/4 v0, 0x1

    iput v0, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->BATTERY_PLUGGED_AC:I

    .line 91
    const/4 v0, 0x2

    iput v0, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->BATTERY_PLUGGED_USB:I

    .line 92
    const/4 v0, 0x4

    iput v0, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->BATTERY_PLUGGED_WIRELESS:I

    .line 93
    const/4 v0, 0x7

    iput v0, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->BATTERY_PLUGGED_ANY:I

    .line 441
    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-static {p0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->debugLog(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lde/robv/android/xposed/XSharedPreferences;)V
    .locals 0
    .param p0, "x0"    # Lde/robv/android/xposed/XSharedPreferences;

    .prologue
    .line 48
    invoke-static {p0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->reloadPrefs(Lde/robv/android/xposed/XSharedPreferences;)V

    return-void
.end method

.method static synthetic access$200(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showNotification()V

    return-void
.end method

.method static synthetic access$300(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    invoke-direct {p0, p1}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->terminateDialog(Z)V

    return-void
.end method

.method static synthetic access$400(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-static {p0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->debugLine(Ljava/lang/String;)V

    return-void
.end method

.method public static callProcessValues()V
    .locals 6

    .prologue
    .line 461
    const-string v1, "callProcessValues"

    invoke-static {v1}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->debugLog(Ljava/lang/String;)V

    .line 463
    :try_start_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_0

    .line 464
    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->myObject:Ljava/lang/Object;

    const-string v2, "processValuesLocked"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Lde/robv/android/xposed/XposedHelpers;->callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 474
    .local v0, "t":Ljava/lang/Throwable;
    :goto_0
    return-void

    .line 465
    .end local v0    # "t":Ljava/lang/Throwable;
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x11

    if-lt v1, v2, :cond_1

    .line 466
    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->myObject:Ljava/lang/Object;

    const-string v2, "processValuesLocked"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v3}, Lde/robv/android/xposed/XposedHelpers;->callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 470
    :catch_0
    move-exception v0

    .line 471
    .restart local v0    # "t":Ljava/lang/Throwable;
    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 468
    .end local v0    # "t":Ljava/lang/Throwable;
    :cond_1
    :try_start_1
    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->myObject:Ljava/lang/Object;

    const-string v2, "processValues"

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1, v2, v3}, Lde/robv/android/xposed/XposedHelpers;->callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private static debugLine(Ljava/lang/String;)V
    .locals 3
    .param p0, "debugMessage"    # Ljava/lang/String;

    .prologue
    .line 104
    sget-boolean v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->userDebugging:Z

    if-eqz v1, :cond_0

    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ". batteryLevel="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->batteryLevel:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", isPoweredLocked="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isPoweredLocked:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", prefChosenTime="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefChosenTime:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", alertDialog="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    if-nez v1, :cond_1

    const-string v1, "null"

    .line 108
    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", showedDialog="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showedDialog:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", prefScreenOff="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefScreenOff:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", prefDisableShutdown="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefDisableShutdown:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", isScreenOn="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isScreenOn:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, "entry":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BatterySManager: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 115
    .end local v0    # "entry":Ljava/lang/String;
    :cond_0
    return-void

    .line 105
    :cond_1
    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    .line 108
    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0
.end method

.method private static debugLog(Ljava/lang/String;)V
    .locals 2
    .param p0, "entry"    # Ljava/lang/String;

    .prologue
    .line 97
    sget-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->userDebugging:Z

    if-eqz v0, :cond_0

    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BatterySManager: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 100
    :cond_0
    return-void
.end method

.method private static reloadPrefs(Lde/robv/android/xposed/XSharedPreferences;)V
    .locals 4
    .param p0, "prefs"    # Lde/robv/android/xposed/XSharedPreferences;

    .prologue
    .line 477
    sget-wide v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->lastReload:J

    const-wide/16 v2, 0x7d0

    add-long/2addr v0, v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 478
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    sput-wide v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->lastReload:J

    .line 479
    invoke-virtual {p0}, Lde/robv/android/xposed/XSharedPreferences;->reload()V

    .line 481
    :cond_0
    return-void
.end method

.method private showNotification()V
    .locals 12

    .prologue
    const/high16 v11, 0x8000000

    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 318
    new-instance v0, Landroid/support/v4/app/NotificationCompat$Builder;

    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    invoke-direct {v0, v7}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 319
    .local v0, "build":Landroid/support/v4/app/NotificationCompat$Builder;
    invoke-virtual {v0, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 320
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-lt v7, v8, :cond_0

    .line 321
    invoke-virtual {v0, v9}, Landroid/support/v4/app/NotificationCompat$Builder;->setVisibility(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 323
    :cond_0
    sget v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResBatteryOutline:I

    if-nez v7, :cond_1

    const v1, 0x1080027

    .line 324
    .local v1, "icon":I
    :goto_0
    invoke-virtual {v0, v1}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 325
    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    const v8, 0x7f070026

    invoke-virtual {v7, v8}, Landroid/content/res/XModuleResources;->getString(I)Ljava/lang/String;

    move-result-object v7

    new-array v8, v9, [Ljava/lang/Object;

    sget v9, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countPreventedShutdowns:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 326
    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    const v8, 0x7f070025

    invoke-virtual {v7, v8}, Landroid/content/res/XModuleResources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 328
    new-instance v3, Landroid/content/Intent;

    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;->BATTERY_SM_SHUTDOWN:Ljava/lang/String;

    invoke-direct {v3, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 329
    .local v3, "nextIntent":Landroid/content/Intent;
    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    invoke-static {v7, v10, v3, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v5

    .line 331
    .local v5, "nextPendingIntent":Landroid/app/PendingIntent;
    new-instance v4, Landroid/content/Intent;

    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;->BATTERY_SM_DISMISS:Ljava/lang/String;

    invoke-direct {v4, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 332
    .local v4, "nextIntent2":Landroid/content/Intent;
    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    invoke-static {v7, v10, v4, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 334
    .local v6, "nextPendingIntent2":Landroid/app/PendingIntent;
    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    const v8, 0x7f070024

    invoke-virtual {v7, v8}, Landroid/content/res/XModuleResources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 335
    .local v2, "msg":Ljava/lang/String;
    new-instance v7, Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    invoke-direct {v7}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;-><init>()V

    invoke-virtual {v7, v2}, Landroid/support/v4/app/NotificationCompat$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$BigTextStyle;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/support/v4/app/NotificationCompat$Builder;->setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 336
    const v7, 0x1080038

    sget-object v8, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    const v9, 0x7f070023

    invoke-virtual {v8, v9}, Landroid/content/res/XModuleResources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8, v6}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 337
    sget v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResPower:I

    const-string v8, "power_off"

    invoke-virtual {p0, v8}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v7, v8, v5}, Landroid/support/v4/app/NotificationCompat$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 339
    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mNotifManager:Landroid/app/NotificationManager;

    const v8, 0x3b9ac9ff

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 340
    return-void

    .line 323
    .end local v1    # "icon":I
    .end local v2    # "msg":Ljava/lang/String;
    .end local v3    # "nextIntent":Landroid/content/Intent;
    .end local v4    # "nextIntent2":Landroid/content/Intent;
    .end local v5    # "nextPendingIntent":Landroid/app/PendingIntent;
    .end local v6    # "nextPendingIntent2":Landroid/app/PendingIntent;
    :cond_1
    sget v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResBatteryOutline:I

    goto/16 :goto_0
.end method

.method private terminateDialog(Z)V
    .locals 2
    .param p1, "processValues"    # Z

    .prologue
    const/4 v1, 0x0

    .line 389
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 390
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 391
    sput-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    .line 393
    :cond_0
    if-eqz p1, :cond_1

    .line 394
    const/4 v0, 0x1

    sput-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isOverride:Z

    .line 395
    const-string v0, "Dismiss dialog, callProcessValues"

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->debugLog(Ljava/lang/String;)V

    .line 396
    invoke-static {}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->callProcessValues()V

    .line 398
    :cond_1
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countDown:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_2

    .line 399
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countDown:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 400
    sput-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countDown:Landroid/os/CountDownTimer;

    .line 402
    :cond_2
    return-void
.end method


# virtual methods
.method public getSystemString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const v4, 0x7f070014

    .line 405
    sget-object v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->res:Landroid/content/res/Resources;

    if-nez v2, :cond_0

    .line 406
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    sput-object v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->res:Landroid/content/res/Resources;

    .line 408
    :cond_0
    sget-object v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->res:Landroid/content/res/Resources;

    if-eqz v2, :cond_1

    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefTranslation:Z

    if-nez v2, :cond_2

    .line 409
    :cond_1
    invoke-static {p1}, Lcom/thetonyp/batteryshutdownmanager/Utils;->getDefaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 425
    :goto_0
    return-object v2

    .line 412
    :cond_2
    const-string v2, "lockscreen_low_battery"

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 413
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "testing: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    invoke-virtual {v3, v4}, Landroid/content/res/XModuleResources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->debugLog(Ljava/lang/String;)V

    .line 414
    sget-object v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    invoke-virtual {v2, v4}, Landroid/content/res/XModuleResources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 417
    :cond_3
    sget-object v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->res:Landroid/content/res/Resources;

    const-string v3, "string"

    const-string v4, "android"

    invoke-virtual {v2, p1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 418
    .local v1, "id":I
    if-nez v1, :cond_4

    .line 419
    invoke-static {p1}, Lcom/thetonyp/batteryshutdownmanager/Utils;->getDefaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 423
    :cond_4
    :try_start_0
    sget-object v2, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->res:Landroid/content/res/Resources;

    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 424
    :catch_0
    move-exception v0

    .line 425
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    invoke-static {p1}, Lcom/thetonyp/batteryshutdownmanager/Utils;->getDefaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public handleInitPackageResources(Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;)V
    .locals 3
    .param p1, "resparam"    # Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;

    .prologue
    .line 134
    iget-object v0, p1, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;->packageName:Ljava/lang/String;

    const-string v1, "android"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 138
    sget v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResBatteryOutline:I

    if-nez v0, :cond_0

    .line 139
    iget-object v0, p1, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;->res:Landroid/content/res/XResources;

    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    const v2, 0x7f020048

    invoke-virtual {v0, v1, v2}, Landroid/content/res/XResources;->addResource(Landroid/content/res/Resources;I)I

    move-result v0

    sput v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResBatteryOutline:I

    .line 141
    :cond_0
    sget v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResPower:I

    if-nez v0, :cond_1

    .line 142
    iget-object v0, p1, Lde/robv/android/xposed/callbacks/XC_InitPackageResources$InitPackageResourcesParam;->res:Landroid/content/res/XResources;

    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    const v2, 0x7f020049

    invoke-virtual {v0, v1, v2}, Landroid/content/res/XResources;->addResource(Landroid/content/res/Resources;I)I

    move-result v0

    sput v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->fakeResPower:I

    .line 146
    :cond_1
    return-void
.end method

.method public handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V
    .locals 10
    .param p1, "lpparam"    # Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v9, 0x0

    .line 150
    iget-object v4, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;

    sget-object v5, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 152
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->PACKAGE_NAME:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".SettingsFragment"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    const-string v6, "xposedVersionCheck"

    new-array v7, v7, [Ljava/lang/Object;

    const/16 v8, 0xc

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v8}, Lde/robv/android/xposed/XC_MethodReplacement;->returnConstant(Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodReplacement;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v4, v5, v6, v7}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/String;Ljava/lang/ClassLoader;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;

    .line 314
    :cond_0
    :goto_0
    return-void

    .line 156
    :cond_1
    const-string v4, "android"

    iget-object v5, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->packageName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 159
    const-string v4, "com.android.server.BatteryService"

    iget-object v5, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    invoke-static {v4, v5}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v1

    .line 160
    .local v1, "classBatteryService":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "android.app.ActivityManagerNative"

    iget-object v5, p1, Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;->classLoader:Ljava/lang/ClassLoader;

    invoke-static {v4, v5}, Lde/robv/android/xposed/XposedHelpers;->findClass(Ljava/lang/String;Ljava/lang/ClassLoader;)Ljava/lang/Class;

    move-result-object v0

    .line 164
    .local v0, "classActivityManagerNative":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x11

    if-lt v4, v5, :cond_2

    .line 165
    const-string v2, "shutdownIfNoPowerLocked"

    .line 171
    .local v2, "shutdownMethod":Ljava/lang/String;
    :goto_1
    const/4 v4, 0x1

    :try_start_0
    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    new-instance v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;

    invoke-direct {v6, p0, v0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;-><init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;Ljava/lang/Class;)V

    aput-object v6, v4, v5

    invoke-static {v1, v2, v4}, Lde/robv/android/xposed/XposedHelpers;->findAndHookMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Lde/robv/android/xposed/XC_MethodHook$Unhook;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 310
    :catch_0
    move-exception v3

    .line 311
    .local v3, "t":Ljava/lang/Throwable;
    const-string v4, "BatterySM: ERROR: Hook failed, it appears as if your ROM is not supported! Please contact the developer if you want support for your ROM."

    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 312
    invoke-static {v3}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 167
    .end local v2    # "shutdownMethod":Ljava/lang/String;
    .end local v3    # "t":Ljava/lang/Throwable;
    :cond_2
    const-string v2, "shutdownIfNoPower"

    .restart local v2    # "shutdownMethod":Ljava/lang/String;
    goto :goto_1
.end method

.method public initZygote(Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;)V
    .locals 3
    .param p1, "startupParam"    # Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 119
    iget-object v0, p1, Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;->modulePath:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/content/res/XModuleResources;->createInstance(Ljava/lang/String;Landroid/content/res/XResources;)Landroid/content/res/XModuleResources;

    move-result-object v0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mModRes:Landroid/content/res/XModuleResources;

    .line 120
    iget-object v0, p1, Lde/robv/android/xposed/IXposedHookZygoteInit$StartupParam;->modulePath:Ljava/lang/String;

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->MODULE_PATH:Ljava/lang/String;

    .line 122
    new-instance v0, Lde/robv/android/xposed/XSharedPreferences;

    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->PACKAGE_NAME:Ljava/lang/String;

    invoke-direct {v0, v1}, Lde/robv/android/xposed/XSharedPreferences;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    .line 123
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    invoke-virtual {v0}, Lde/robv/android/xposed/XSharedPreferences;->makeWorldReadable()Z

    .line 125
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 127
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    const-string v1, "pref_debug"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lde/robv/android/xposed/XSharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->userDebugging:Z

    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Debug Mode Enabled. v1.1, Android "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " (SDK "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->debugLog(Ljava/lang/String;)V

    .line 129
    const-string v0, "Battery Shutdown Manager debug logging is enabled. If you do not need the log output disable it in the app."

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->debugLog(Ljava/lang/String;)V

    .line 130
    return-void
.end method

.method public showShutdownDialog(Landroid/content/Context;)V
    .locals 7
    .param p1, "mContext"    # Landroid/content/Context;

    .prologue
    .line 343
    const-string v0, "shutdown_progress"

    invoke-virtual {p0, v0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 345
    .local v6, "shutdownString":Ljava/lang/String;
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    .line 346
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCancelable(Z)V

    .line 347
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0, v6}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 348
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "shutdown_confirm"

    invoke-virtual {p0, v2}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "lockscreen_low_battery"

    invoke-virtual {p0, v2}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 349
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    const v1, 0x1010355

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setIconAttribute(I)V

    .line 350
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x7d9

    invoke-virtual {v0, v1}, Landroid/view/Window;->setType(I)V

    .line 352
    sget-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isScreenOn:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefScreenOff:Z

    if-eqz v0, :cond_1

    .line 353
    :cond_0
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x200000

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 357
    :cond_1
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    const/4 v1, -0x1

    const-string v2, "power_off"

    invoke-virtual {p0, v2}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$2;

    invoke-direct {v3, p0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$2;-><init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 363
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 365
    new-instance v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$3;

    sget v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefChosenTime:I

    mul-int/lit16 v1, v1, 0x3e8

    int-to-long v2, v1

    const-wide/16 v4, 0x1f4

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$3;-><init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;JJLjava/lang/String;)V

    .line 380
    invoke-virtual {v0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$3;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countDown:Landroid/os/CountDownTimer;

    .line 381
    return-void
.end method
