.class public Landroid/support/design/widget/AppBarLayout$Behavior;
.super Landroid/support/design/widget/ViewOffsetBehavior;
.source "AppBarLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/AppBarLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Behavior"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;,
        Landroid/support/design/widget/AppBarLayout$Behavior$FlingRunnable;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/design/widget/ViewOffsetBehavior",
        "<",
        "Landroid/support/design/widget/AppBarLayout;",
        ">;"
    }
.end annotation


# static fields
.field private static final INVALID_POSITION:I = -0x1


# instance fields
.field private mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

.field private mFlingRunnable:Ljava/lang/Runnable;

.field private mOffsetDelta:I

.field private mOffsetToChildIndexOnLayout:I

.field private mOffsetToChildIndexOnLayoutIsMinHeight:Z

.field private mOffsetToChildIndexOnLayoutPerc:F

.field private mScroller:Landroid/support/v4/widget/ScrollerCompat;

.field private mSkipNestedPreScroll:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 598
    invoke-direct {p0}, Landroid/support/design/widget/ViewOffsetBehavior;-><init>()V

    .line 594
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    .line 598
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 601
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/ViewOffsetBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 594
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    .line 602
    return-void
.end method

.method static synthetic access$100(Landroid/support/design/widget/AppBarLayout$Behavior;)Landroid/support/v4/widget/ScrollerCompat;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/AppBarLayout$Behavior;

    .prologue
    .line 583
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    return-object v0
.end method

.method private animateOffsetTo(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)V
    .locals 2
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "offset"    # I

    .prologue
    .line 704
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-nez v0, :cond_0

    .line 705
    invoke-static {}, Landroid/support/design/widget/ViewUtils;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    .line 706
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->DECELERATE_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 707
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    new-instance v1, Landroid/support/design/widget/AppBarLayout$Behavior$1;

    invoke-direct {v1, p0, p1, p2}, Landroid/support/design/widget/AppBarLayout$Behavior$1;-><init>(Landroid/support/design/widget/AppBarLayout$Behavior;Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;)V

    .line 718
    :goto_0
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v1

    invoke-virtual {v0, v1, p3}, Landroid/support/design/widget/ValueAnimatorCompat;->setIntValues(II)V

    .line 719
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->start()V

    .line 720
    return-void

    .line 715
    :cond_0
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    goto :goto_0
.end method

.method private dispatchOffsetUpdates(Landroid/support/design/widget/AppBarLayout;)V
    .locals 6
    .param p1, "layout"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 842
    invoke-static {p1}, Landroid/support/design/widget/AppBarLayout;->access$200(Landroid/support/design/widget/AppBarLayout;)Ljava/util/List;

    move-result-object v2

    .line 846
    .local v2, "listeners":Ljava/util/List;, "Ljava/util/List<Ljava/lang/ref/WeakReference<Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;>;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    .local v4, "z":I
    :goto_0
    if-ge v0, v4, :cond_2

    .line 847
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 848
    .local v3, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;>;"
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    move-object v1, v5

    .line 850
    .local v1, "listener":Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;
    :goto_1
    if-eqz v1, :cond_0

    .line 851
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopAndBottomOffset()I

    move-result v5

    invoke-interface {v1, p1, v5}, Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;->onOffsetChanged(Landroid/support/design/widget/AppBarLayout;I)V

    .line 846
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 848
    .end local v1    # "listener":Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1

    .line 854
    .end local v3    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;>;"
    :cond_2
    return-void
.end method

