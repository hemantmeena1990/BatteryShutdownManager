.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$2;
.super Ljava/lang/Object;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    .prologue
    .line 282
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$2;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 285
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$2;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$000(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    .line 286
    return-void
.end method
