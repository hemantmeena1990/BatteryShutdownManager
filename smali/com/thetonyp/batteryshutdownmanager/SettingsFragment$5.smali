.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$5;
.super Ljava/lang/Object;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->showStartupDialogs()V
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
    .line 485
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$5;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 487
    const-string v1, "http://forum.xda-developers.com/showthread.php?t=3105014"

    .line 488
    .local v1, "url":Ljava/lang/String;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 489
    .local v0, "i":Landroid/content/Intent;
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 490
    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$5;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-virtual {v2, v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->startActivity(Landroid/content/Intent;)V

    .line 491
    return-void
.end method
