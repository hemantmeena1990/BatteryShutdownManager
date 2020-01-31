.class public Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;
.super Landroid/support/design/widget/ViewOffsetBehavior;
.source "AppBarLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/AppBarLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ScrollingViewBehavior"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/design/widget/ViewOffsetBehavior",
        "<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field private mOverlayTop:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 985
    invoke-direct {p0}, Landroid/support/design/widget/ViewOffsetBehavior;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 988
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/ViewOffsetBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 990
    sget-object v1, Landroid/support/design/R$styleable;->ScrollingViewBehavior_Params:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 992
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroid/support/design/R$styleable;->ScrollingViewBehavior_Params_behavior_overlapTop:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->mOverlayTop:I

    .line 994
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 995
    return-void
.end method

.method private static findFirstAppBarLayout(Ljava/util/List;)Landroid/support/design/widget/AppBarLayout;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;)",
            "Landroid/support/design/widget/AppBarLayout;"
        }
    .end annotation

    .prologue
    .line 1087
    .local p0, "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "z":I
    :goto_0
    if-ge v0, v2, :cond_1

    .line 1088
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    .line 1089
    .local v1, "view":Landroid/view/View;
    instance-of v3, v1, Landroid/support/design/widget/AppBarLayout;

    if-eqz v3, :cond_0

    .line 1090
    check-cast v1, Landroid/support/design/widget/AppBarLayout;

    .line 1093
    .end local v1    # "view":Landroid/view/View;
    :goto_1
    return-object v1

    .line 1087
    .restart local v1    # "view":Landroid/view/View;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1093
    .end local v1    # "view":Landroid/view/View;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method public bridge synthetic getLeftAndRightOffset()I
    .locals 1

    .prologue
    .line 982
    invoke-super {p0}, Landroid/support/design/widget/ViewOffsetBehavior;->getLeftAndRightOffset()I

    move-result v0

    return v0
.end method

.method public getOverlayTop()I
    .locals 1

    .prologue
    .line 1083
    iget v0, p0, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->mOverlayTop:I

    return v0
.end method

.method public bridge synthetic getTopAndBottomOffset()I
    .locals 1

    .prologue
    .line 982
    invoke-super {p0}, Landroid/support/design/widget/ViewOffsetBehavior;->getTopAndBottomOffset()I

    move-result v0

    return v0
.end method

.method public layoutDependsOn(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 1
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "dependency"    # Landroid/view/View;

    .prologue
    .line 1000
    instance-of v0, p3, Landroid/support/design/widget/AppBarLayout;

    return v0
.end method

.method public onDependentViewChanged(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;)Z
    .locals 7
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "dependency"    # Landroid/view/View;

    .prologue
    .line 1044
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;

    invoke-virtual {v5}, Landroid/support/design/widget/CoordinatorLayout$LayoutParams;->getBehavior()Landroid/support/design/widget/CoordinatorLayout$Behavior;

    move-result-object v1

    .line 1046
    .local v1, "behavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    instance-of v5, v1, Landroid/support/design/widget/AppBarLayout$Behavior;

    if-eqz v5, :cond_0

    .line 1049
    check-cast v1, Landroid/support/design/widget/AppBarLayout$Behavior;

    .end local v1    # "behavior":Landroid/support/design/widget/CoordinatorLayout$Behavior;
    invoke-virtual {v1}, Landroid/support/design/widget/AppBarLayout$Behavior;->getTopBottomOffsetForScrollingSibling()I

    move-result v0

    .line 1051
    .local v0, "appBarOffset":I
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result v5

    iget v6, p0, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->mOverlayTop:I

    sub-int v3, v5, v6

    .line 1052
    .local v3, "expandedMax":I
    invoke-virtual {p1}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v5

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v6

    sub-int v2, v5, v6

    .line 1054
    .local v2, "collapsedMin":I
    iget v5, p0, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->mOverlayTop:I

    if-eqz v5, :cond_1

    instance-of v5, p3, Landroid/support/design/widget/AppBarLayout;

    if-eqz v5, :cond_1

    .line 1058
    check-cast p3, Landroid/support/design/widget/AppBarLayout;

    .end local p3    # "dependency":Landroid/view/View;
    invoke-virtual {p3}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v4

    .line 1059
    .local v4, "scrollRange":I
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v5

    int-to-float v5, v5

    int-to-float v6, v4

    div-float/2addr v5, v6

    invoke-static {v3, v2, v5}, Landroid/support/design/widget/AnimationUtils;->lerp(IIF)I

    move-result v5

    invoke-virtual {p0, v5}, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->setTopAndBottomOffset(I)Z

    .line 1067
    .end local v0    # "appBarOffset":I
    .end local v2    # "collapsedMin":I
    .end local v3    # "expandedMax":I
    .end local v4    # "scrollRange":I
    :cond_0
    :goto_0
    const/4 v5, 0x0

    return v5

    .line 1062
    .restart local v0    # "appBarOffset":I
    .restart local v2    # "collapsedMin":I
    .restart local v3    # "expandedMax":I
    .restart local p3    # "dependency":Landroid/view/View;
    :cond_1
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    move-result v5

    iget v6, p0, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->mOverlayTop:I

    sub-int/2addr v5, v6

    add-int/2addr v5, v0

    invoke-static {v5, v2, v3}, Landroid/support/design/widget/MathUtils;->constrain(III)I

    move-result v5

    invoke-virtual {p0, v5}, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->setTopAndBottomOffset(I)Z

    goto :goto_0
.end method

.method public bridge synthetic onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .locals 1
    .param p1, "x0"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # I

    .prologue
    .line 982
    invoke-super {p0, p1, p2, p3}, Landroid/support/design/widget/ViewOffsetBehavior;->onLayoutChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;I)Z

    move-result v0

    return v0
