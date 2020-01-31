.class Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1$1;
.super Ljava/lang/Object;
.source "BatteryDialog.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;


# direct methods
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;

    .prologue
    .line 296
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1$1;->this$1:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 298
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1$1;->this$1:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;

    iget-object v0, v0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showShutdownDialog(Landroid/content/Context;)V

    .line 299
    return-void
.end method
