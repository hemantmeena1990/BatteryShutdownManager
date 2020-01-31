.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8$1;
.super Ljava/lang/Object;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;->onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;

.field final synthetic val$prefDisableShutdown:Landroid/preference/CheckBoxPreference;


# direct methods
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;Landroid/preference/CheckBoxPreference;)V
    .locals 0
    .param p1, "this$1"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;

    .prologue
    .line 600
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8$1;->this$1:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;

    iput-object p2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8$1;->val$prefDisableShutdown:Landroid/preference/CheckBoxPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    const/4 v2, 0x1

    .line 603
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8$1;->val$prefDisableShutdown:Landroid/preference/CheckBoxPreference;

    invoke-virtual {v0, v2}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 604
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8$1;->this$1:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;

    iget-object v0, v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    const-string v1, "pref_disable_shutdown"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$300(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 605
    return-void
.end method
