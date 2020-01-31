.class Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$1;
.super Ljava/lang/Object;
.source "SettingsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;->setUpNestedScreen(Landroid/preference/PreferenceScreen;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

.field final synthetic val$dialog:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;Landroid/app/Dialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    .prologue
    .line 151
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/SettingsFragment;

    iput-object p2, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$1;->val$dialog:Landroid/app/Dialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 154
    iget-object v0, p0, Lcom/thetonyp/batteryshutdownmanager/SettingsFragment$1;->val$dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 155
    return-void
.end method
