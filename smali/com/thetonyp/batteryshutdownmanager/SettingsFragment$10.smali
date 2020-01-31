.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$10;
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
    .line 641
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$10;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreferenceChange(Landroid/preference/Preference;Ljava/lang/Object;)Z
    .locals 6
    .param p1, "preference"    # Landroid/preference/Preference;
    .param p2, "newValue"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x1

    .line 643
    check-cast p2, Ljava/lang/Boolean;

    .end local p2    # "newValue":Ljava/lang/Object;
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_0

    move v2, v3

    .line 644
    .local v2, "componentState":I
    :goto_0
    iget-object v4, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$10;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-virtual {v4}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 645
    .local v0, "activity":Landroid/app/Activity;
    new-instance v1, Landroid/content/ComponentName;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$10;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-virtual {v5}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".SettingsActivity-Insert"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v0, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 646
    .local v1, "alias":Landroid/content/ComponentName;
    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    invoke-virtual {v4, v1, v2, v3}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 647
    return v3

    .line 643
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v1    # "alias":Landroid/content/ComponentName;
    .end local v2    # "componentState":I
    :cond_0
    const/4 v2, 0x2

    goto :goto_0
.end method
