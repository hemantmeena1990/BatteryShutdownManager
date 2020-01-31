.class public Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;
.super Landroid/preference/PreferenceFragment;
.source "SettingsFragment.java"

# interfaces
.implements Lcom/anjlab/android/iab/v3/BillingProcessor$IBillingHandler;


# static fields
.field public static final DEBUG:Z = false

.field static final SKU_PRO:Ljava/lang/String; = "com.thetonyp.batteryshutdownmanager.pro_0"

.field public static final TAG:Ljava/lang/String; = "BatterySManager"

.field public static alertDialog:Landroid/support/v7/app/AlertDialog;

.field public static countDown:Landroid/os/CountDownTimer;

.field private static isFreeloading:Z

.field private static isPro:Z

.field public static sharedPrefs:Landroid/content/SharedPreferences;

.field public static startupDialogsShown:Z

.field public static userDebugging:Z


# instance fields
.field private final ONE_DAY:J

.field public bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

.field private final buyProClickListener:Landroid/preference/Preference$OnPreferenceClickListener;

.field private final changeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

.field private final disableShutdownChangeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

.field private final formatter:Ljava/text/SimpleDateFormat;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SimpleDateFormat"
        }
    .end annotation
.end field

.field private final freeloadChangeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

.field public mBillingServiceReady:Z

