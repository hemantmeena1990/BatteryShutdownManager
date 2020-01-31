.class Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$3;
.super Landroid/os/CountDownTimer;
.source "BatteryDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showShutdownDialog(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

.field final synthetic val$shutdownString:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;JJLjava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;
    .param p2, "x0"    # J
    .param p4, "x1"    # J

    .prologue
    .line 365
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$3;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    iput-object p6, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$3;->val$shutdownString:Ljava/lang/String;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 2

    .prologue
    .line 378
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$3;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$300(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;Z)V

    .line 379
    return-void
.end method

.method public onTick(J)V
    .locals 5
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 368
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    if-eqz v0, :cond_0

    .line 369
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$3;->val$shutdownString:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-wide/16 v2, 0x3e8

    div-long v2, p1, v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 374
    :goto_0
    return-void

    .line 371
    :cond_0
    const-string v0, "WARNING: alertDialog == null"

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$000(Ljava/lang/String;)V

    goto :goto_0
.end method