.method private fling(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;IIF)Z
    .locals 9
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "layout"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "minOffset"    # I
    .param p4, "maxOffset"    # I
    .param p5, "velocityY"    # F

    .prologue
    const/4 v1, 0x0

    .line 724
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mFlingRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 725
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mFlingRunnable:Ljava/lang/Runnable;

    invoke-virtual {p2, v0}, Landroid/support/design/widget/AppBarLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 728
    :cond_0
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    if-nez v0, :cond_1

    .line 729
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/widget/ScrollerCompat;->create(Landroid/content/Context;)Landroid/support/v4/widget/ScrollerCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    .line 732
    :cond_1
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v2

    invoke-static {p5}, Ljava/lang/Math;->round(F)I

    move-result v4

    move v3, v1

    move v5, v1

    move v6, v1

    move v7, p3

    move v8, p4

    invoke-virtual/range {v0 .. v8}, Landroid/support/v4/widget/ScrollerCompat;->fling(IIIIIIII)V

    .line 738
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mScroller:Landroid/support/v4/widget/ScrollerCompat;

    invoke-virtual {v0}, Landroid/support/v4/widget/ScrollerCompat;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 739
    new-instance v0, Landroid/support/design/widget/AppBarLayout$Behavior$FlingRunnable;

    invoke-direct {v0, p0, p1, p2}, Landroid/support/design/widget/AppBarLayout$Behavior$FlingRunnable;-><init>(Landroid/support/design/widget/AppBarLayout$Behavior;Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)V

    iput-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mFlingRunnable:Ljava/lang/Runnable;

    .line 740
    iget-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mFlingRunnable:Ljava/lang/Runnable;

    invoke-static {p2, v0}, Landroid/support/v4/view/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    .line 741
    const/4 v1, 0x1

    .line 744
    :goto_0
    return v1

    .line 743
    :cond_2
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mFlingRunnable:Ljava/lang/Runnable;

    goto :goto_0
.end method

.method private interpolateOffset(Landroid/support/design/widget/AppBarLayout;I)I
    .locals 13
    .param p1, "layout"    # Landroid/support/design/widget/AppBarLayout;
    .param p2, "offset"    # I

    .prologue
    .line 857
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    move-result v0

    .line 859
    .local v0, "absOffset":I
    const/4 v5, 0x0

    .local v5, "i":I
    invoke-virtual {p1}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v9

    .local v9, "z":I
    :goto_0
    if-ge v5, v9, :cond_1

    .line 860
    invoke-virtual {p1, v5}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 861
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/AppBarLayout$LayoutParams;

    .line 862
    .local v2, "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    invoke-virtual {v2}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollInterpolator()Landroid/view/animation/Interpolator;

    move-result-object v7

    .line 864
    .local v7, "interpolator":Landroid/view/animation/Interpolator;
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v10

    if-lt v0, v10, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v10

    if-gt v0, v10, :cond_2

    .line 865
    if-eqz v7, :cond_1

    .line 866
    const/4 v3, 0x0

    .line 867
    .local v3, "childScrollableHeight":I
    invoke-virtual {v2}, Landroid/support/design/widget/AppBarLayout$LayoutParams;->getScrollFlags()I

    move-result v4

    .line 868
    .local v4, "flags":I
    and-int/lit8 v10, v4, 0x1

    if-eqz v10, :cond_0

    .line 870
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v10

    add-int/2addr v3, v10

    .line 871
    and-int/lit8 v10, v4, 0x2

    if-eqz v10, :cond_0

    .line 873
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v10

    sub-int/2addr v3, v10

    .line 877
    :cond_0
    if-lez v3, :cond_1

    .line 878
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v10

    sub-int v8, v0, v10

    .line 879
    .local v8, "offsetForView":I
    int-to-float v10, v3

    int-to-float v11, v8

    int-to-float v12, v3

    div-float/2addr v11, v12

    invoke-interface {v7, v11}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v11

    mul-float/2addr v10, v11

    invoke-static {v10}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 883
    .local v6, "interpolatedDiff":I
    invoke-static {p2}, Ljava/lang/Integer;->signum(I)I

    move-result v10

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v11

    add-int/2addr v11, v6

    mul-int p2, v10, v11

    .line 893
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .end local v3    # "childScrollableHeight":I
    .end local v4    # "flags":I
    .end local v6    # "interpolatedDiff":I
    .end local v7    # "interpolator":Landroid/view/animation/Interpolator;
    .end local v8    # "offsetForView":I
    .end local p2    # "offset":I
    :cond_1
    return p2

    .line 859
    .restart local v1    # "child":Landroid/view/View;
    .restart local v2    # "childLp":Landroid/support/design/widget/AppBarLayout$LayoutParams;
    .restart local v7    # "interpolator":Landroid/view/animation/Interpolator;
    .restart local p2    # "offset":I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0