.field private final testDialogClickListener:Landroid/preference/Preference$OnPreferenceClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 47
    sput-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->userDebugging:Z

    .line 48
    const/4 v0, 0x0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    .line 51
    sput-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    .line 52
    sput-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isFreeloading:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 41
    invoke-direct {p0}, Landroid/preference/PreferenceFragment;-><init>()V

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->mBillingServiceReady:Z

    .line 59
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->formatter:Ljava/text/SimpleDateFormat;

    .line 61
    const-wide/32 v0, 0x5265c00

    iput-wide v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->ONE_DAY:J

    .line 589
    new-instance v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;

    invoke-direct {v0, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$8;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    iput-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->disableShutdownChangeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

    .line 613
    new-instance v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$9;

    invoke-direct {v0, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$9;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    iput-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->freeloadChangeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

    .line 641
    new-instance v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$10;

    invoke-direct {v0, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$10;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    iput-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->changeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

    .line 650
    new-instance v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$11;

    invoke-direct {v0, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$11;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    iput-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->buyProClickListener:Landroid/preference/Preference$OnPreferenceClickListener;

    .line 658
    new-instance v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$12;

    invoke-direct {v0, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$12;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    iput-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->testDialogClickListener:Landroid/preference/Preference$OnPreferenceClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->terminateDialog()V

    return-void
.end method

.method static synthetic access$100(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;
    .param p1, "x1"    # I

    .prologue
    .line 41
    invoke-direct {p0, p1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->showSnack(I)V

    return-void
.end method

.method static synthetic access$200(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 41
    invoke-static {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0
    .param p0, "x0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/Boolean;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->putPref(Ljava/lang/String;Ljava/lang/Boolean;)V

    return-void
.end method

.method static synthetic access$402(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 41
    sput-boolean p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isFreeloading:Z

    return p0
.end method

.method static synthetic access$500(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->updateUI()V

    return-void
.end method

.method static synthetic access$600(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->updateFragment()V

    return-void
.end method

.method static synthetic access$700(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    .prologue
    .line 41
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->testDialog()V

    return-void
.end method

.method private static debugLog(Ljava/lang/String;)V
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .prologue
    .line 65
    sget-boolean v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->userDebugging:Z

    if-nez v0, :cond_0

    .line 66
    :goto_0
    return-void

    .line 65
    :cond_0
    const-string v0, "BatterySManager"

    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private disablePrefs([Landroid/preference/CheckBoxPreference;Z)V
    .locals 3
    .param p1, "cPrefs"    # [Landroid/preference/CheckBoxPreference;
    .param p2, "state"    # Z

    .prologue
    .line 434
    array-length v2, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v0, p1, v1

    .line 435
    .local v0, "i":Landroid/preference/CheckBoxPreference;
    invoke-virtual {v0, p2}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 436
    invoke-virtual {v0, p2}, Landroid/preference/CheckBoxPreference;->setSelectable(Z)V

    .line 434
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 438
    .end local v0    # "i":Landroid/preference/CheckBoxPreference;
    :cond_0
    return-void
.end method

.method private hookFailed()Z
    .locals 1

    .prologue
    .line 669
    const/4 v0, 0x0

    return v0
.end method

.method private isModuleActive()Z
    .locals 2

    .prologue
    .line 682
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->xposedVersionCheck()I

    move-result v0

    const/16 v1, 0xc

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isModuleActiveButOutdated()Z
    .locals 2

    .prologue
    .line 686
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->xposedVersionCheck()I

    move-result v0

    if-lez v0, :cond_0

    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->xposedVersionCheck()I

    move-result v0

    const/16 v1, 0xc

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private putPref(Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "pref"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Boolean;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .prologue
    .line 581
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 582
    return-void
.end method

.method private putPref(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "pref"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CommitPrefEdits"
        }
    .end annotation

    .prologue
    .line 586
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 587
    return-void
.end method

.method private showSnack(I)V
    .locals 3
    .param p1, "message"    # I

    .prologue
    .line 327
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/support/design/widget/Snackbar;->make(Landroid/view/View;II)Landroid/support/design/widget/Snackbar;

    move-result-object v0

    const-string v1, "Action"

    const/4 v2, 0x0

    .line 328
    invoke-virtual {v0, v1, v2}, Landroid/support/design/widget/Snackbar;->setAction(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Landroid/support/design/widget/Snackbar;

    move-result-object v0

    .line 329
    invoke-virtual {v0}, Landroid/support/design/widget/Snackbar;->show()V

    .line 330
    return-void
.end method

.method private showSnack(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 335
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/support/design/widget/Snackbar;->make(Landroid/view/View;Ljava/lang/CharSequence;I)Landroid/support/design/widget/Snackbar;

    move-result-object v0

    const-string v1, "Action"

    const/4 v2, 0x0

    .line 336
    invoke-virtual {v0, v1, v2}, Landroid/support/design/widget/Snackbar;->setAction(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Landroid/support/design/widget/Snackbar;

    move-result-object v0

    .line 337
    invoke-virtual {v0}, Landroid/support/design/widget/Snackbar;->show()V

    .line 338
    return-void
.end method

.method private showStartupDialogs()V
    .locals 10

    .prologue
    const/high16 v9, 0x1040000

    const/4 v8, 0x1

    const/4 v7, 0x0

    const v6, 0x7f0a0084

    const/4 v5, 0x0

    .line 441
    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->startupDialogsShown:Z

    if-eqz v2, :cond_1

    .line 544
    :cond_0
    :goto_0
    return-void

    .line 443
    :cond_1
    sput-boolean v8, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->startupDialogsShown:Z

    .line 444
    sget-object v2, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "first_run"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 445
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 446
    .local v1, "now":Ljava/util/Date;
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    .line 480
    .end local v1    # "now":Ljava/util/Date;
    :cond_2
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->hookFailed()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 481
    new-instance v2, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, v6}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v3, 0x7f070020

    .line 482
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070021

    .line 483
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 484
    invoke-virtual {v2, v7}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07001f

    new-instance v4, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$5;

    invoke-direct {v4, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$5;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    .line 485
    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 493
    invoke-virtual {v2, v9, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f020046

    .line 494
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setIcon(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 495
    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    .line 499
    :cond_3
    sget-object v2, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v3, "first_run"

    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    .line 502
    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->formatter:Ljava/text/SimpleDateFormat;

    new-instance v3, Ljava/util/Date;

    invoke-direct {v3}, Ljava/util/Date;-><init>()V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 503
    .local v0, "dateString":Ljava/lang/String;
    const-string v2, "first_run"

    invoke-direct {p0, v2, v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->putPref(Ljava/lang/String;Ljava/lang/String;)V

    .line 505
    new-instance v2, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, v6}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v3, 0x7f07001b

    .line 506
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07001c

    .line 507
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 508
    invoke-virtual {v2, v8}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x104000a

    .line 509
    invoke-virtual {v2, v3, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070022

    new-instance v4, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$6;

    invoke-direct {v4, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$6;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    .line 510
    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 521
    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    goto/16 :goto_0

    .line 526
    .end local v0    # "dateString":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isInstallerPresent()Z

    move-result v2

    if-nez v2, :cond_0

    .line 527
    new-instance v2, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, v6}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    const v3, 0x7f070020

    .line 528
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setTitle(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f070021

    .line 529
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 530
    invoke-virtual {v2, v7}, Landroid/support/v7/app/AlertDialog$Builder;->setCancelable(Z)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f07001f

    new-instance v4, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$7;

    invoke-direct {v4, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$7;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    .line 531
    invoke-virtual {v2, v3, v4}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 539
    invoke-virtual {v2, v9, v5}, Landroid/support/v7/app/AlertDialog$Builder;->setNeutralButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f020046

    .line 540
    invoke-virtual {v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setIcon(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v2

    .line 541
    invoke-virtual {v2}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    goto/16 :goto_0
.end method

.method private terminateDialog()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 315
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->countDown:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 316
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->countDown:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 317
    sput-object v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->countDown:Landroid/os/CountDownTimer;

    .line 319
    :cond_0
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->dismiss()V

    .line 320
    sput-object v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    .line 322
    return-void
.end method

.method private testDialog()V
    .locals 7

    .prologue
    .line 262
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->countDown:Landroid/os/CountDownTimer;

    if-eqz v0, :cond_0

    .line 263
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->countDown:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 264
    const/4 v0, 0x0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->countDown:Landroid/os/CountDownTimer;

    .line 266
    :cond_0
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    if-eqz v0, :cond_1

    .line 267
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->dismiss()V

    .line 268
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->cancel()V

    .line 271
    :cond_1
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v1, "pref_time"

    const-string v2, "1"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    .line 272
    .local v6, "time":I
    if-nez v6, :cond_2

    .line 273
    const v0, 0x7f070054

    invoke-direct {p0, v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->showSnack(I)V

    .line 312
    :goto_0
    return-void

    .line 277
    :cond_2
    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    .line 278
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setCancelable(Z)V

    .line 279
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    const-string v1, "shutdown_progress"

    invoke-virtual {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setTitle(Ljava/lang/CharSequence;)V

    .line 280
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "shutdown_confirm"

    invoke-virtual {p0, v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "lockscreen_low_battery"

    invoke-virtual {p0, v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 281
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    const v1, 0x1010355

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setIconAttribute(I)V

    .line 282
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    new-instance v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$2;

    invoke-direct {v1, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$2;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 290
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    const/4 v1, -0x1

    const-string v2, "power_off"

    invoke-virtual {p0, v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getSystemString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$3;

    invoke-direct {v3, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$3;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/support/v7/app/AlertDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 296
    sget-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->alertDialog:Landroid/support/v7/app/AlertDialog;

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    .line 298
    new-instance v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$4;

    mul-int/lit16 v1, v6, 0x3e8

    int-to-long v2, v1

    const-wide/16 v4, 0x1f4

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$4;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;JJ)V

    .line 310
    invoke-virtual {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$4;->start()Landroid/os/CountDownTimer;

    move-result-object v0

    sput-object v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->countDown:Landroid/os/CountDownTimer;

    goto/16 :goto_0
.end method

.method private updateFragment()V
    .locals 1

    .prologue
    .line 364
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    check-cast v0, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;

    invoke-virtual {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;->restartFragment()V

    .line 365
    return-void
.end method

.method private updateUI()V
    .locals 17

    .prologue
    .line 368
    const-string v13, "isPro=%b, isFreeLoading=%b"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    sget-boolean v16, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v16

    aput-object v16, v14, v15

    const/4 v15, 0x1

    sget-boolean v16, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isFreeloading:Z

    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 370
    invoke-virtual/range {p0 .. p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v11

    .line 371
    .local v11, "ps":Landroid/preference/PreferenceScreen;
    const-string v13, "pref_category_other"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v3

    check-cast v3, Landroid/preference/PreferenceCategory;

    .line 373
    .local v3, "categoryOther":Landroid/preference/PreferenceCategory;
    const-string v13, "pref_buy_pro"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v7

    .line 374
    .local v7, "prefPro":Landroid/preference/Preference;
    const-string v13, "pref_freeload"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v6

    check-cast v6, Landroid/preference/CheckBoxPreference;

    .line 376
    .local v6, "prefFreeload":Landroid/preference/CheckBoxPreference;
    const-string v13, "pref_time"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v9

    .line 377
    .local v9, "prefTime":Landroid/preference/Preference;
    const-string v13, "pref_translation"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v10

    check-cast v10, Landroid/preference/CheckBoxPreference;

    .line 380
    .local v10, "prefTranslation":Landroid/preference/CheckBoxPreference;
    const-string v13, "pref_screen_off"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v8

    check-cast v8, Landroid/preference/CheckBoxPreference;

    .line 382
    .local v8, "prefScreenOff":Landroid/preference/CheckBoxPreference;
    const-string v13, "pref_disable_shutdown"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v5

    check-cast v5, Landroid/preference/CheckBoxPreference;

    .line 383
    .local v5, "prefDisableShutdown":Landroid/preference/CheckBoxPreference;
    const/4 v13, 0x1

    new-array v2, v13, [Landroid/preference/CheckBoxPreference;

    const/4 v13, 0x0

    aput-object v5, v2, v13

    .line 385
    .local v2, "cPrefs":[Landroid/preference/CheckBoxPreference;
    const-string v13, "pref_attention"

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    .line 386
    .local v1, "attention":Landroid/preference/Preference;
    if-eqz v1, :cond_0

    invoke-direct/range {p0 .. p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->xposedVersionCheck()I

    move-result v13

    const/16 v14, 0xc

    if-ne v13, v14, :cond_0

    invoke-direct/range {p0 .. p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->hookFailed()Z

    move-result v13

    if-nez v13, :cond_0

    .line 387
    invoke-virtual {v11, v1}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 390
    :cond_0
    const/4 v12, 0x0

    .line 391
    .local v12, "state":Z
    sget-boolean v13, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    if-eqz v13, :cond_4

    .line 392
    if-eqz v7, :cond_1

    invoke-virtual {v11, v7}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    .line 393
    :cond_1
    if-eqz v6, :cond_2

    invoke-virtual {v3, v6}, Landroid/preference/PreferenceCategory;->removePreference(Landroid/preference/Preference;)Z

    .line 394
    :cond_2
    const/4 v13, 0x0

    sput-boolean v13, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isFreeloading:Z

    .line 395
    const/4 v12, 0x1

    .line 403
    :goto_0
    invoke-virtual {v9, v12}, Landroid/preference/Preference;->setSelectable(Z)V

    .line 404
    invoke-virtual {v9, v12}, Landroid/preference/Preference;->setEnabled(Z)V

    .line 405
    invoke-virtual {v10, v12}, Landroid/preference/CheckBoxPreference;->setSelectable(Z)V

    .line 406
    invoke-virtual {v10, v12}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 407
    invoke-virtual {v8, v12}, Landroid/preference/CheckBoxPreference;->setSelectable(Z)V

    .line 408
    invoke-virtual {v8, v12}, Landroid/preference/CheckBoxPreference;->setEnabled(Z)V

    .line 411
    const/4 v4, 0x0

    .line 412
    .local v4, "exp":Z
    sget-boolean v13, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    if-nez v13, :cond_6

    .line 425
    sget-object v13, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v14, "pref_disable_shutdown"

    const/4 v15, 0x0

    invoke-interface {v13, v14, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 426
    const/4 v13, 0x0

    invoke-virtual {v5, v13}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 427
    const-string v13, "pref_disable_shutdown"

    const/4 v14, 0x0

    invoke-static {v14}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-direct {v0, v13, v14}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->putPref(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 430
    :cond_3
    :goto_1
    move-object/from16 v0, p0

    invoke-direct {v0, v2, v4}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->disablePrefs([Landroid/preference/CheckBoxPreference;Z)V

    .line 431
    return-void

    .line 396
    .end local v4    # "exp":Z
    :cond_4
    sget-boolean v13, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isFreeloading:Z

    if-eqz v13, :cond_5

    .line 397
    const/4 v12, 0x1

    goto :goto_0

    .line 399
    :cond_5
    const/4 v12, 0x0

    .line 400
    const/4 v13, 0x0

    invoke-virtual {v10, v13}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 401
    const/4 v13, 0x0

    invoke-virtual {v8, v13}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    goto :goto_0

    .line 413
    .restart local v4    # "exp":Z
    :cond_6
    const/4 v4, 0x1

    goto :goto_1
.end method

.method private xposedVersionCheck()I
    .locals 1

    .prologue
    .line 674
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public getSystemString(Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 341
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    .line 342
    .local v2, "res":Landroid/content/res/Resources;
    if-eqz v2, :cond_0

    sget-object v3, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v4, "pref_translation"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_1

    .line 343
    :cond_0
    invoke-static {p1}, Lcom/thetonyp/batteryshutdownmanager/Utils;->getDefaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 358
    :goto_0
    return-object v3

    .line 346
    :cond_1
    const-string v3, "lockscreen_low_battery"

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 347
    const v3, 0x7f070014

    invoke-virtual {p0, v3}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 350
    :cond_2
    const-string v3, "string"

    const-string v4, "android"

    invoke-virtual {v2, p1, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 351
    .local v1, "id":I
    if-nez v1, :cond_3

    .line 352
    invoke-static {p1}, Lcom/thetonyp/batteryshutdownmanager/Utils;->getDefaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 356
    :cond_3
    :try_start_0
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 357
    :catch_0
    move-exception v0

    .line 358
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    invoke-static {p1}, Lcom/thetonyp/batteryshutdownmanager/Utils;->getDefaultString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public isInstallerPresent()Z
    .locals 2

    .prologue
    .line 678
    const-string v0, "de.robv.android.xposed.installer"

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/thetonyp/batteryshutdownmanager/Utils;->isPackageInstalled(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "pro.burgerz.wsm.manager"

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/thetonyp/batteryshutdownmanager/Utils;->isPackageInstalled(Ljava/lang/String;Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 563
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SettingsFragment onActivityResult: requestCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " resultCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p3}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 565
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-virtual {v0, p1, p2, p3}, Lcom/anjlab/android/iab/v3/BillingProcessor;->handleActivityResult(IILandroid/content/Intent;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 566
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ok: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 567
    invoke-super {p0, p1, p2, p3}, Landroid/preference/PreferenceFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 569
    :cond_0
    return-void
.end method

.method public onBillingError(ILjava/lang/Throwable;)V
    .locals 2
    .param p1, "errorCode"    # I
    .param p2, "error"    # Ljava/lang/Throwable;

    .prologue
    .line 226
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingError: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 227
    return-void
.end method

.method public onBillingInitialized()V
    .locals 2

    .prologue
    .line 199
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->mBillingServiceReady:Z

    .line 200
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-virtual {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->loadOwnedPurchasesFromGoogle()Z

    .line 201
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "BillingServiceReady: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->mBillingServiceReady:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 202
    return-void
.end method

.method public onButtonUpgradeClicked()V
    .locals 3

    .prologue
    .line 163
    iget-boolean v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->mBillingServiceReady:Z

    if-nez v0, :cond_0

    .line 164
    const v0, 0x7f070052

    invoke-direct {p0, v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->showSnack(I)V

    .line 170
    :goto_0
    return-void

    .line 168
    :cond_0
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string v2, "com.thetonyp.batteryshutdownmanager.pro_0"

    invoke-virtual {v0, v1, v2}, Lcom/anjlab/android/iab/v3/BillingProcessor;->purchase(Landroid/app/Activity;Ljava/lang/String;)Z

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 71
    invoke-super {p0, p1}, Landroid/preference/PreferenceFragment;->onCreate(Landroid/os/Bundle;)V

    .line 72
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/preference/PreferenceManager;->setSharedPreferencesMode(I)V

    .line 73
    const/high16 v1, 0x7f060000

    invoke-virtual {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->addPreferencesFromResource(I)V

    .line 75
    const-string v1, "pref_about"

    invoke-virtual {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const v3, 0x7f070015

    invoke-virtual {p0, v3}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const v3, 0x7f07002e

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "1.1"

    aput-object v5, v4, v6

    invoke-virtual {p0, v3, v4}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setTitle(Ljava/lang/CharSequence;)V

    .line 76
    const-string v1, "pref_launcher"

    invoke-virtual {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->changeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 79
    const-string v0, "miibiJanbGKQHKIg9W0baqefaaocaq8amiibcGkcaqeaMf5rsOgGnhAjuApXOHCjkG8aN3puKv0NJ82ElTtpQYQw0Rw8Ebd8DCqIvpboYWr2h2AQTL0CvWiiyKAZwAj/jaHxDWSsGS/1p4V8tbMKLOdAn2djgz1WWBdB+MUeY1IdDHuCrnV+KTsL+XlM/+xtDidt788ZncRvuGTOYFM1fduWtzYzIj5o0wCJMpcaJpCaSLIrS7TOhGqlY3outYeMExsgW0HAyJNFZ+sDBLUglbeX3KING7X/pTAF3RKDF9awtYoMdOpqLNxRFO4KqjUDgRQ5UGXD+QdQRZ6pFUNQihDAVfnJSf+rzeaqkrfXqADY5TxxJzp4G8vcCKHMj4hB0Widaqab"

    .line 81
    .local v0, "LICENCE_KEY":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    sput-object v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 82
    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "pref_freeload"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isFreeloading:Z

    .line 83
    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "pref_pro_temp"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    .line 84
    sget-object v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v2, "pref_debug"

    invoke-interface {v1, v2, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    sput-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->userDebugging:Z

    .line 86
    const-string v1, "pref_buy_pro"

    invoke-virtual {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->buyProClickListener:Landroid/preference/Preference$OnPreferenceClickListener;

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 87
    const-string v1, "pref_test_dialog"

    invoke-virtual {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->testDialogClickListener:Landroid/preference/Preference$OnPreferenceClickListener;

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOnPreferenceClickListener(Landroid/preference/Preference$OnPreferenceClickListener;)V

    .line 88
    const-string v1, "pref_freeload"

    invoke-virtual {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->freeloadChangeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 89
    const-string v1, "pref_disable_shutdown"

    invoke-virtual {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v1

    iget-object v2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->disableShutdownChangeListenerLauncher:Landroid/preference/Preference$OnPreferenceChangeListener;

    invoke-virtual {v1, v2}, Landroid/preference/Preference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 91
    new-instance v1, Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/Utils;->swapIt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3, p0}, Lcom/anjlab/android/iab/v3/BillingProcessor;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/anjlab/android/iab/v3/BillingProcessor$IBillingHandler;)V

    iput-object v1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

    .line 93
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->updateUI()V

    .line 94
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->showStartupDialogs()V

    .line 95
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 99
    const v5, 0x7f040020

    invoke-virtual {p1, v5, p2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 100
    .local v2, "v":Landroid/view/View;
    const v5, 0x7f0e0069

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .local v3, "warnView":Landroid/view/View;
    move-object v1, v3

    .line 101
    check-cast v1, Landroid/widget/TextView;

    .line 103
    .local v1, "tv":Landroid/widget/TextView;
    const-string v5, "pref_attention"

    invoke-virtual {p0, v5}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    .line 104
    .local v0, "prefAttention":Landroid/preference/Preference;
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isInstallerPresent()Z

    move-result v5

    if-nez v5, :cond_2

    .line 105
    const v5, 0x7f07005b

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    .line 106
    if-eqz v0, :cond_0

    .line 107
    const v5, 0x7f07002f

    invoke-virtual {v0, v5}, Landroid/preference/Preference;->setSummary(I)V

    .line 122
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isModuleActive()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->hookFailed()Z

    move-result v5

    if-nez v5, :cond_1

    const/16 v4, 0x8

    :cond_1
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    .line 123
    return-object v2

    .line 108
    :cond_2
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isModuleActiveButOutdated()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 109
    const v5, 0x7f070059

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    .line 110
    if-eqz v0, :cond_0

    .line 111
    const v5, 0x7f070033

    invoke-virtual {v0, v5}, Landroid/preference/Preference;->setSummary(I)V

    goto :goto_0

    .line 112
    :cond_3
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isModuleActive()Z

    move-result v5

    if-nez v5, :cond_4

    .line 113
    const v5, 0x7f070058

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    .line 114
    if-eqz v0, :cond_0

    .line 115
    const v5, 0x7f070031

    invoke-virtual {v0, v5}, Landroid/preference/Preference;->setSummary(I)V

    goto :goto_0

    .line 116
    :cond_4
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->hookFailed()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 117
    const v5, 0x7f07005a

    invoke-virtual {v1, v5}, Landroid/widget/TextView;->setText(I)V

    .line 118
    if-eqz v0, :cond_0

    .line 119
    const v5, 0x7f070030

    invoke-virtual {v0, v5}, Landroid/preference/Preference;->setSummary(I)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 573
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

    if-eqz v0, :cond_0

    .line 574
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-virtual {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->release()V

    .line 576
    :cond_0
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onDestroy()V

    .line 577
    return-void
.end method

.method public onPause()V
    .locals 4

    .prologue
    .line 182
    invoke-super {p0}, Landroid/preference/PreferenceFragment;->onPause()V

    .line 185
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    const-string v3, "shared_prefs"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .local v0, "sharedPrefsDir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getPreferenceManager()Landroid/preference/PreferenceManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/preference/PreferenceManager;->getSharedPreferencesName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".xml"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 187
    .local v1, "sharedPrefsFile":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 188
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Ljava/io/File;->setReadable(ZZ)Z

    .line 190
    :cond_0
    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 129
    invoke-super {p0, p1, p2}, Landroid/preference/PreferenceFragment;->onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z

    .line 132
    instance-of v0, p2, Landroid/preference/PreferenceScreen;

    if-eqz v0, :cond_0

    .line 133
    check-cast p2, Landroid/preference/PreferenceScreen;

    .end local p2    # "preference":Landroid/preference/Preference;
    invoke-virtual {p0, p2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->setUpNestedScreen(Landroid/preference/PreferenceScreen;)V

    .line 136
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onProductPurchased(Ljava/lang/String;Lcom/anjlab/android/iab/v3/TransactionDetails;)V
    .locals 3
    .param p1, "productId"    # Ljava/lang/String;
    .param p2, "details"    # Lcom/anjlab/android/iab/v3/TransactionDetails;

    .prologue
    const/4 v2, 0x1

    .line 209
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "purchased: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " | details: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/anjlab/android/iab/v3/TransactionDetails;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 211
    const-string v0, "com.thetonyp.batteryshutdownmanager.pro_0"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 212
    const v0, 0x7f070057

    invoke-direct {p0, v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->showSnack(I)V

    .line 213
    sput-boolean v2, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    .line 214
    const-string v0, "pref_pro_temp"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->putPref(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 216
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->updateUI()V

    .line 217
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->updateFragment()V

    .line 219
    :cond_0
    return-void
.end method

.method public onPurchaseHistoryRestored()V
    .locals 3

    .prologue
    .line 236
    sget-boolean v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    .line 237
    .local v0, "oldPro":Z
    const/4 v1, 0x0

    sput-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    .line 238
    iget-object v1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->bp:Lcom/anjlab/android/iab/v3/BillingProcessor;

    const-string v2, "com.thetonyp.batteryshutdownmanager.pro_0"

    invoke-virtual {v1, v2}, Lcom/anjlab/android/iab/v3/BillingProcessor;->isPurchased(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 239
    const-string v1, "purchase check success"

    invoke-static {v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 240
    const/4 v1, 0x1

    sput-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    .line 243
    :cond_0
    const-string v1, "pref_pro_temp"

    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {p0, v1, v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->putPref(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 245
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->updateUI()V

    .line 247
    if-eqz v0, :cond_1

    sget-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    if-nez v1, :cond_1

    .line 248
    const-string v1, "reverted incorrect purchase"

    invoke-static {v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 249
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->updateFragment()V

    .line 252
    :cond_1
    if-nez v0, :cond_2

    sget-boolean v1, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    if-eqz v1, :cond_2

    .line 253
    const v1, 0x7f070056

    invoke-direct {p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->showSnack(I)V

    .line 254
    invoke-direct {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->updateFragment()V

    .line 257
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "purchase history restored. isPro="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->isPro:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->debugLog(Ljava/lang/String;)V

    .line 259
    return-void
.end method

.method public setUpNestedScreen(Landroid/preference/PreferenceScreen;)V
    .locals 6
    .param p1, "preferenceScreen"    # Landroid/preference/PreferenceScreen;

    .prologue
    const/4 v5, 0x0

    .line 140
    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    .line 144
    .local v1, "dialog":Landroid/app/Dialog;
    const v3, 0x102000a

    invoke-virtual {v1, v3}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 145
    .local v2, "root":Landroid/widget/LinearLayout;
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f04002c

    invoke-virtual {v3, v4, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 146
    .local v0, "bar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {v2, v0, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 148
    invoke-virtual {p1}, Landroid/preference/PreferenceScreen;->getTitle()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 149
    const v3, 0x7f020016

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/Toolbar;->setNavigationIcon(I)V

    .line 151
    new-instance v3, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$1;

    invoke-direct {v3, p0, v1}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$1;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;Landroid/app/Dialog;)V

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 157
    return-void
.end method
