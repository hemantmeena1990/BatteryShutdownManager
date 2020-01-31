.class public Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;
.super Ljava/lang/Object;
.source "TabLayout.java"

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TabLayoutOnPageChangeListener"
.end annotation


# instance fields
.field private mScrollState:I

.field private final mTabLayoutRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/support/design/widget/TabLayout;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/support/design/widget/TabLayout;)V
    .locals 1
    .param p1, "tabLayout"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 1445
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1446
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mTabLayoutRef:Ljava/lang/ref/WeakReference;

    .line 1447
    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0
    .param p1, "state"    # I

    .prologue
    .line 1451
    iput p1, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    .line 1452
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 3
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .prologue
    const/4 v1, 0x1

    .line 1457
    iget-object v2, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mTabLayoutRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/TabLayout;

    .line 1458
    .local v0, "tabLayout":Landroid/support/design/widget/TabLayout;
    if-eqz v0, :cond_0

    .line 1461
    iget v2, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mScrollState:I

    if-ne v2, v1, :cond_1

    :goto_0
    invoke-virtual {v0, p1, p2, v1}, Landroid/support/design/widget/TabLayout;->setScrollPosition(IFZ)V

    .line 1464
    :cond_0
    return-void

    .line 1461
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onPageSelected(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 1468
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;->mTabLayoutRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/TabLayout;

    .line 1469
    .local v0, "tabLayout":Landroid/support/design/widget/TabLayout;
    if-eqz v0, :cond_0

    .line 1470
    invoke-virtual {v0, p1}, Landroid/support/design/widget/TabLayout;->getTabAt(I)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/design/widget/TabLayout$Tab;->select()V

    .line 1472
    :cond_0
    return-void
.end method
