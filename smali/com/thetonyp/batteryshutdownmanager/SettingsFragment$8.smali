.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;
.super Ljava/lang/Object;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/preference/Preference$OnPreferenceChangeListener;


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
    .line 589
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 592
    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    const-string v3, "pref_disable_shutdown"

    invoke-virtual {v2, v3}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 594
    .local v0, "prefDisableShutdown":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v2

    if-nez v2, :cond_0

    .line 595
    new-instance v2, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-virtual {v3}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f0a0084

    invoke-direct {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v3, 0x7f070017

    .line 596
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070018

    .line 597
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 598
    invoke-virtual {v2, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x1040009

    const/4 v4, 0x0

    .line 599
    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x1040013

    new-instance v4, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8$1;

    invoke-direct {v4, p0, v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8$1;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;Landroid/preference/CheckBoxPreference;)V

    .line 600
    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 607
    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    .line 610
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x1

    goto :goto_0
.end method
