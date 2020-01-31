.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$4;
.super Landroid/os/CountDownTimer;
.source "SettingsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->testDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;


# direct methods
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;JJ)V
    .locals 0
    .param p1, "this$0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;
    .param p2, "x0"    # J
    .param p4, "x1"    # J

    .prologue
    .line 298
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$4;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 1

    .prologue
    .line 306
    const-string v0, "dismiss dialog"

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$200(Ljava/lang/String;)V

    .line 307
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->dismiss()V

    .line 308
    const/4 v0, 0x0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    .line 309
    return-void
.end method

.method public onTick(J)V
    .locals 5
    .param p1, "millisUntilFinished"    # J

    .prologue
    .line 301
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$4;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    const-string v3, "shutdown_progress"

    invoke-virtual {v2, v3}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

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

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 302
    return-void
.end method
