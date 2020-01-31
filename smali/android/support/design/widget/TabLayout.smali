.class public Landroid/support/design/widget/TabLayout;
.super Landroid/widget/HorizontalScrollView;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;,
        Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;,
        Landroid/support/design/widget/TabLayout$SlidingTabStrip;,
        Landroid/support/design/widget/TabLayout$TabView;,
        Landroid/support/design/widget/TabLayout$Tab;,
        Landroid/support/design/widget/TabLayout$OnTabSelectedListener;,
        Landroid/support/design/widget/TabLayout$TabGravity;,
        Landroid/support/design/widget/TabLayout$Mode;
    }
.end annotation


# static fields
.field private static final ANIMATION_DURATION:I = 0x12c

.field private static final DEFAULT_HEIGHT:I = 0x30

.field private static final FIXED_WRAP_GUTTER_MIN:I = 0x10

.field public static final GRAVITY_CENTER:I = 0x1

.field public static final GRAVITY_FILL:I = 0x0

.field private static final MAX_TAB_TEXT_LINES:I = 0x2

.field public static final MODE_FIXED:I = 0x1

.field public static final MODE_SCROLLABLE:I = 0x0

.field private static final MOTION_NON_ADJACENT_OFFSET:I = 0x18

.field private static final TAB_MIN_WIDTH_MARGIN:I = 0x38


# instance fields
.field private mContentInsetStart:I

.field private mMode:I

.field private mOnTabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

.field private final mRequestedTabMaxWidth:I

.field private mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

.field private final mTabBackgroundResId:I

.field private mTabClickListener:Landroid/view/View$OnClickListener;

.field private mTabGravity:I

.field private mTabMaxWidth:I

.field private final mTabMinWidth:I

.field private mTabPaddingBottom:I

.field private mTabPaddingEnd:I

.field private mTabPaddingStart:I

.field private mTabPaddingTop:I

.field private final mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

.field private mTabTextAppearance:I

.field private mTabTextColors:Landroid/content/res/ColorStateList;

