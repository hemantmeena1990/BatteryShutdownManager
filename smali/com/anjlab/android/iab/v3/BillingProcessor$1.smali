.class Lcom/anjlab/android/iab/v3/BillingProcessor$1;
.super Ljava/lang/Object;
.source "BillingProcessor.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/anjlab/android/iab/v3/BillingProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;


# direct methods
.method constructor <init>(Lcom/anjlab/android/iab/v3/BillingProcessor;)V
    .locals 0
    .param p1, "this$0"    # Lcom/anjlab/android/iab/v3/BillingProcessor;

    .prologue
    .line 76
    iput-object p1, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 84
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-static {p2}, Lcom/android/vending/billing/IInAppBillingService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/vending/billing/IInAppBillingService;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/anjlab/android/iab/v3/BillingProcessor;->access$002(Lcom/anjlab/android/iab/v3/BillingProcessor;Lcom/android/vending/billing/IInAppBillingService;)Lcom/android/vending/billing/IInAppBillingService;

    .line 85
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-static {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->access$100(Lcom/anjlab/android/iab/v3/BillingProcessor;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-virtual {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->loadOwnedPurchasesFromGoogle()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 86
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-virtual {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->setPurchaseHistoryRestored()V

    .line 87
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-static {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->access$200(Lcom/anjlab/android/iab/v3/BillingProcessor;)Lcom/anjlab/android/iab/v3/BillingProcessor$IBillingHandler;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 88
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-static {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->access$200(Lcom/anjlab/android/iab/v3/BillingProcessor;)Lcom/anjlab/android/iab/v3/BillingProcessor$IBillingHandler;

    move-result-object v0

    invoke-interface {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor$IBillingHandler;->onPurchaseHistoryRestored()V

    .line 90
    :cond_0
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-static {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->access$200(Lcom/anjlab/android/iab/v3/BillingProcessor;)Lcom/anjlab/android/iab/v3/BillingProcessor$IBillingHandler;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 91
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    invoke-static {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor;->access$200(Lcom/anjlab/android/iab/v3/BillingProcessor;)Lcom/anjlab/android/iab/v3/BillingProcessor$IBillingHandler;

    move-result-object v0

    invoke-interface {v0}, Lcom/anjlab/android/iab/v3/BillingProcessor$IBillingHandler;->onBillingInitialized()V

    .line 92
    :cond_1
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2
    .param p1, "name"    # Landroid/content/ComponentName;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/anjlab/android/iab/v3/BillingProcessor$1;->this$0:Lcom/anjlab/android/iab/v3/BillingProcessor;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/anjlab/android/iab/v3/BillingProcessor;->access$002(Lcom/anjlab/android/iab/v3/BillingProcessor;Lcom/android/vending/billing/IInAppBillingService;)Lcom/android/vending/billing/IInAppBillingService;

    .line 80
    return-void
.end method
