.class public Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$ScreenReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BatteryDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ScreenReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;


# direct methods
.method public constructor <init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    .prologue
    .line 430
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$ScreenReceiver;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 433
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 434
    const/4 v0, 0x0

    sput-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isScreenOn:Z

    .line 438
    :cond_0
    :goto_0
    return-void

    .line 435
    :cond_1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 436
    const/4 v0, 0x1

    sput-boolean v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isScreenOn:Z

    goto :goto_0
.end method
