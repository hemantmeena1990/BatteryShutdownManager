.class public Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"


# instance fields
.field public mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 81
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 83
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const v2, 0x1020002

    invoke-virtual {v1, v2}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    .line 84
    .local v0, "fragment":Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;
    if-eqz v0, :cond_0

    .line 85
    invoke-virtual {v0, p1, p2, p3}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 87
    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 26
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    iput-object p0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;->mContext:Landroid/content/Context;

    .line 29
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x1020002

    new-instance v2, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;-><init>()V

    invoke-virtual {v0, v1, v2}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 30
    const/high16 v0, 0x7f060000

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;IZ)V

    .line 31
    return-void
.end method

.method public onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 56
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onCreateView(Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    .line 57
    .local v0, "result":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 77
    .end local v0    # "result":Landroid/view/View;
    :goto_0
    return-object v0

    .line 61
    .restart local v0    # "result":Landroid/view/View;
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_2

    .line 64
    const/4 v1, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_1
    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 77
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .line 64
    :sswitch_0
    const-string v2, "EditText"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :sswitch_1
    const-string v2, "Spinner"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :sswitch_2
    const-string v2, "CheckBox"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x2

    goto :goto_1

    :sswitch_3
    const-string v2, "RadioButton"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x3

    goto :goto_1

    :sswitch_4
    const-string v2, "CheckedTextView"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v1, 0x4

    goto :goto_1

    .line 66
    :pswitch_0
    new-instance v0, Landroid/support/v7/widget/AppCompatEditText;

    .end local v0    # "result":Landroid/view/View;
    invoke-direct {v0, p0, p3}, Landroid/support/v7/widget/AppCompatEditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_0

    .line 68
    .restart local v0    # "result":Landroid/view/View;
    :pswitch_1
    new-instance v0, Landroid/support/v7/widget/AppCompatSpinner;

    .end local v0    # "result":Landroid/view/View;
    invoke-direct {v0, p0, p3}, Landroid/support/v7/widget/AppCompatSpinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_0

    .line 70
    .restart local v0    # "result":Landroid/view/View;
    :pswitch_2
    new-instance v0, Landroid/support/v7/widget/AppCompatCheckBox;

    .end local v0    # "result":Landroid/view/View;
    invoke-direct {v0, p0, p3}, Landroid/support/v7/widget/AppCompatCheckBox;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_0

    .line 72
    .restart local v0    # "result":Landroid/view/View;
    :pswitch_3
    new-instance v0, Landroid/support/v7/widget/AppCompatRadioButton;

    .end local v0    # "result":Landroid/view/View;
    invoke-direct {v0, p0, p3}, Landroid/support/v7/widget/AppCompatRadioButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_0

    .line 74
    .restart local v0    # "result":Landroid/view/View;
    :pswitch_4
    new-instance v0, Landroid/support/v7/widget/AppCompatCheckedTextView;

    .end local v0    # "result":Landroid/view/View;
    invoke-direct {v0, p0, p3}, Landroid/support/v7/widget/AppCompatCheckedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    goto :goto_0

    .line 64
    :sswitch_data_0
    .sparse-switch
        -0x56c015e7 -> :sswitch_4
        -0x1440b607 -> :sswitch_1
        0x2e46a6ed -> :sswitch_3
        0x5f7507c3 -> :sswitch_2
        0x63577677 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected onPostCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v4, 0x0

    .line 40
    invoke-super {p0, p1}, Landroid/app/Activity;->onPostCreate(Landroid/os/Bundle;)V

    .line 42
    const v2, 0x102000a

    invoke-virtual {p0, v2}, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 43
    .local v1, "root":Landroid/widget/LinearLayout;
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f04002c

    invoke-virtual {v2, v3, v1, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 44
    .local v0, "bar":Landroid/support/v7/widget/Toolbar;
    invoke-virtual {v1, v0, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    .line 45
    new-instance v2, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity$1;

    invoke-direct {v2, p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity$1;-><init>(Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;)V

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 51
    return-void
.end method

.method public restartFragment()V
    .locals 4

    .prologue
    .line 90
    new-instance v0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    invoke-direct {v0}, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;-><init>()V

    .line 91
    .local v0, "fragment":Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;
    invoke-virtual {p0}, Lcom/thetonyp/batteryshutdownmanager/SettingsActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 92
    .local v1, "ft":Landroid/app/FragmentTransaction;
    const/high16 v2, 0x10b0000

    const v3, 0x10b0001

    invoke-virtual {v1, v2, v3}, Landroid/app/FragmentTransaction;->setCustomAnimations(II)Landroid/app/FragmentTransaction;

    move-result-object v2

    const v3, 0x1020002

    invoke-virtual {v2, v3, v0}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    .line 93
    invoke-virtual {v1}, Landroid/app/FragmentTransaction;->commit()I

    .line 94
    return-void
.end method