.end method

.method private scroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;III)I
    .locals 6
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "appBarLayout"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "dy"    # I
    .param p4, "minOffset"    # I
    .param p5, "maxOffset"    # I

    .prologue
    .line 793
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v0

    sub-int v3, v0, p3

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->setAppBarTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;III)I

    move-result v0

    return v0
.end method


# virtual methods
.method public bridge synthetic getLeftAndRightOffset()I
    .locals 1

    .prologue
    .line 583
    invoke-super {p0}, Landroid/support/design/widget/ViewOffsetBehavior;->getLeftAndRightOffset()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getTopAndBottomOffset()I
    .locals 1

    .prologue
    .line 583
    invoke-super {p0}, Landroid/support/design/widget/ViewOffsetBehavior;->getTopAndBottomOffset()I

    move-result v0

    return v0
.end method

.method final getTopBottomOffsetForScrollingSibling()I
    .locals 2

    .prologue
    .line 897
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopAndBottomOffset()I

    move-result v0

    iget v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetDelta:I

    add-int/2addr v0, v1

    return v0
.end method

.method public onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)Z
    .locals 5
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "appBarLayout"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "layoutDirection"    # I

    .prologue
    .line 771
    invoke-super {p0, p1, p2, p3}, Landroid/support/design/widget/ViewOffsetBehavior;->onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z

    move-result v1

    .line 773
    .local v1, "handled":Z
    iget v3, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    if-ltz v3, :cond_0

    .line 774
    iget v3, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    invoke-virtual {p2, v3}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 775
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v3

    neg-int v2, v3

    .line 776
    .local v2, "offset":I
    iget-boolean v3, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayoutIsMinHeight:Z

    if-eqz v3, :cond_1

    .line 777
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v3

    add-int/2addr v2, v3

    .line 781
    :goto_0
    invoke-virtual {p0, v2}, Landroid/support/design/widget/AppBarLayout$Behavior;->setTopAndBottomOffset(I)Z

    .line 782
    const/4 v3, -0x1

    iput v3, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    .line 786
    .end local v0    # "child":Landroid/view/View;
    .end local v2    # "offset":I
    :cond_0
    invoke-direct {p0, p2}, Landroid/support/design/widget/AppBarLayout$Behavior;->dispatchOffsetUpdates(Landroid/support/design/widget/AppBarLayout;)V

    .line 788
    return v1

    .line 779
    .restart local v0    # "child":Landroid/view/View;
    .restart local v2    # "offset":I
    :cond_1
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayoutPerc:F

    mul-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    add-int/2addr v2, v3

    goto :goto_0
.end method

.method public bridge synthetic onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 1
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # I

    .prologue
    .line 583
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    .end local p2    # "x1":Landroid/view/View;
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/design/widget/AppBarLayout$Behavior;->onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)Z

    move-result v0

    return v0
.end method

.method public onNestedFling(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;FFZ)Z
    .locals 7
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "target"    # Landroid/view/View;
    .param p4, "velocityX"    # F
    .param p5, "velocityY"    # F
    .param p6, "consumed"    # Z

    .prologue
    const/4 v4, 0x0

    .line 665
    if-nez p6, :cond_1

    .line 667
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    neg-int v3, v0

    neg-float v5, p5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->fling(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;IIF)Z

    move-result v4

    .line 699
    :cond_0
    :goto_0
    return v4

    .line 672
    :cond_1
    const/4 v0, 0x0

    cmpg-float v0, p5, v0

    if-gez v0, :cond_3

    .line 674
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getDownNestedPreScrollRange()I

    move-result v1

    add-int v6, v0, v1

    .line 677
    .local v6, "targetScroll":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v0

    if-gt v0, v6, :cond_0

    .line 693
    :cond_2
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v0

    if-eq v0, v6, :cond_0

    .line 694
    invoke-direct {p0, p1, p2, v6}, Landroid/support/design/widget/AppBarLayout$Behavior;->animateOffsetTo(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)V

    .line 695
    const/4 v4, 0x1

    goto :goto_0

    .line 684
    .end local v6    # "targetScroll":I
    :cond_3
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getUpNestedPreScrollRange()I

    move-result v0

    neg-int v6, v0

    .line 686
    .restart local v6    # "targetScroll":I
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v0

    if-ge v0, v6, :cond_2

    goto :goto_0