.field private final mTabs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/support/design/widget/TabLayout$Tab;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 206
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 207
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 210
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/support/design/widget/TabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 211
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 214
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 178
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    .line 217
    invoke-virtual {p0, v5}, Landroid/support/design/widget/TabLayout;->setHorizontalScrollBarEnabled(Z)V

    .line 219
    invoke-virtual {p0, v6}, Landroid/support/design/widget/TabLayout;->setFillViewport(Z)V

    .line 222
    new-instance v2, Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-direct {v2, p0, p1}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;-><init>(Landroid/support/design/widget/TabLayout;Landroid/content/Context;)V

    iput-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    .line 223
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    const/4 v3, -0x2

    const/4 v4, -0x1

    invoke-virtual {p0, v2, v3, v4}, Landroid/support/design/widget/TabLayout;->addView(Landroid/view/View;II)V

    .line 225
    sget-object v2, Landroid/support/design/R$styleable;->TabLayout:[I

    sget v3, Landroid/support/design/R$style;->Widget_Design_TabLayout:I

    invoke-virtual {p1, p2, v2, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 228
    .local v0, "a":Landroid/content/res/TypedArray;
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    sget v3, Landroid/support/design/R$styleable;->TabLayout_tabIndicatorHeight:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->setSelectedIndicatorHeight(I)V

    .line 230
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    sget v3, Landroid/support/design/R$styleable;->TabLayout_tabIndicatorColor:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->setSelectedIndicatorColor(I)V

    .line 232
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabTextAppearance:I

    sget v3, Landroid/support/design/R$style;->TextAppearance_Design_Tab:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabTextAppearance:I

    .line 235
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabPadding:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingBottom:I

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingEnd:I

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingTop:I

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingStart:I

    .line 237
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabPaddingStart:I

    iget v3, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingStart:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingStart:I

    .line 239
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabPaddingTop:I

    iget v3, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingTop:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingTop:I

    .line 241
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabPaddingEnd:I

    iget v3, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingEnd:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingEnd:I

    .line 243
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabPaddingBottom:I

    iget v3, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingBottom:I

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingBottom:I

    .line 247
    iget v2, p0, Landroid/support/design/widget/TabLayout;->mTabTextAppearance:I

    invoke-direct {p0, v2}, Landroid/support/design/widget/TabLayout;->loadTextColorFromTextAppearance(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;

    .line 249
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabTextColor:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 251
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabTextColor:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;

    .line 254
    :cond_0
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabSelectedTextColor:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 258
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabSelectedTextColor:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 259
    .local v1, "selected":I
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    invoke-static {v2, v1}, Landroid/support/design/widget/TabLayout;->createColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;

    .line 262
    .end local v1    # "selected":I
    :cond_1
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabMinWidth:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabMinWidth:I

    .line 263
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabMaxWidth:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mRequestedTabMaxWidth:I

    .line 264
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabBackground:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabBackgroundResId:I

    .line 265
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabContentStart:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mContentInsetStart:I

    .line 266
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabMode:I

    invoke-virtual {v0, v2, v6}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    .line 267
    sget v2, Landroid/support/design/R$styleable;->TabLayout_tabGravity:I

    invoke-virtual {v0, v2, v5}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Landroid/support/design/widget/TabLayout;->mTabGravity:I

    .line 268
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 271
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout;->applyModeAndGravity()V

    .line 272
    return-void
.end method

.method static synthetic access$100(Landroid/support/design/widget/TabLayout;I)V
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;
    .param p1, "x1"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1}, Landroid/support/design/widget/TabLayout;->updateTab(I)V

    return-void
.end method

.method static synthetic access$1000(Landroid/support/design/widget/TabLayout;)Landroid/content/res/ColorStateList;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method static synthetic access$1100(Landroid/view/animation/Animation;)Z
    .locals 1
    .param p0, "x0"    # Landroid/view/animation/Animation;

    .prologue
    .line 88
    invoke-static {p0}, Landroid/support/design/widget/TabLayout;->isAnimationRunning(Landroid/view/animation/Animation;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$1200(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    return v0
.end method

.method static synthetic access$1300(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabGravity:I

    return v0
.end method

.method static synthetic access$1302(Landroid/support/design/widget/TabLayout;I)I
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;
    .param p1, "x1"    # I

    .prologue
    .line 88
    iput p1, p0, Landroid/support/design/widget/TabLayout;->mTabGravity:I

    return p1
.end method

.method static synthetic access$1400(Landroid/support/design/widget/TabLayout;I)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;
    .param p1, "x1"    # I

    .prologue
    .line 88
    invoke-direct {p0, p1}, Landroid/support/design/widget/TabLayout;->dpToPx(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$1500(Landroid/support/design/widget/TabLayout;)V
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout;->updateTabViewsLayoutParams()V

    return-void
.end method

.method static synthetic access$200(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabBackgroundResId:I

    return v0
.end method

.method static synthetic access$300(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingStart:I

    return v0
.end method

.method static synthetic access$400(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingTop:I

    return v0
.end method

.method static synthetic access$500(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingEnd:I

    return v0
.end method

.method static synthetic access$600(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingBottom:I

    return v0
.end method

.method static synthetic access$700(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabMaxWidth:I

    return v0
.end method

.method static synthetic access$800(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabMinWidth:I

    return v0
.end method

.method static synthetic access$900(Landroid/support/design/widget/TabLayout;)I
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 88
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabTextAppearance:I

    return v0
.end method

.method private addTabView(Landroid/support/design/widget/TabLayout$Tab;IZ)V
    .locals 3
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;
    .param p2, "position"    # I
    .param p3, "setSelected"    # Z

    .prologue
    .line 624
    invoke-direct {p0, p1}, Landroid/support/design/widget/TabLayout;->createTabView(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout$TabView;

    move-result-object v0

    .line 625
    .local v0, "tabView":Landroid/support/design/widget/TabLayout$TabView;
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-direct {p0}, Landroid/support/design/widget/TabLayout;->createLayoutParamsForTabs()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v0, p2, v2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 626
    if-eqz p3, :cond_0

    .line 627
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/design/widget/TabLayout$TabView;->setSelected(Z)V

    .line 629
    :cond_0
    return-void
.end method

.method private addTabView(Landroid/support/design/widget/TabLayout$Tab;Z)V
    .locals 3
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;
    .param p2, "setSelected"    # Z

    .prologue
    .line 616
    invoke-direct {p0, p1}, Landroid/support/design/widget/TabLayout;->createTabView(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout$TabView;

    move-result-object v0

    .line 617
    .local v0, "tabView":Landroid/support/design/widget/TabLayout$TabView;
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-direct {p0}, Landroid/support/design/widget/TabLayout;->createLayoutParamsForTabs()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 618
    if-eqz p2, :cond_0

    .line 619
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/design/widget/TabLayout$TabView;->setSelected(Z)V

    .line 621
    :cond_0
    return-void
.end method

.method private animateToTab(I)V
    .locals 7
    .param p1, "newPosition"    # I

    .prologue
    const/16 v6, 0x12c

    const/4 v5, 0x0

    .line 704
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->clearAnimation()V

    .line 706
    const/4 v4, -0x1

    if-ne p1, v4, :cond_0

    .line 737
    :goto_0
    return-void

    .line 710
    :cond_0
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getWindowToken()Landroid/os/IBinder;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->isLaidOut(Landroid/view/View;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 713
    :cond_1
    const/4 v4, 0x1

    invoke-virtual {p0, p1, v5, v4}, Landroid/support/design/widget/TabLayout;->setScrollPosition(IFZ)V

    goto :goto_0

    .line 717
    :cond_2
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getScrollX()I

    move-result v2

    .line 718
    .local v2, "startScrollX":I
    invoke-direct {p0, p1, v5}, Landroid/support/design/widget/TabLayout;->calculateScrollXForTab(IF)I

    move-result v3

    .line 719
    .local v3, "targetScrollX":I
    const/16 v1, 0x12c

    .line 721
    .local v1, "duration":I
    if-eq v2, v3, :cond_3

    .line 722
    invoke-static {}, Landroid/support/design/widget/ViewUtils;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v0

    .line 723
    .local v0, "animator":Landroid/support/design/widget/ValueAnimatorCompat;
    sget-object v4, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v4}, Landroid/support/design/widget/ValueAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 724
    invoke-virtual {v0, v6}, Landroid/support/design/widget/ValueAnimatorCompat;->setDuration(I)V

    .line 725
    invoke-virtual {v0, v2, v3}, Landroid/support/design/widget/ValueAnimatorCompat;->setIntValues(II)V

    .line 726
    new-instance v4, Landroid/support/design/widget/TabLayout$2;

    invoke-direct {v4, p0}, Landroid/support/design/widget/TabLayout$2;-><init>(Landroid/support/design/widget/TabLayout;)V

    invoke-virtual {v0, v4}, Landroid/support/design/widget/ValueAnimatorCompat;->setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;)V

    .line 732
    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->start()V

    .line 736
    .end local v0    # "animator":Landroid/support/design/widget/ValueAnimatorCompat;
    :cond_3
    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v4, p1, v6}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->animateIndicatorToPosition(II)V

    goto :goto_0
.end method

.method private applyModeAndGravity()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 799
    const/4 v0, 0x0

    .line 800
    .local v0, "paddingStart":I
    iget v1, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    if-nez v1, :cond_0

    .line 802
    iget v1, p0, Landroid/support/design/widget/TabLayout;->mContentInsetStart:I

    iget v2, p0, Landroid/support/design/widget/TabLayout;->mTabPaddingStart:I

    sub-int/2addr v1, v2

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 804
    :cond_0
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-static {v1, v0, v3, v3, v3}, Landroid/support/v4/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 806
    iget v1, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    packed-switch v1, :pswitch_data_0

    .line 815
    :goto_0
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout;->updateTabViewsLayoutParams()V

    .line 816
    return-void

    .line 808
    :pswitch_0
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->setGravity(I)V

    goto :goto_0

    .line 811
    :pswitch_1
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    const v2, 0x800003

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->setGravity(I)V

    goto :goto_0

    .line 806
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private calculateScrollXForTab(IF)I
    .locals 7
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F

    .prologue
    const/4 v1, 0x0

    const/high16 v6, 0x3f000000    # 0.5f

    .line 782
    iget v4, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    if-nez v4, :cond_1

    .line 783
    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v4, p1}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 784
    .local v2, "selectedChild":Landroid/view/View;
    add-int/lit8 v4, p1, 0x1

    iget-object v5, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v5}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildCount()I

    move-result v5

    if-ge v4, v5, :cond_2

    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    add-int/lit8 v5, p1, 0x1

    invoke-virtual {v4, v5}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 787
    .local v0, "nextChild":Landroid/view/View;
    :goto_0
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    .line 788
    .local v3, "selectedWidth":I
    :goto_1
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v1

    .line 790
    .local v1, "nextWidth":I
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    move-result v4

    int-to-float v4, v4

    add-int v5, v3, v1

    int-to-float v5, v5

    mul-float/2addr v5, p2

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getWidth()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v6

    sub-float/2addr v4, v5

    float-to-int v1, v4

    .line 795
    .end local v0    # "nextChild":Landroid/view/View;
    .end local v1    # "nextWidth":I
    .end local v2    # "selectedChild":Landroid/view/View;
    .end local v3    # "selectedWidth":I
    :cond_1
    return v1

    .line 784
    .restart local v2    # "selectedChild":Landroid/view/View;
    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    .restart local v0    # "nextChild":Landroid/view/View;
    :cond_3
    move v3, v1

    .line 787
    goto :goto_1
.end method

.method private configureTab(Landroid/support/design/widget/TabLayout$Tab;I)V
    .locals 3
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;
    .param p2, "position"    # I

    .prologue
    .line 599
    invoke-virtual {p1, p2}, Landroid/support/design/widget/TabLayout$Tab;->setPosition(I)V

    .line 600
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 602
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 603
    .local v0, "count":I
    add-int/lit8 v1, p2, 0x1

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 604
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/TabLayout$Tab;

    invoke-virtual {v2, v1}, Landroid/support/design/widget/TabLayout$Tab;->setPosition(I)V

    .line 603
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 606
    :cond_0
    return-void
.end method

.method private static createColorStateList(II)Landroid/content/res/ColorStateList;
    .locals 4
    .param p0, "defaultColor"    # I
    .param p1, "selectedColor"    # I

    .prologue
    const/4 v3, 0x2

    .line 1405
    new-array v2, v3, [[I

    .line 1406
    .local v2, "states":[[I
    new-array v0, v3, [I

    .line 1407
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 1409
    .local v1, "i":I
    sget-object v3, Landroid/support/design/widget/TabLayout;->SELECTED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 1410
    aput p1, v0, v1

    .line 1411
    add-int/lit8 v1, v1, 0x1

    .line 1414
    sget-object v3, Landroid/support/design/widget/TabLayout;->EMPTY_STATE_SET:[I

    aput-object v3, v2, v1

    .line 1415
    aput p0, v0, v1

    .line 1416
    add-int/lit8 v1, v1, 0x1

    .line 1418
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method private createLayoutParamsForTabs()Landroid/widget/LinearLayout$LayoutParams;
    .locals 3

    .prologue
    .line 632
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    const/4 v2, -0x1

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 634
    .local v0, "lp":Landroid/widget/LinearLayout$LayoutParams;
    invoke-direct {p0, v0}, Landroid/support/design/widget/TabLayout;->updateTabViewLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V

    .line 635
    return-object v0
.end method

.method private createTabView(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout$TabView;
    .locals 2
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 582
    new-instance v0, Landroid/support/design/widget/TabLayout$TabView;

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Landroid/support/design/widget/TabLayout$TabView;-><init>(Landroid/support/design/widget/TabLayout;Landroid/content/Context;Landroid/support/design/widget/TabLayout$Tab;)V

    .line 583
    .local v0, "tabView":Landroid/support/design/widget/TabLayout$TabView;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/design/widget/TabLayout$TabView;->setFocusable(Z)V

    .line 585
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabClickListener:Landroid/view/View$OnClickListener;

    if-nez v1, :cond_0

    .line 586
    new-instance v1, Landroid/support/design/widget/TabLayout$1;

    invoke-direct {v1, p0}, Landroid/support/design/widget/TabLayout$1;-><init>(Landroid/support/design/widget/TabLayout;)V

    iput-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabClickListener:Landroid/view/View$OnClickListener;

    .line 594
    :cond_0
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/TabLayout$TabView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 595
    return-object v0
.end method

.method private dpToPx(I)I
    .locals 2
    .param p1, "dps"    # I

    .prologue
    .line 649
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float v1, p1

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private static isAnimationRunning(Landroid/view/animation/Animation;)Z
    .locals 1
    .param p0, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 748
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/view/animation/Animation;->hasStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/view/animation/Animation;->hasEnded()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private loadTextColorFromTextAppearance(I)Landroid/content/res/ColorStateList;
    .locals 3
    .param p1, "textAppearanceResId"    # I

    .prologue
    .line 1422
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Landroid/support/design/R$styleable;->TextAppearance:[I

    invoke-virtual {v1, p1, v2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 1425
    .local v0, "a":Landroid/content/res/TypedArray;
    :try_start_0
    sget v1, Landroid/support/design/R$styleable;->TextAppearance_android_textColor:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 1427
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    throw v1
.end method

.method private removeTabViewAt(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 699
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->removeViewAt(I)V

    .line 700
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->requestLayout()V

    .line 701
    return-void
.end method

.method private setSelectedTabView(I)V
    .locals 4
    .param p1, "position"    # I

    .prologue
    .line 740
    iget-object v3, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v3}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildCount()I

    move-result v2

    .line 741
    .local v2, "tabCount":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 742
    iget-object v3, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v3, v1}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 743
    .local v0, "child":Landroid/view/View;
    if-ne v1, p1, :cond_0

    const/4 v3, 0x1

    :goto_1
    invoke-virtual {v0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 741
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 743
    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    .line 745
    .end local v0    # "child":Landroid/view/View;
    :cond_1
    return-void
.end method

.method private updateAllTabs()V
    .locals 3

    .prologue
    .line 576
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildCount()I

    move-result v1

    .local v1, "z":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 577
    invoke-direct {p0, v0}, Landroid/support/design/widget/TabLayout;->updateTab(I)V

    .line 576
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 579
    :cond_0
    return-void
.end method

.method private updateTab(I)V
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 609
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v1, p1}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/TabLayout$TabView;

    .line 610
    .local v0, "view":Landroid/support/design/widget/TabLayout$TabView;
    if-eqz v0, :cond_0

    .line 611
    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout$TabView;->update()V

    .line 613
    :cond_0
    return-void
.end method

.method private updateTabViewLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V
    .locals 2
    .param p1, "lp"    # Landroid/widget/LinearLayout$LayoutParams;

    .prologue
    .line 639
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabGravity:I

    if-nez v0, :cond_0

    .line 640
    const/4 v0, 0x0

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 641
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 646
    :goto_0
    return-void

    .line 643
    :cond_0
    const/4 v0, -0x2

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 644
    const/4 v0, 0x0

    iput v0, p1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    goto :goto_0
.end method

.method private updateTabViewsLayoutParams()V
    .locals 3

    .prologue
    .line 819
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 820
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v2, v1}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 821
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p0, v2}, Landroid/support/design/widget/TabLayout;->updateTabViewLayoutParams(Landroid/widget/LinearLayout$LayoutParams;)V

    .line 822
    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    .line 819
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 824
    .end local v0    # "child":Landroid/view/View;
    :cond_0
    return-void
.end method


# virtual methods
.method public addTab(Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 1
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 309
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Landroid/support/design/widget/TabLayout;->addTab(Landroid/support/design/widget/TabLayout$Tab;Z)V

    .line 310
    return-void
.end method

.method public addTab(Landroid/support/design/widget/TabLayout$Tab;I)V
    .locals 1
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;
    .param p2, "position"    # I

    .prologue
    .line 320
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/design/widget/TabLayout;->addTab(Landroid/support/design/widget/TabLayout$Tab;IZ)V

    .line 321
    return-void
.end method

.method public addTab(Landroid/support/design/widget/TabLayout$Tab;IZ)V
    .locals 2
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;
    .param p2, "position"    # I
    .param p3, "setSelected"    # Z

    .prologue
    .line 349
    invoke-static {p1}, Landroid/support/design/widget/TabLayout$Tab;->access$000(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 350
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Tab belongs to a different TabLayout."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 353
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Landroid/support/design/widget/TabLayout;->addTabView(Landroid/support/design/widget/TabLayout$Tab;IZ)V

    .line 354
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/TabLayout;->configureTab(Landroid/support/design/widget/TabLayout$Tab;I)V

    .line 355
    if-eqz p3, :cond_1

    .line 356
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->select()V

    .line 358
    :cond_1
    return-void
.end method

.method public addTab(Landroid/support/design/widget/TabLayout$Tab;Z)V
    .locals 2
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;
    .param p2, "setSelected"    # Z

    .prologue
    .line 330
    invoke-static {p1}, Landroid/support/design/widget/TabLayout$Tab;->access$000(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 331
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Tab belongs to a different TabLayout."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 334
    :cond_0
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/TabLayout;->addTabView(Landroid/support/design/widget/TabLayout$Tab;Z)V

    .line 335
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/TabLayout;->configureTab(Landroid/support/design/widget/TabLayout$Tab;I)V

    .line 336
    if-eqz p2, :cond_1

    .line 337
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->select()V

    .line 339
    :cond_1
    return-void
.end method

.method public getTabAt(I)Landroid/support/design/widget/TabLayout$Tab;
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 394
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/design/widget/TabLayout$Tab;

    return-object v0
.end method

.method public getTabCount()I
    .locals 1

    .prologue
    .line 387
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getTabGravity()I
    .locals 1

    .prologue
    .line 499
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabGravity:I

    return v0
.end method

.method public getTabMode()I
    .locals 1

    .prologue
    .line 477
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    return v0
.end method

.method public getTabTextColors()Landroid/content/res/ColorStateList;
    .locals 1

    .prologue
    .line 516
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public newTab()Landroid/support/design/widget/TabLayout$Tab;
    .locals 1

    .prologue
    .line 378
    new-instance v0, Landroid/support/design/widget/TabLayout$Tab;

    invoke-direct {v0, p0}, Landroid/support/design/widget/TabLayout$Tab;-><init>(Landroid/support/design/widget/TabLayout;)V

    return-object v0
.end method

.method protected onMeasure(II)V
    .locals 10
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/16 v7, 0x30

    const/4 v9, 0x1

    const/high16 v8, 0x40000000    # 2.0f

    .line 656
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    .line 669
    :goto_0
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 671
    iget v6, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    if-ne v6, v9, :cond_0

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getChildCount()I

    move-result v6

    if-ne v6, v9, :cond_0

    .line 674
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Landroid/support/design/widget/TabLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 675
    .local v0, "child":Landroid/view/View;
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getMeasuredWidth()I

    move-result v5

    .line 677
    .local v5, "width":I
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    if-le v6, v5, :cond_0

    .line 680
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getPaddingTop()I

    move-result v6

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getPaddingBottom()I

    move-result v7

    add-int/2addr v6, v7

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    iget v7, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {p2, v6, v7}, Landroid/support/design/widget/TabLayout;->getChildMeasureSpec(III)I

    move-result v1

    .line 682
    .local v1, "childHeightMeasureSpec":I
    invoke-static {v5, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    .line 683
    .local v2, "childWidthMeasureSpec":I
    invoke-virtual {v0, v2, v1}, Landroid/view/View;->measure(II)V

    .line 689
    .end local v0    # "child":Landroid/view/View;
    .end local v1    # "childHeightMeasureSpec":I
    .end local v2    # "childWidthMeasureSpec":I
    .end local v5    # "width":I
    :cond_0
    iget v4, p0, Landroid/support/design/widget/TabLayout;->mRequestedTabMaxWidth:I

    .line 690
    .local v4, "maxTabWidth":I
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getMeasuredWidth()I

    move-result v6

    const/16 v7, 0x38

    invoke-direct {p0, v7}, Landroid/support/design/widget/TabLayout;->dpToPx(I)I

    move-result v7

    sub-int v3, v6, v7

    .line 691
    .local v3, "defaultTabMaxWidth":I
    if-eqz v4, :cond_1

    if-le v4, v3, :cond_2

    .line 693
    :cond_1
    move v4, v3

    .line 695
    :cond_2
    iput v4, p0, Landroid/support/design/widget/TabLayout;->mTabMaxWidth:I

    .line 696
    return-void

    .line 658
    .end local v3    # "defaultTabMaxWidth":I
    .end local v4    # "maxTabWidth":I
    :sswitch_0
    invoke-direct {p0, v7}, Landroid/support/design/widget/TabLayout;->dpToPx(I)I

    move-result v6

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v7

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v6

    invoke-static {v6, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 661
    goto :goto_0

    .line 663
    :sswitch_1
    invoke-direct {p0, v7}, Landroid/support/design/widget/TabLayout;->dpToPx(I)I

    move-result v6

    invoke-static {v6, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    goto :goto_0

    .line 656
    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_0
        0x0 -> :sswitch_1
    .end sparse-switch
.end method

.method public removeAllTabs()V
    .locals 3

    .prologue
    .line 441
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->removeAllViews()V

    .line 443
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/support/design/widget/TabLayout$Tab;>;"
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 444
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/design/widget/TabLayout$Tab;

    .line 445
    .local v1, "tab":Landroid/support/design/widget/TabLayout$Tab;
    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/support/design/widget/TabLayout$Tab;->setPosition(I)V

    .line 446
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 448
    .end local v1    # "tab":Landroid/support/design/widget/TabLayout$Tab;
    :cond_0
    return-void
.end method

.method public removeTab(Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 2
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 404
    invoke-static {p1}, Landroid/support/design/widget/TabLayout$Tab;->access$000(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 405
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Tab does not belong to this TabLayout."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 408
    :cond_0
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getPosition()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout;->removeTabAt(I)V

    .line 409
    return-void
.end method

.method public removeTabAt(I)V
    .locals 7
    .param p1, "position"    # I

    .prologue
    const/4 v5, 0x0

    .line 418
    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    if-eqz v4, :cond_1

    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    invoke-virtual {v4}, Landroid/support/design/widget/TabLayout$Tab;->getPosition()I

    move-result v3

    .line 419
    .local v3, "selectedTabPosition":I
    :goto_0
    invoke-direct {p0, p1}, Landroid/support/design/widget/TabLayout;->removeTabViewAt(I)V

    .line 421
    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/TabLayout$Tab;

    .line 422
    .local v2, "removedTab":Landroid/support/design/widget/TabLayout$Tab;
    if-eqz v2, :cond_0

    .line 423
    const/4 v4, -0x1

    invoke-virtual {v2, v4}, Landroid/support/design/widget/TabLayout$Tab;->setPosition(I)V

    .line 426
    :cond_0
    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 427
    .local v1, "newTabCount":I
    move v0, p1

    .local v0, "i":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 428
    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/TabLayout$Tab;

    invoke-virtual {v4, v0}, Landroid/support/design/widget/TabLayout$Tab;->setPosition(I)V

    .line 427
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0    # "i":I
    .end local v1    # "newTabCount":I
    .end local v2    # "removedTab":Landroid/support/design/widget/TabLayout$Tab;
    .end local v3    # "selectedTabPosition":I
    :cond_1
    move v3, v5

    .line 418
    goto :goto_0

    .line 431
    .restart local v0    # "i":I
    .restart local v1    # "newTabCount":I
    .restart local v2    # "removedTab":Landroid/support/design/widget/TabLayout$Tab;
    .restart local v3    # "selectedTabPosition":I
    :cond_2
    if-ne v3, p1, :cond_3

    .line 432
    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x0

    :goto_2
    invoke-virtual {p0, v4}, Landroid/support/design/widget/TabLayout;->selectTab(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 434
    :cond_3
    return-void

    .line 432
    :cond_4
    iget-object v4, p0, Landroid/support/design/widget/TabLayout;->mTabs:Ljava/util/ArrayList;

    add-int/lit8 v6, p1, -0x1

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/design/widget/TabLayout$Tab;

    goto :goto_2
.end method

.method selectTab(Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 3
    .param p1, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    const/4 v1, -0x1

    .line 752
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    if-ne v2, p1, :cond_2

    .line 753
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    if-eqz v1, :cond_1

    .line 754
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mOnTabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    if-eqz v1, :cond_0

    .line 755
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mOnTabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    invoke-interface {v1, v2}, Landroid/support/design/widget/TabLayout$OnTabSelectedListener;->onTabReselected(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 757
    :cond_0
    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getPosition()I

    move-result v1

    invoke-direct {p0, v1}, Landroid/support/design/widget/TabLayout;->animateToTab(I)V

    .line 779
    :cond_1
    :goto_0
    return-void

    .line 760
    :cond_2
    if-eqz p1, :cond_5

    invoke-virtual {p1}, Landroid/support/design/widget/TabLayout$Tab;->getPosition()I

    move-result v0

    .line 761
    .local v0, "newPosition":I
    :goto_1
    invoke-direct {p0, v0}, Landroid/support/design/widget/TabLayout;->setSelectedTabView(I)V

    .line 763
    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    if-eqz v2, :cond_3

    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    invoke-virtual {v2}, Landroid/support/design/widget/TabLayout$Tab;->getPosition()I

    move-result v2

    if-ne v2, v1, :cond_6

    :cond_3
    if-eq v0, v1, :cond_6

    .line 766
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Landroid/support/design/widget/TabLayout;->setScrollPosition(IFZ)V

    .line 771
    :goto_2
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    if-eqz v1, :cond_4

    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mOnTabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    if-eqz v1, :cond_4

    .line 772
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mOnTabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    invoke-interface {v1, v2}, Landroid/support/design/widget/TabLayout$OnTabSelectedListener;->onTabUnselected(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 774
    :cond_4
    iput-object p1, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    .line 775
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    if-eqz v1, :cond_1

    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mOnTabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    if-eqz v1, :cond_1

    .line 776
    iget-object v1, p0, Landroid/support/design/widget/TabLayout;->mOnTabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    iget-object v2, p0, Landroid/support/design/widget/TabLayout;->mSelectedTab:Landroid/support/design/widget/TabLayout$Tab;

    invoke-interface {v1, v2}, Landroid/support/design/widget/TabLayout$OnTabSelectedListener;->onTabSelected(Landroid/support/design/widget/TabLayout$Tab;)V

    goto :goto_0

    .end local v0    # "newPosition":I
    :cond_5
    move v0, v1

    .line 760
    goto :goto_1

    .line 768
    .restart local v0    # "newPosition":I
    :cond_6
    invoke-direct {p0, v0}, Landroid/support/design/widget/TabLayout;->animateToTab(I)V

    goto :goto_2
.end method

.method public setOnTabSelectedListener(Landroid/support/design/widget/TabLayout$OnTabSelectedListener;)V
    .locals 0
    .param p1, "onTabSelectedListener"    # Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    .prologue
    .line 367
    iput-object p1, p0, Landroid/support/design/widget/TabLayout;->mOnTabSelectedListener:Landroid/support/design/widget/TabLayout$OnTabSelectedListener;

    .line 368
    return-void
.end method

.method public setScrollPosition(IFZ)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "updateSelectedText"    # Z

    .prologue
    .line 285
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    invoke-static {v0}, Landroid/support/design/widget/TabLayout;->isAnimationRunning(Landroid/view/animation/Animation;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 300
    :cond_0
    :goto_0
    return-void

    .line 288
    :cond_1
    if-ltz p1, :cond_0

    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 293
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabStrip:Landroid/support/design/widget/TabLayout$SlidingTabStrip;

    invoke-virtual {v0, p1, p2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->setIndicatorPositionFromTabPosition(IF)V

    .line 294
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/TabLayout;->calculateScrollXForTab(IF)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/support/design/widget/TabLayout;->scrollTo(II)V

    .line 297
    if-eqz p3, :cond_0

    .line 298
    int-to-float v0, p1

    add-float/2addr v0, p2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-direct {p0, v0}, Landroid/support/design/widget/TabLayout;->setSelectedTabView(I)V

    goto :goto_0
.end method

.method public setTabGravity(I)V
    .locals 1
    .param p1, "gravity"    # I

    .prologue
    .line 486
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mTabGravity:I

    if-eq v0, p1, :cond_0

    .line 487
    iput p1, p0, Landroid/support/design/widget/TabLayout;->mTabGravity:I

    .line 488
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout;->applyModeAndGravity()V

    .line 490
    :cond_0
    return-void
.end method

.method public setTabMode(I)V
    .locals 1
    .param p1, "mode"    # I

    .prologue
    .line 464
    iget v0, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    if-eq p1, v0, :cond_0

    .line 465
    iput p1, p0, Landroid/support/design/widget/TabLayout;->mMode:I

    .line 466
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout;->applyModeAndGravity()V

    .line 468
    :cond_0
    return-void
.end method

.method public setTabTextColors(II)V
    .locals 1
    .param p1, "normalColor"    # I
    .param p2, "selectedColor"    # I

    .prologue
    .line 523
    invoke-static {p1, p2}, Landroid/support/design/widget/TabLayout;->createColorStateList(II)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout;->setTabTextColors(Landroid/content/res/ColorStateList;)V

    .line 524
    return-void
.end method

.method public setTabTextColors(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "textColor"    # Landroid/content/res/ColorStateList;

    .prologue
    .line 506
    iget-object v0, p0, Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_0

    .line 507
    iput-object p1, p0, Landroid/support/design/widget/TabLayout;->mTabTextColors:Landroid/content/res/ColorStateList;

    .line 508
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout;->updateAllTabs()V

    .line 510
    :cond_0
    return-void
.end method

.method public setTabsFromPagerAdapter(Landroid/support/v4/view/PagerAdapter;)V
    .locals 4
    .param p1, "adapter"    # Landroid/support/v4/view/PagerAdapter;

    .prologue
    .line 569
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->removeAllTabs()V

    .line 570
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {p1}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v0

    .local v0, "count":I
    :goto_0
    if-ge v1, v0, :cond_0

    .line 571
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout;->newTab()Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v2

    invoke-virtual {p1, v1}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/support/design/widget/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/design/widget/TabLayout;->addTab(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 570
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 573
    :cond_0
    return-void
.end method

.method public setupWithViewPager(Landroid/support/v4/view/ViewPager;)V
    .locals 3
    .param p1, "viewPager"    # Landroid/support/v4/view/ViewPager;

    .prologue
    .line 544
    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    .line 545
    .local v0, "adapter":Landroid/support/v4/view/PagerAdapter;
    if-nez v0, :cond_0

    .line 546
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "ViewPager does not have a PagerAdapter set"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 550
    :cond_0
    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout;->setTabsFromPagerAdapter(Landroid/support/v4/view/PagerAdapter;)V

    .line 553
    new-instance v1, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;

    invoke-direct {v1, p0}, Landroid/support/design/widget/TabLayout$TabLayoutOnPageChangeListener;-><init>(Landroid/support/design/widget/TabLayout;)V

    invoke-virtual {p1, v1}, Landroid/support/v4/view/ViewPager;->addOnPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)V

    .line 556
    new-instance v1, Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;

    invoke-direct {v1, p1}, Landroid/support/design/widget/TabLayout$ViewPagerOnTabSelectedListener;-><init>(Landroid/support/v4/view/ViewPager;)V

    invoke-virtual {p0, v1}, Landroid/support/design/widget/TabLayout;->setOnTabSelectedListener(Landroid/support/design/widget/TabLayout$OnTabSelectedListener;)V

    .line 557
    return-void
.end method
