.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$11;
.super Ljava/lang/Object;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;
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
    .line 650
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$11;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceClick(Landroid/preference/Preference;)Z
    .locals 1
    .param p1, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 654
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$11;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-virtual {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->onButtonUpgradeClicked()V

    .line 655
    const/4 v0, 0x0

    return v0
.end method