.end method

.method public bridge synthetic onNestedFling(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;FFZ)Z
    .locals 7
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Landroid/view/View;
    .param p4, "x3"    # F
    .param p5, "x4"    # F
    .param p6, "x5"    # Z

    .prologue
    .line 583
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Landroid/support/design/widget/AppBarLayout$Behavior;->onNestedFling(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;FFZ)Z

    move-result v0

    return v0
.end method

.method public onNestedPreScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;II[I)V
    .locals 7
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "target"    # Landroid/view/View;
    .param p4, "dx"    # I
    .param p5, "dy"    # I
    .param p6, "consumed"    # [I

    .prologue
    .line 622
    if-eqz p5, :cond_0

    iget-boolean v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mSkipNestedPreScroll:Z

    if-nez v0, :cond_0

    .line 624
    if-gez p5, :cond_1

    .line 626
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v0

    neg-int v4, v0

    .line 627
    .local v4, "min":I
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getDownNestedPreScrollRange()I

    move-result v0

    add-int v5, v4, v0

    .line 633
    .local v5, "max":I
    :goto_0
    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p5

    invoke-direct/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->scroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;III)I

    move-result v0

    aput v0, p6, v6

    .line 635
    .end local v4    # "min":I
    .end local v5    # "max":I
    :cond_0
    return-void

    .line 630
    :cond_1
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getUpNestedPreScrollRange()I

    move-result v0

    neg-int v4, v0

    .line 631
    .restart local v4    # "min":I
    const/4 v5, 0x0

    .restart local v5    # "max":I
    goto :goto_0
.end method

.method public bridge synthetic onNestedPreScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[I)V
    .locals 7
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Landroid/view/View;
    .param p4, "x3"    # I
    .param p5, "x4"    # I
    .param p6, "x5"    # [I

    .prologue
    .line 583
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Landroid/support/design/widget/AppBarLayout$Behavior;->onNestedPreScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;II[I)V

    return-void
.end method

.method public onNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;IIII)V
    .locals 6
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "target"    # Landroid/view/View;
    .param p4, "dxConsumed"    # I
    .param p5, "dyConsumed"    # I
    .param p6, "dxUnconsumed"    # I
    .param p7, "dyUnconsumed"    # I

    .prologue
    const/4 v5, 0x0

    .line 641
    if-gez p7, :cond_0

    .line 644
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getDownNestedScrollRange()I

    move-result v0

    neg-int v4, v0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p7

    invoke-direct/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->scroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;III)I

    .line 647
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mSkipNestedPreScroll:Z

    .line 652
    :goto_0
    return-void

    .line 650
    :cond_0
    iput-boolean v5, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mSkipNestedPreScroll:Z

    goto :goto_0
.end method

.method public bridge synthetic onNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;IIII)V
    .locals 8
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Landroid/view/View;
    .param p4, "x3"    # I
    .param p5, "x4"    # I
    .param p6, "x5"    # I
    .param p7, "x6"    # I

    .prologue
    .line 583
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Landroid/support/design/widget/AppBarLayout$Behavior;->onNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;IIII)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/os/Parcelable;)V
    .locals 2
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "appBarLayout"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "state"    # Landroid/os/Parcelable;

    .prologue
    .line 927
    instance-of v1, p3, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    if-eqz v1, :cond_0

    move-object v0, p3

    .line 928
    check-cast v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    .line 929
    .local v0, "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    invoke-virtual {v0}, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-super {p0, p1, p2, v1}, Landroid/support/design/widget/ViewOffsetBehavior;->onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    .line 930
    iget v1, v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibleChildIndex:I

    iput v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    .line 931
    iget v1, v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibileChildPercentageShown:F

    iput v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayoutPerc:F

    .line 932
    iget-boolean v1, v0, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibileChildAtMinimumHeight:Z

    iput-boolean v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayoutIsMinHeight:Z

    .line 937
    .end local v0    # "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    :goto_0
    return-void

    .line 934
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/design/widget/ViewOffsetBehavior;->onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V

    .line 935
    const/4 v1, -0x1

    iput v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetToChildIndexOnLayout:I

    goto :goto_0
