.class Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$2;
.super Ljava/lang/Object;
.source "BatteryDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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


# direct methods
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    .prologue
    .line 357
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$2;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 359
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$2;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$300(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;Z)V

    .line 360
    return-void
.end method
