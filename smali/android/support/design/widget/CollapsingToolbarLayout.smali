.class public Landroid/support/design/widget/CollapsingToolbarLayout;
.super Landroid/widget/FrameLayout;
.source "CollapsingToolbarLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/CollapsingToolbarLayout$OffsetUpdateListener;,
        Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;
    }
.end annotation


# static fields
.field private static final SCRIM_ANIMATION_DURATION:I = 0x258


# instance fields
.field private final mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

.field private mContentScrim:Landroid/graphics/drawable/Drawable;

.field private mCurrentOffset:I

.field private mDummyView:Landroid/view/View;

.field private mExpandedMarginBottom:I

.field private mExpandedMarginLeft:I

.field private mExpandedMarginRight:I

.field private mExpandedMarginTop:I

.field private mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

.field private mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

.field private mRefreshToolbar:Z

.field private mScrimAlpha:I

.field private mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

.field private mScrimsAreShown:Z

.field private mStatusBarScrim:Landroid/graphics/drawable/Drawable;

.field private final mTmpRect:Landroid/graphics/Rect;

.field private mToolbar:Landroid/support/v7/widget/Toolbar;

.field private mToolbarId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 114
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 115
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 118
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 119
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v5, 0x0

    .line 122
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 88
    iput-boolean v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mRefreshToolbar:Z

    .line 98
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    iput-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    .line 124
    new-instance v6, Landroid/support/design/widget/CollapsingTextHelper;

    invoke-direct {v6, p0}, Landroid/support/design/widget/CollapsingTextHelper;-><init>(Landroid/view/View;)V

    iput-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    .line 125
    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    const/16 v7, 0x50

    invoke-virtual {v6, v7}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextVerticalGravity(I)V

    .line 126
    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    sget-object v7, Landroid/support/design/widget/AnimationUtils;->DECELERATE_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v6, v7}, Landroid/support/design/widget/CollapsingTextHelper;->setTextSizeInterpolator(Landroid/view/animation/Interpolator;)V

    .line 128
    sget-object v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout:[I

    sget v7, Landroid/support/design/R$style;->Widget_Design_CollapsingToolbar:I

    invoke-virtual {p1, p2, v6, p3, v7}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 132
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMargin:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginBottom:I

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginRight:I

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginTop:I

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginLeft:I

    .line 135
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v6

    if-ne v6, v1, :cond_4

    .line 137
    .local v1, "isRtl":Z
    :goto_0
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginStart:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 138
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginStart:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 140
    .local v3, "marginStart":I
    if-eqz v1, :cond_5

    .line 141
    iput v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginRight:I

    .line 146
    .end local v3    # "marginStart":I
    :cond_0
    :goto_1
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginEnd:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 147
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginEnd:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    .line 149
    .local v2, "marginEnd":I
    if-eqz v1, :cond_6

    .line 150
    iput v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginLeft:I

    .line 155
    .end local v2    # "marginEnd":I
    :cond_1
    :goto_2
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginTop:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 156
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginTop:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginTop:I

    .line 159
    :cond_2
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginBottom:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 160
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleMarginBottom:I

    invoke-virtual {v0, v6, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginBottom:I

    .line 164
    :cond_3
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_expandedTitleTextAppearance:I

    sget v7, Landroid/support/design/R$style;->TextAppearance_AppCompat_Title:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    .line 167
    .local v4, "tp":I
    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v6, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextAppearance(I)V

    .line 169
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_collapsedTitleTextAppearance:I

    sget v7, Landroid/support/design/R$style;->TextAppearance_AppCompat_Widget_ActionBar_Title:I

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    .line 172
    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v6, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    .line 174
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_contentScrim:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/support/design/widget/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    .line 175
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_statusBarScrim:I

    invoke-virtual {v0, v6}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroid/support/design/widget/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    .line 177
    sget v6, Landroid/support/design/R$styleable;->CollapsingToolbarLayout_toolbarId:I

    const/4 v7, -0x1

    invoke-virtual {v0, v6, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v6

    iput v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbarId:I

    .line 179
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 181
    invoke-virtual {p0, v5}, Landroid/support/design/widget/CollapsingToolbarLayout;->setWillNotDraw(Z)V

    .line 183
    new-instance v5, Landroid/support/design/widget/CollapsingToolbarLayout$1;

    invoke-direct {v5, p0}, Landroid/support/design/widget/CollapsingToolbarLayout$1;-><init>(Landroid/support/design/widget/CollapsingToolbarLayout;)V

    invoke-static {p0, v5}, Landroid/support/v4/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroid/support/v4/view/OnApplyWindowInsetsListener;)V

    .line 193
    return-void

    .end local v1    # "isRtl":Z
    .end local v4    # "tp":I
    :cond_4
    move v1, v5

    .line 135
    goto/16 :goto_0

    .line 143
    .restart local v1    # "isRtl":Z
    .restart local v3    # "marginStart":I
    :cond_5
    iput v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginLeft:I

    goto :goto_1

    .line 152
    .end local v3    # "marginStart":I
    .restart local v2    # "marginEnd":I
    :cond_6
    iput v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginRight:I

    goto :goto_2
.end method

.method static synthetic access$000(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/support/v4/view/WindowInsetsCompat;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    return-object v0
.end method

.method static synthetic access$002(Landroid/support/design/widget/CollapsingToolbarLayout;Landroid/support/v4/view/WindowInsetsCompat;)Landroid/support/v4/view/WindowInsetsCompat;
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;
    .param p1, "x1"    # Landroid/support/v4/view/WindowInsetsCompat;

    .prologue
    .line 84
    iput-object p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    return-object p1
.end method

.method static synthetic access$1000(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/support/design/widget/CollapsingTextHelper;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    return-object v0
.end method

.method static synthetic access$200(Landroid/support/design/widget/CollapsingToolbarLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    return v0
.end method

.method static synthetic access$202(Landroid/support/design/widget/CollapsingToolbarLayout;I)I
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;
    .param p1, "x1"    # I

    .prologue
    .line 84
    iput p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    return p1
.end method

.method static synthetic access$300(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/support/v7/widget/Toolbar;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    return-object v0
.end method

.method static synthetic access$502(Landroid/support/design/widget/CollapsingToolbarLayout;I)I
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;
    .param p1, "x1"    # I

    .prologue
    .line 84
    iput p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCurrentOffset:I

    return p1
.end method

.method static synthetic access$600(Landroid/view/View;)Landroid/support/design/widget/ViewOffsetHelper;
    .locals 1
    .param p0, "x0"    # Landroid/view/View;

    .prologue
    .line 84
    invoke-static {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getViewOffsetHelper(Landroid/view/View;)Landroid/support/design/widget/ViewOffsetHelper;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Landroid/support/design/widget/CollapsingToolbarLayout;)Landroid/graphics/drawable/Drawable;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method static synthetic access$800(Landroid/support/design/widget/CollapsingToolbarLayout;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->showScrim()V

    return-void
.end method

.method static synthetic access$900(Landroid/support/design/widget/CollapsingToolbarLayout;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/CollapsingToolbarLayout;

    .prologue
    .line 84
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->hideScrim()V

    return-void
.end method

.method private animateScrim(I)V
    .locals 2
    .param p1, "targetAlpha"    # I

    .prologue
    .line 390
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->ensureToolbar()V

    .line 391
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-nez v0, :cond_1

    .line 392
    invoke-static {}, Landroid/support/design/widget/ViewUtils;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    .line 393
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    const/16 v1, 0x258

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setDuration(I)V

    .line 394
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 395
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    new-instance v1, Landroid/support/design/widget/CollapsingToolbarLayout$2;

    invoke-direct {v1, p0}, Landroid/support/design/widget/CollapsingToolbarLayout$2;-><init>(Landroid/support/design/widget/CollapsingToolbarLayout;)V

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;)V

    .line 413
    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v0, v1, p1}, Landroid/support/design/widget/ValueAnimatorCompat;->setIntValues(II)V

    .line 414
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->start()V

    .line 415
    return-void

    .line 409
    :cond_1
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 410
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    goto :goto_0
.end method

.method private ensureToolbar()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, -0x1

    .line 271
    iget-boolean v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mRefreshToolbar:Z

    if-nez v5, :cond_0

    .line 313
    :goto_0
    return-void

    .line 275
    :cond_0
    const/4 v2, 0x0

    .local v2, "fallback":Landroid/support/v7/widget/Toolbar;
    const/4 v4, 0x0

    .line 277
    .local v4, "selected":Landroid/support/v7/widget/Toolbar;
    const/4 v3, 0x0

    .local v3, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getChildCount()I

    move-result v1

    .local v1, "count":I
    :goto_1
    if-ge v3, v1, :cond_1

    .line 278
    invoke-virtual {p0, v3}, Landroid/support/design/widget/CollapsingToolbarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 279
    .local v0, "child":Landroid/view/View;
    instance-of v5, v0, Landroid/support/v7/widget/Toolbar;

    if-eqz v5, :cond_4

    .line 280
    iget v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbarId:I

    if-eq v5, v7, :cond_5

    .line 282
    iget v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbarId:I

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v6

    if-ne v5, v6, :cond_3

    move-object v4, v0

    .line 284
    check-cast v4, Landroid/support/v7/widget/Toolbar;

    .line 299
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    :goto_2
    if-nez v4, :cond_2

    .line 301
    move-object v4, v2

    .line 304
    :cond_2
    if-eqz v4, :cond_6

    .line 305
    iput-object v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 306
    new-instance v5, Landroid/view/View;

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-direct {v5, v6}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    .line 307
    iget-object v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    iget-object v6, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    invoke-virtual {v5, v6, v7, v7}, Landroid/support/v7/widget/Toolbar;->addView(Landroid/view/View;II)V

    .line 312
    :goto_3
    const/4 v5, 0x0

    iput-boolean v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mRefreshToolbar:Z

    goto :goto_0

    .line 287
    .restart local v0    # "child":Landroid/view/View;
    :cond_3
    if-nez v2, :cond_4

    move-object v2, v0

    .line 289
    check-cast v2, Landroid/support/v7/widget/Toolbar;

    .line 277
    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_5
    move-object v4, v0

    .line 293
    check-cast v4, Landroid/support/v7/widget/Toolbar;

    .line 294
    goto :goto_2

    .line 309
    .end local v0    # "child":Landroid/view/View;
    :cond_6
    iput-object v8, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    .line 310
    iput-object v8, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    goto :goto_3
.end method

.method private static getViewOffsetHelper(Landroid/view/View;)Landroid/support/design/widget/ViewOffsetHelper;
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 358
    sget v1, Landroid/support/design/R$id;->view_offset_helper:I

    invoke-virtual {p0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/ViewOffsetHelper;

    .line 359
    .local v0, "offsetHelper":Landroid/support/design/widget/ViewOffsetHelper;
    if-nez v0, :cond_0

    .line 360
    new-instance v0, Landroid/support/design/widget/ViewOffsetHelper;

    .end local v0    # "offsetHelper":Landroid/support/design/widget/ViewOffsetHelper;
    invoke-direct {v0, p0}, Landroid/support/design/widget/ViewOffsetHelper;-><init>(Landroid/view/View;)V

    .line 361
    .restart local v0    # "offsetHelper":Landroid/support/design/widget/ViewOffsetHelper;
    sget v1, Landroid/support/design/R$id;->view_offset_helper:I

    invoke-virtual {p0, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 363
    :cond_0
    return-object v0
.end method

.method private hideScrim()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 383
    iget-boolean v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimsAreShown:Z

    if-eqz v0, :cond_0

    .line 384
    invoke-direct {p0, v1}, Landroid/support/design/widget/CollapsingToolbarLayout;->animateScrim(I)V

    .line 385
    iput-boolean v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimsAreShown:Z

    .line 387
    :cond_0
    return-void
.end method

.method private showScrim()V
    .locals 1

    .prologue
    .line 376
    iget-boolean v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimsAreShown:Z

    if-nez v0, :cond_0

    .line 377
    const/16 v0, 0xff

    invoke-direct {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->animateScrim(I)V

    .line 378
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimsAreShown:Z

    .line 380
    :cond_0
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 582
    instance-of v0, p1, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x0

    .line 222
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->draw(Landroid/graphics/Canvas;)V

    .line 226
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->ensureToolbar()V

    .line 227
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-nez v2, :cond_0

    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_0

    iget v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    if-lez v2, :cond_0

    .line 228
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 229
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 233
    :cond_0
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v2, p1}, Landroid/support/design/widget/CollapsingTextHelper;->draw(Landroid/graphics/Canvas;)V

    .line 236
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_1

    iget v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    if-lez v2, :cond_1

    .line 237
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v2, :cond_2

    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v2}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v0

    .line 238
    .local v0, "topInset":I
    :goto_0
    if-lez v0, :cond_1

    .line 239
    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCurrentOffset:I

    neg-int v3, v3

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getWidth()I

    move-result v4

    iget v5, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCurrentOffset:I

    sub-int v5, v0, v5

    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 241
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 242
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 245
    .end local v0    # "topInset":I
    :cond_1
    return-void

    :cond_2
    move v0, v1

    .line 237
    goto :goto_0
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "drawingTime"    # J

    .prologue
    .line 252
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->ensureToolbar()V

    .line 253
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    if-lez v0, :cond_0

    .line 254
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 255
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 259
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v0

    return v0
.end method

.method protected generateDefaultLayoutParams()Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;
    .locals 2

    .prologue
    .line 587
    new-instance v0, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    invoke-super {p0}, Landroid/widget/FrameLayout;->generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 1

    .prologue
    .line 84
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->generateDefaultLayoutParams()Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateDefaultLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 1

    .prologue
    .line 84
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->generateDefaultLayoutParams()Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .param p1, "x0"    # Landroid/util/AttributeSet;

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Landroid/support/design/widget/CollapsingToolbarLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method protected bridge synthetic generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .param p1, "x0"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 84
    invoke-virtual {p0, p1}, Landroid/support/design/widget/CollapsingToolbarLayout;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 592
    new-instance v0, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 597
    new-instance v0, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroid/support/design/widget/CollapsingToolbarLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getContentScrim()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 472
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method final getScrimTriggerOffset()I
    .locals 1

    .prologue
    .line 577
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getMinimumHeight(Landroid/view/View;)I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getStatusBarScrim()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 532
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .prologue
    .line 197
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 200
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 201
    .local v0, "parent":Landroid/view/ViewParent;
    instance-of v1, v0, Landroid/support/design/widget/AppBarLayout;

    if-eqz v1, :cond_1

    .line 202
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    if-nez v1, :cond_0

    .line 203
    new-instance v1, Landroid/support/design/widget/CollapsingToolbarLayout$OffsetUpdateListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Landroid/support/design/widget/CollapsingToolbarLayout$OffsetUpdateListener;-><init>(Landroid/support/design/widget/CollapsingToolbarLayout;Landroid/support/design/widget/CollapsingToolbarLayout$1;)V

    iput-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    .line 205
    :cond_0
    check-cast v0, Landroid/support/design/widget/AppBarLayout;

    .end local v0    # "parent":Landroid/view/ViewParent;
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/AppBarLayout;->addOnOffsetChangedListener(Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;)V

    .line 207
    :cond_1
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 212
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 213
    .local v0, "parent":Landroid/view/ViewParent;
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    if-eqz v1, :cond_0

    instance-of v1, v0, Landroid/support/design/widget/AppBarLayout;

    if-eqz v1, :cond_0

    .line 214
    check-cast v0, Landroid/support/design/widget/AppBarLayout;

    .end local v0    # "parent":Landroid/view/ViewParent;
    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mOnOffsetChangedListener:Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/AppBarLayout;->removeOnOffsetChangedListener(Landroid/support/design/widget/AppBarLayout$OnOffsetChangedListener;)V

    .line 217
    :cond_0
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 218
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 10
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 317
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 320
    const/4 v7, 0x0

    .local v7, "i":I
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getChildCount()I

    move-result v9

    .local v9, "z":I
    :goto_0
    if-ge v7, v9, :cond_1

    .line 321
    invoke-virtual {p0, v7}, Landroid/support/design/widget/CollapsingToolbarLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 323
    .local v6, "child":Landroid/view/View;
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    if-eqz v0, :cond_0

    invoke-static {v6}, Landroid/support/v4/view/ViewCompat;->getFitsSystemWindows(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 324
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mLastInsets:Landroid/support/v4/view/WindowInsetsCompat;

    invoke-virtual {v0}, Landroid/support/v4/view/WindowInsetsCompat;->getSystemWindowInsetTop()I

    move-result v8

    .line 325
    .local v8, "insetTop":I
    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v0

    if-ge v0, v8, :cond_0

    .line 328
    invoke-virtual {v6, v8}, Landroid/view/View;->offsetTopAndBottom(I)V

    .line 332
    .end local v8    # "insetTop":I
    :cond_0
    invoke-static {v6}, Landroid/support/design/widget/CollapsingToolbarLayout;->getViewOffsetHelper(Landroid/view/View;)Landroid/support/design/widget/ViewOffsetHelper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/design/widget/ViewOffsetHelper;->onViewLayout()V

    .line 320
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 336
    .end local v6    # "child":Landroid/view/View;
    :cond_1
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/CollapsingTextHelper;->onLayout(ZIIII)V

    .line 338
    invoke-direct {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->ensureToolbar()V

    .line 341
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 342
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mDummyView:Landroid/view/View;

    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    invoke-static {p0, v0, v1}, Landroid/support/design/widget/ViewGroupUtils;->getDescendantRect(Landroid/view/ViewGroup;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 343
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int v2, p5, v2

    iget-object v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    invoke-virtual {v0, v1, v2, v3, p5}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedBounds(IIII)V

    .line 346
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginLeft:I

    add-int/2addr v1, p2

    iget-object v2, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mTmpRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    iget v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginTop:I

    add-int/2addr v2, v3

    iget v3, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginRight:I

    sub-int v3, p4, v3

    iget v4, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mExpandedMarginBottom:I

    sub-int v4, p5, v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedBounds(IIII)V

    .line 352
    :cond_2
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    if-eqz v0, :cond_3

    .line 353
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mToolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getHeight()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setMinimumHeight(I)V

    .line 355
    :cond_3
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 2
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .prologue
    const/4 v1, 0x0

    .line 264
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    .line 265
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 266
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 268
    :cond_0
    return-void
.end method

.method public setCollapsedTitleTextAppearance(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 542
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    .line 543
    return-void
.end method

.method public setCollapsedTitleTextColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 551
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextColor(I)V

    .line 552
    return-void
.end method

.method public setContentScrim(Landroid/graphics/drawable/Drawable;)V
    .locals 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 427
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_1

    .line 428
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 429
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 432
    :cond_0
    iput-object p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mContentScrim:Landroid/graphics/drawable/Drawable;

    .line 433
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getHeight()I

    move-result v1

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 434
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 435
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 436
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 438
    :cond_1
    return-void
.end method

.method public setContentScrimColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 449
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    .line 450
    return-void
.end method

.method public setContentScrimResource(I)V
    .locals 1
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 461
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setContentScrim(Landroid/graphics/drawable/Drawable;)V

    .line 463
    return-void
.end method

.method public setExpandedTitleColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 570
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextColor(I)V

    .line 571
    return-void
.end method

.method public setExpandedTitleTextAppearance(I)V
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 561
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextAppearance(I)V

    .line 562
    return-void
.end method

.method public setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 487
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eq v0, p1, :cond_1

    .line 488
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    .line 489
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 492
    :cond_0
    iput-object p1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mStatusBarScrim:Landroid/graphics/drawable/Drawable;

    .line 493
    invoke-virtual {p1, p0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 494
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget v1, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mScrimAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 495
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 497
    :cond_1
    return-void
.end method

.method public setStatusBarScrimColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 510
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    .line 511
    return-void
.end method

.method public setStatusBarScrimResource(I)V
    .locals 1
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 522
    invoke-virtual {p0}, Landroid/support/design/widget/CollapsingToolbarLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v4/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/CollapsingToolbarLayout;->setStatusBarScrim(Landroid/graphics/drawable/Drawable;)V

    .line 523
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 372
    iget-object v0, p0, Landroid/support/design/widget/CollapsingToolbarLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setText(Ljava/lang/CharSequence;)V

    .line 373
    return-void
.end method