.end method

.method public bridge synthetic onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/os/Parcelable;)V
    .locals 0
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Landroid/os/Parcelable;

    .prologue
    .line 583
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    .end local p2    # "x1":Landroid/view/View;
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/design/widget/AppBarLayout$Behavior;->onRestoreInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/os/Parcelable;)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)Landroid/os/Parcelable;
    .locals 9
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "appBarLayout"    # Landroid/support/design/widget/AppBarLayout;

    .prologue
    .line 902
    invoke-super {p0, p1, p2}, Landroid/support/design/widget/ViewOffsetBehavior;->onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;

    move-result-object v5

    .line 903
    .local v5, "superState":Landroid/os/Parcelable;
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopAndBottomOffset()I

    move-result v3

    .line 906
    .local v3, "offset":I
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->getChildCount()I

    move-result v1

    .local v1, "count":I
    :goto_0
    if-ge v2, v1, :cond_2

    .line 907
    invoke-virtual {p2, v2}, Landroid/support/design/widget/AppBarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 908
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v7

    add-int v6, v7, v3

    .line 910
    .local v6, "visBottom":I
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v7

    add-int/2addr v7, v3

    if-gtz v7, :cond_1

    if-ltz v6, :cond_1

    .line 911
    new-instance v4, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;

    invoke-direct {v4, v5}, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;-><init>(Landroid/os/Parcelable;)V

    .line 912
    .local v4, "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    iput v2, v4, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibleChildIndex:I

    .line 913
    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v7

    if-ne v6, v7, :cond_0

    const/4 v7, 0x1

    :goto_1
    iput-boolean v7, v4, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibileChildAtMinimumHeight:Z

    .line 915
    int-to-float v7, v6

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    iput v7, v4, Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;->firstVisibileChildPercentageShown:F

    .line 921
    .end local v0    # "child":Landroid/view/View;
    .end local v4    # "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    .end local v6    # "visBottom":I
    :goto_2
    return-object v4

    .line 913
    .restart local v0    # "child":Landroid/view/View;
    .restart local v4    # "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    .restart local v6    # "visBottom":I
    :cond_0
    const/4 v7, 0x0

    goto :goto_1

    .line 906
    .end local v4    # "ss":Landroid/support/design/widget/AppBarLayout$Behavior$SavedState;
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v0    # "child":Landroid/view/View;
    .end local v6    # "visBottom":I
    :cond_2
    move-object v4, v5

    .line 921
    goto :goto_2
.end method

.method public bridge synthetic onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;)Landroid/os/Parcelable;
    .locals 1
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;

    .prologue
    .line 583
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    .end local p2    # "x1":Landroid/view/View;
    invoke-virtual {p0, p1, p2}, Landroid/support/design/widget/AppBarLayout$Behavior;->onSaveInstanceState(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;)Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method

.method public onStartNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;Landroid/view/View;I)Z
    .locals 2
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "directTargetChild"    # Landroid/view/View;
    .param p4, "target"    # Landroid/view/View;
    .param p5, "nestedScrollAxes"    # I

    .prologue
    .line 608
    and-int/lit8 v1, p5, 0x2

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->hasScrollableChildren()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    .line 611
    .local v0, "started":Z
    :goto_0
    if-eqz v0, :cond_0

    iget-object v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-eqz v1, :cond_0

    .line 613
    iget-object v1, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v1}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    .line 616
    :cond_0
    return v0

    .line 608
    .end local v0    # "started":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onStartNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;I)Z
    .locals 6
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Landroid/view/View;
    .param p4, "x3"    # Landroid/view/View;
    .param p5, "x4"    # I

    .prologue
    .line 583
    move-object v2, p2

    check-cast v2, Landroid/support/design/widget/AppBarLayout;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->onStartNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public onStopNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;)V
    .locals 1
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "target"    # Landroid/view/View;

    .prologue
    .line 658
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mSkipNestedPreScroll:Z

    .line 659
    return-void
