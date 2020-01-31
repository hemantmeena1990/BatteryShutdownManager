.class Lcom/thetonyp/batteryshutdownmanager/SettingsActivity$1;
.super Ljava/lang/Object;
.source "SettingsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;->onPostCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;


# direct methods
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;

    .prologue
    .line 45
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;

    invoke-virtual {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;->finish()V

    .line 49
    return-void
.end method
