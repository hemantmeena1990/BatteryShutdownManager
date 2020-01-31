.class public Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BatteryDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RebootReceiver"
.end annotation


# static fields
.field public static BATTERY_SM_DISMISS:Ljava/lang/String;

.field public static BATTERY_SM_SHUTDOWN:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 442
    const-string v0, "bsm_reboot"

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;->BATTERY_SM_SHUTDOWN:Ljava/lang/String;

    .line 443
    const-string v0, "bsm_dismiss"

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;->BATTERY_SM_DISMISS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 441
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 447
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;->BATTERY_SM_SHUTDOWN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 448
    const/4 v0, 0x1

    sput-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isOverride:Z

    .line 449
    invoke-static {}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->callProcessValues()V

    .line 457
    :cond_0
    :goto_0
    return-void

    .line 452
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;->BATTERY_SM_DISMISS:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 453
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mNotifManager:Landroid/app/NotificationManager;

    const v1, 0x3b9ac9ff

    invoke-virtual {v0, v1}, Landroid/app/NotificationManager;->cancel(I)V

    .line 454
    const/4 v0, 0x0

    sput v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countPreventedShutdowns:I

    goto :goto_0
.end method
