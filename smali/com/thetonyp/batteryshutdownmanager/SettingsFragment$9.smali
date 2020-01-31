.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$9;
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
    .line 613
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$9;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 5
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v4, 0x1

    .line 616
    iget-object v1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$9;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    const-string v2, "pref_freeload"

    invoke-virtual {v1, v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    .line 618
    .local v0, "prefFreeload":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0}, Landroid/preference/CheckBoxPreference;->isChecked()Z

    move-result v1

    if-nez v1, :cond_0

    .line 619
    invoke-static {v4}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$402(Z)Z

    .line 625
    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$9;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-virtual {v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f0a0084

    invoke-direct {v1, v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v2, 0x7f07001d

    .line 626
    invoke-virtual {v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f07001e

    .line 627
    invoke-virtual {v1, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    .line 628
    invoke-virtual {v1, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x104000a

    const/4 v3, 0x0

    .line 629
    invoke-virtual {v1, v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    .line 630
    invoke-virtual {v1}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    .line 634
    :goto_0
    iget-object v1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$9;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-static {v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$500(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    .line 635
    iget-object v1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$9;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-static {v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$600(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    .line 636
    return v4

    .line 632
    :cond_0
    const/4 v1, 0x0

    invoke-static {v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->access$402(Z)Z

    goto :goto_0
.end method