.end method

.method public bridge synthetic onStopNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)V
    .locals 0
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Landroid/view/View;

    .prologue
    .line 583
    check-cast p2, Landroid/support/design/widget/AppBarLayout;

    .end local p2    # "x1":Landroid/view/View;
    invoke-virtual {p0, p1, p2, p3}, Landroid/support/design/widget/AppBarLayout$Behavior;->onStopNestedScroll(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;Landroid/view/View;)V

    return-void
.end method

.method final setAppBarTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;I)I
    .locals 6
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "appBarLayout"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "newOffset"    # I

    .prologue
    .line 799
    const/high16 v4, -0x80000000

    const v5, 0x7fffffff

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/AppBarLayout$Behavior;->setAppBarTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;III)I

    move-result v0

    return v0
.end method

.method final setAppBarTopBottomOffset(Landroid/support/design/widget/CoordinatorLayout;Landroid/support/design/widget/AppBarLayout;III)I
    .locals 5
    .param p1, "coordinatorLayout"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "appBarLayout"    # Landroid/support/design/widget/AppBarLayout;
    .param p3, "newOffset"    # I
    .param p4, "minOffset"    # I
    .param p5, "maxOffset"    # I

    .prologue
    .line 805
    invoke-virtual {p0}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v1

    .line 806
    .local v1, "curOffset":I
    const/4 v0, 0x0

    .line 808
    .local v0, "consumed":I
    if-eqz p4, :cond_1

    if-lt v1, p4, :cond_1

    if-gt v1, p5, :cond_1

    .line 811
    invoke-static {p3, p4, p5}, Landroid/support/design/widget/MathUtils;->constrain(III)I

    move-result p3

    .line 813
    if-eq v1, p3, :cond_1

    .line 814
    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->hasChildWithInterpolator()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-direct {p0, p2, p3}, Landroid/support/design/widget/AppBarLayout$Behavior;->interpolateOffset(Landroid/support/design/widget/AppBarLayout;I)I

    move-result v2

    .line 818
    .local v2, "interpolatedOffset":I
    :goto_0
    invoke-virtual {p0, v2}, Landroid/support/design/widget/AppBarLayout$Behavior;->setTopAndBottomOffset(I)Z

    move-result v3

    .line 821
    .local v3, "offsetChanged":Z
    sub-int v0, v1, p3

    .line 823
    sub-int v4, p3, v2

    iput v4, p0, Landroid/support/design/widget/AppBarLayout$Behavior;->mOffsetDelta:I

    .line 825
    if-nez v3, :cond_0

    invoke-virtual {p2}, Landroid/support/design/widget/AppBarLayout;->hasChildWithInterpolator()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 830
    invoke-virtual {p1, p2}, Landroid/support/design/widget/CoordinatorLayout;->dispatchDependentViewsChanged(Landroid/view/View;)V

    .line 834
    :cond_0
    invoke-direct {p0, p2}, Landroid/support/design/widget/AppBarLayout$Behavior;->dispatchOffsetUpdates(Landroid/support/design/widget/AppBarLayout;)V

    .line 838
    .end local v2    # "interpolatedOffset":I
    .end local v3    # "offsetChanged":Z
    :cond_1
    return v0

    :cond_2
    move v2, p3

    .line 814
    goto :goto_0
.end method

.method public bridge synthetic setLeftAndRightOffset(I)Z
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 583
    invoke-super {p0, p1}, Landroid/support/design/widget/ViewOffsetBehavior;->setLeftAndRightOffset(I)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic setTopAndBottomOffset(I)Z
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 583
    invoke-super {p0, p1}, Landroid/support/design/widget/ViewOffsetBehavior;->setTopAndBottomOffset(I)Z

    move-result v0

    return v0
.end method