.end method

.method public onMeasureChild(Landroid/support/design/widget/CoordinatorLayout;Landroid/view/View;IIII)Z
    .locals 10
    .param p1, "parent"    # Landroid/support/design/widget/CoordinatorLayout;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "parentWidthMeasureSpec"    # I
    .param p4, "widthUsed"    # I
    .param p5, "parentHeightMeasureSpec"    # I
    .param p6, "heightUsed"    # I

    .prologue
    .line 1007
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 1011
    invoke-virtual {p1, p2}, Landroid/support/design/widget/CoordinatorLayout;->getDependencies(Landroid/view/View;)Ljava/util/List;

    move-result-object v7

    .line 1012
    .local v7, "dependencies":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-interface {v7}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1014
    const/4 v0, 0x0

    .line 1038
    .end local v7    # "dependencies":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    :goto_0
    return v0

    .line 1017
    .restart local v7    # "dependencies":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    :cond_0
    invoke-static {v7}, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->findFirstAppBarLayout(Ljava/util/List;)Landroid/support/design/widget/AppBarLayout;

    move-result-object v6

    .line 1018
    .local v6, "appBar":Landroid/support/design/widget/AppBarLayout;
    if-eqz v6, :cond_2

    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1019
    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1022
    const/4 v0, 0x1

    invoke-static {p2, v0}, Landroid/support/v4/view/ViewCompat;->setFitsSystemWindows(Landroid/view/View;Z)V

    .line 1025
    :cond_1
    invoke-virtual {v6}, Landroid/support/design/widget/AppBarLayout;->getTotalScrollRange()I

    move-result v9

    .line 1026
    .local v9, "scrollRange":I
    invoke-virtual {p1}, Landroid/support/design/widget/CoordinatorLayout;->getHeight()I

    move-result v0

    invoke-virtual {v6}, Landroid/support/design/widget/AppBarLayout;->getMeasuredHeight()I

    move-result v1

    sub-int/2addr v0, v1

    add-int v8, v0, v9

    .line 1028
    .local v8, "height":I
    const/high16 v0, -0x80000000

    invoke-static {v8, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .local v4, "heightMeasureSpec":I
    move-object v0, p1

    move-object v1, p2

    move v2, p3

    move v3, p4

    move/from16 v5, p6

    .line 1032
    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/CoordinatorLayout;->onMeasureChild(Landroid/view/View;IIII)V

    .line 1035
    const/4 v0, 0x1

    goto :goto_0

    .line 1038
    .end local v4    # "heightMeasureSpec":I
    .end local v6    # "appBar":Landroid/support/design/widget/AppBarLayout;
    .end local v7    # "dependencies":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    .end local v8    # "height":I
    .end local v9    # "scrollRange":I
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic setLeftAndRightOffset(I)Z
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 982
    invoke-super {p0, p1}, Landroid/support/design/widget/ViewOffsetBehavior;->setLeftAndRightOffset(I)Z

    move-result v0

    return v0
.end method

.method public setOverlayTop(I)V
    .locals 0
    .param p1, "overlayTop"    # I

    .prologue
    .line 1076
    iput p1, p0, Landroid/support/design/widget/AppBarLayout$ScrollingViewBehavior;->mOverlayTop:I

    .line 1077
    return-void
.end method

.method public bridge synthetic setTopAndBottomOffset(I)Z
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 982
    invoke-super {p0, p1}, Landroid/support/design/widget/ViewOffsetBehavior;->setTopAndBottomOffset(I)Z

    move-result v0

    return v0
.end method
