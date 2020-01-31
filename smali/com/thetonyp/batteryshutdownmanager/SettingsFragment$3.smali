.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$3;
.super Ljava/lang/Object;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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
    .line 290
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$3;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I

    .prologue
    .line 292
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$3;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    const v1, 0x7f070055

    invoke-static {v0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$100(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;I)V

    .line 293
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$3;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$000(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    .line 294
    return-void
.end method
