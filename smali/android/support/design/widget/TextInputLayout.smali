.class public Landroid/support/design/widget/TextInputLayout;
.super Landroid/widget/LinearLayout;
.source "TextInputLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/design/widget/TextInputLayout$TextInputAccessibilityDelegate;
    }
.end annotation


# static fields
.field private static final ANIMATION_DURATION:I = 0xc8

.field private static final MSG_UPDATE_LABEL:I


# instance fields
.field private mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

.field private final mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

.field private mEditText:Landroid/widget/EditText;

.field private mErrorEnabled:Z

.field private mErrorTextAppearance:I

.field private mErrorView:Landroid/widget/TextView;

.field private final mHandler:Landroid/os/Handler;

.field private mHint:Ljava/lang/CharSequence;

.field private mLabelTextColor:Landroid/content/res/ColorStateList;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/design/widget/TextInputLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v7, -0x1

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 77
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 79
    invoke-virtual {p0, v6}, Landroid/support/design/widget/TextInputLayout;->setOrientation(I)V

    .line 80
    invoke-virtual {p0, v5}, Landroid/support/design/widget/TextInputLayout;->setWillNotDraw(Z)V

    .line 82
    new-instance v3, Landroid/support/design/widget/CollapsingTextHelper;

    invoke-direct {v3, p0}, Landroid/support/design/widget/CollapsingTextHelper;-><init>(Landroid/view/View;)V

    iput-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    .line 83
    new-instance v3, Landroid/os/Handler;

    new-instance v4, Landroid/support/design/widget/TextInputLayout$1;

    invoke-direct {v4, p0}, Landroid/support/design/widget/TextInputLayout$1;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-direct {v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Handler$Callback;)V

    iput-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mHandler:Landroid/os/Handler;

    .line 95
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    sget-object v4, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setTextSizeInterpolator(Landroid/view/animation/Interpolator;)V

    .line 96
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    new-instance v4, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v4}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setPositionInterpolator(Landroid/view/animation/Interpolator;)V

    .line 97
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    const/16 v4, 0x30

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextVerticalGravity(I)V

    .line 99
    sget-object v3, Landroid/support/design/R$styleable;->TextInputLayout:[I

    sget v4, Landroid/support/design/R$style;->Widget_Design_TextInputLayout:I

    invoke-virtual {p1, p2, v3, v5, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 101
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Landroid/support/design/R$styleable;->TextInputLayout_android_hint:I

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mHint:Ljava/lang/CharSequence;

    .line 103
    sget v3, Landroid/support/design/R$styleable;->TextInputLayout_hintTextAppearance:I

    invoke-virtual {v0, v3, v7}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    .line 105
    .local v2, "hintAppearance":I
    if-eq v2, v7, :cond_0

    .line 106
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v3, v2}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextAppearance(I)V

    .line 109
    :cond_0
    sget v3, Landroid/support/design/R$styleable;->TextInputLayout_errorTextAppearance:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    iput v3, p0, Landroid/support/design/widget/TextInputLayout;->mErrorTextAppearance:I

    .line 110
    sget v3, Landroid/support/design/R$styleable;->TextInputLayout_errorEnabled:I

    invoke-virtual {v0, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 114
    .local v1, "errorEnabled":Z
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v3}, Landroid/support/design/widget/CollapsingTextHelper;->getCollapsedTextColor()I

    move-result v3

    invoke-direct {p0, v3}, Landroid/support/design/widget/TextInputLayout;->createLabelTextColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mLabelTextColor:Landroid/content/res/ColorStateList;

    .line 117
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mLabelTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextColor(I)V

    .line 118
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mLabelTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v4}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextColor(I)V

    .line 120
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 122
    if-eqz v1, :cond_1

    .line 123
    invoke-virtual {p0, v6}, Landroid/support/design/widget/TextInputLayout;->setErrorEnabled(Z)V

    .line 126
    :cond_1
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getImportantForAccessibility(Landroid/view/View;)I

    move-result v3

    if-nez v3, :cond_2

    .line 129
    invoke-static {p0, v6}, Landroid/support/v4/view/ViewCompat;->setImportantForAccessibility(Landroid/view/View;I)V

    .line 133
    :cond_2
    new-instance v3, Landroid/support/design/widget/TextInputLayout$TextInputAccessibilityDelegate;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Landroid/support/design/widget/TextInputLayout$TextInputAccessibilityDelegate;-><init>(Landroid/support/design/widget/TextInputLayout;Landroid/support/design/widget/TextInputLayout$1;)V

    invoke-static {p0, v3}, Landroid/support/v4/view/ViewCompat;->setAccessibilityDelegate(Landroid/view/View;Landroid/support/v4/view/AccessibilityDelegateCompat;)V

    .line 134
    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/TextInputLayout;Z)V
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;
    .param p1, "x1"    # Z

    .prologue
    .line 53
    invoke-direct {p0, p1}, Landroid/support/design/widget/TextInputLayout;->updateLabelVisibility(Z)V

    return-void
.end method

.method static synthetic access$200(Landroid/support/design/widget/TextInputLayout;)Landroid/os/Handler;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;

    .prologue
    .line 53
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$300(Landroid/support/design/widget/TextInputLayout;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;

    .prologue
    .line 53
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Landroid/support/design/widget/TextInputLayout;)Landroid/support/design/widget/CollapsingTextHelper;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;

    .prologue
    .line 53
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    return-object v0
.end method

.method static synthetic access$500(Landroid/support/design/widget/TextInputLayout;)Landroid/widget/EditText;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TextInputLayout;

    .prologue
    .line 53
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method private animateToExpansionFraction(F)V
    .locals 2
    .param p1, "target"    # F

    .prologue
    .line 360
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    if-nez v0, :cond_1

    .line 361
    invoke-static {}, Landroid/support/design/widget/ViewUtils;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    .line 362
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->LINEAR_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 363
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    const/16 v1, 0xc8

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setDuration(I)V

    .line 364
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    new-instance v1, Landroid/support/design/widget/TextInputLayout$5;

    invoke-direct {v1, p0}, Landroid/support/design/widget/TextInputLayout$5;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;)V

    .line 374
    :cond_0
    :goto_0
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    iget-object v1, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v1}, Landroid/support/design/widget/CollapsingTextHelper;->getExpansionFraction()F

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/support/design/widget/ValueAnimatorCompat;->setFloatValues(FF)V

    .line 375
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->start()V

    .line 376
    return-void

    .line 370
    :cond_1
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 371
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mAnimator:Landroid/support/design/widget/ValueAnimatorCompat;

    invoke-virtual {v0}, Landroid/support/design/widget/ValueAnimatorCompat;->cancel()V

    goto :goto_0
.end method

.method private collapseHint(Z)V
    .locals 2
    .param p1, "animate"    # Z

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 344
    if-eqz p1, :cond_0

    .line 345
    invoke-direct {p0, v1}, Landroid/support/design/widget/TextInputLayout;->animateToExpansionFraction(F)V

    .line 349
    :goto_0
    return-void

    .line 347
    :cond_0
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/CollapsingTextHelper;->setExpansionFraction(F)V

    goto :goto_0
.end method

.method private createLabelTextColorStateList(I)Landroid/content/res/ColorStateList;
    .locals 4
    .param p1, "color"    # I

    .prologue
    const/4 v3, 0x2

    .line 379
    new-array v2, v3, [[I

    .line 380
    .local v2, "states":[[I
    new-array v0, v3, [I

    .line 381
    .local v0, "colors":[I
    const/4 v1, 0x0

    .line 384
    .local v1, "i":I
    sget-object v3, Landroid/support/design/widget/TextInputLayout;->FOCUSED_STATE_SET:[I

    aput-object v3, v2, v1

    .line 385
    aput p1, v0, v1

    .line 386
    add-int/lit8 v1, v1, 0x1

    .line 388
    sget-object v3, Landroid/support/design/widget/TextInputLayout;->EMPTY_STATE_SET:[I

    aput-object v3, v2, v1

    .line 389
    const v3, 0x101009a

    invoke-direct {p0, v3}, Landroid/support/design/widget/TextInputLayout;->getThemeAttrColor(I)I

    move-result v3

    aput v3, v0, v1

    .line 390
    add-int/lit8 v1, v1, 0x1

    .line 392
    new-instance v3, Landroid/content/res/ColorStateList;

    invoke-direct {v3, v2, v0}, Landroid/content/res/ColorStateList;-><init>([[I[I)V

    return-object v3
.end method

.method private expandHint(Z)V
    .locals 2
    .param p1, "animate"    # Z

    .prologue
    const/4 v1, 0x0

    .line 352
    if-eqz p1, :cond_0

    .line 353
    invoke-direct {p0, v1}, Landroid/support/design/widget/TextInputLayout;->animateToExpansionFraction(F)V

    .line 357
    :goto_0
    return-void

    .line 355
    :cond_0
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, v1}, Landroid/support/design/widget/CollapsingTextHelper;->setExpansionFraction(F)V

    goto :goto_0
.end method

.method private getThemeAttrColor(I)I
    .locals 3
    .param p1, "attr"    # I

    .prologue
    .line 396
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 397
    .local v0, "tv":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 398
    iget v1, v0, Landroid/util/TypedValue;->data:I

    .line 400
    :goto_0
    return v1

    :cond_0
    const v1, -0xff01

    goto :goto_0
.end method

.method private setEditText(Landroid/widget/EditText;Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
    .locals 7
    .param p1, "editText"    # Landroid/widget/EditText;
    .param p2, "lp"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    const/4 v6, 0x0

    .line 149
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    if-eqz v2, :cond_0

    .line 150
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "We already have an EditText, can only have one"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 152
    :cond_0
    iput-object p1, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    .line 155
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getTextSize()F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedTextSize(F)V

    .line 158
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    new-instance v3, Landroid/support/design/widget/TextInputLayout$2;

    invoke-direct {v3, p0}, Landroid/support/design/widget/TextInputLayout$2;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 175
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    new-instance v3, Landroid/support/design/widget/TextInputLayout$3;

    invoke-direct {v3, p0}, Landroid/support/design/widget/TextInputLayout$3;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 183
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mHint:Ljava/lang/CharSequence;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 184
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p0, v2}, Landroid/support/design/widget/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 186
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setHint(Ljava/lang/CharSequence;)V

    .line 189
    :cond_1
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    if-eqz v2, :cond_2

    .line 191
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-static {v4}, Landroid/support/v4/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v4

    iget-object v5, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v5

    invoke-static {v2, v3, v6, v4, v5}, Landroid/support/v4/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 196
    :cond_2
    invoke-direct {p0, v6}, Landroid/support/design/widget/TextInputLayout;->updateLabelVisibility(Z)V

    .line 200
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 201
    .local v0, "newLp":Landroid/widget/LinearLayout$LayoutParams;
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 202
    .local v1, "paint":Landroid/graphics/Paint;
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v2}, Landroid/support/design/widget/CollapsingTextHelper;->getExpandedTextSize()F

    move-result v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 203
    invoke-virtual {v1}, Landroid/graphics/Paint;->ascent()F

    move-result v2

    neg-float v2, v2

    float-to-int v2, v2

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 205
    return-object v0
.end method

.method private updateLabelVisibility(Z)V
    .locals 6
    .param p1, "animate"    # Z

    .prologue
    .line 209
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v0, 0x1

    .line 210
    .local v0, "hasText":Z
    :goto_0
    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->isFocused()Z

    move-result v1

    .line 212
    .local v1, "isFocused":Z
    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mLabelTextColor:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_2

    sget-object v2, Landroid/support/design/widget/TextInputLayout;->FOCUSED_STATE_SET:[I

    :goto_1
    iget-object v5, p0, Landroid/support/design/widget/TextInputLayout;->mLabelTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v5}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v5

    invoke-virtual {v4, v2, v5}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v2

    invoke-virtual {v3, v2}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedTextColor(I)V

    .line 216
    if-nez v0, :cond_0

    if-eqz v1, :cond_3

    .line 218
    :cond_0
    invoke-direct {p0, p1}, Landroid/support/design/widget/TextInputLayout;->collapseHint(Z)V

    .line 223
    :goto_2
    return-void

    .line 209
    .end local v0    # "hasText":Z
    .end local v1    # "isFocused":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0

    .line 212
    .restart local v0    # "hasText":Z
    .restart local v1    # "isFocused":Z
    :cond_2
    sget-object v2, Landroid/support/design/widget/TextInputLayout;->EMPTY_STATE_SET:[I

    goto :goto_1

    .line 221
    :cond_3
    invoke-direct {p0, p1}, Landroid/support/design/widget/TextInputLayout;->expandHint(Z)V

    goto :goto_2
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 1
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 138
    instance-of v0, p1, Landroid/widget/EditText;

    if-eqz v0, :cond_0

    move-object v0, p1

    .line 139
    check-cast v0, Landroid/widget/EditText;

    invoke-direct {p0, v0, p3}, Landroid/support/design/widget/TextInputLayout;->setEditText(Landroid/widget/EditText;Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;

    move-result-object p3

    .line 140
    const/4 v0, 0x0

    invoke-super {p0, p1, v0, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 145
    :goto_0
    return-void

    .line 143
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 318
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->draw(Landroid/graphics/Canvas;)V

    .line 319
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->draw(Landroid/graphics/Canvas;)V

    .line 320
    return-void
.end method

.method public getEditText()Landroid/widget/EditText;
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    return-object v0
.end method

.method protected onLayout(ZIIII)V
    .locals 8
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 324
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 326
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Landroid/support/design/widget/CollapsingTextHelper;->onLayout(ZIIII)V

    .line 328
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getLeft()I

    move-result v0

    iget-object v1, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingLeft()I

    move-result v1

    add-int v6, v0, v1

    .line 330
    .local v6, "l":I
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getRight()I

    move-result v0

    iget-object v1, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getPaddingRight()I

    move-result v1

    sub-int v7, v0, v1

    .line 332
    .local v7, "r":I
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    iget-object v1, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getTop()I

    move-result v1

    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getPaddingTop()I

    move-result v2

    add-int/2addr v1, v2

    iget-object v2, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getBottom()I

    move-result v2

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0, v6, v1, v7, v2}, Landroid/support/design/widget/CollapsingTextHelper;->setExpandedBounds(IIII)V

    .line 338
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getPaddingTop()I

    move-result v1

    sub-int v2, p5, p3

    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v0, v6, v1, v7, v2}, Landroid/support/design/widget/CollapsingTextHelper;->setCollapsedBounds(IIII)V

    .line 341
    .end local v6    # "l":I
    .end local v7    # "r":I
    :cond_0
    return-void
.end method

.method public setError(Ljava/lang/CharSequence;)V
    .locals 6
    .param p1, "error"    # Ljava/lang/CharSequence;

    .prologue
    const-wide/16 v4, 0xc8

    const/4 v2, 0x0

    .line 278
    iget-boolean v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorEnabled:Z

    if-nez v0, :cond_1

    .line 279
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 314
    :goto_0
    return-void

    .line 284
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->setErrorEnabled(Z)V

    .line 287
    :cond_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 288
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 289
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 290
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-static {v0, v2}, Landroid/support/v4/view/ViewCompat;->setAlpha(Landroid/view/View;F)V

    .line 291
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    .line 313
    :cond_2
    :goto_1
    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->sendAccessibilityEvent(I)V

    goto :goto_0

    .line 298
    :cond_3
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    .line 299
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->animate(Landroid/view/View;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->alpha(F)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setDuration(J)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    sget-object v1, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    new-instance v1, Landroid/support/design/widget/TextInputLayout$4;

    invoke-direct {v1, p0}, Landroid/support/design/widget/TextInputLayout$4;-><init>(Landroid/support/design/widget/TextInputLayout;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->setListener(Landroid/support/v4/view/ViewPropertyAnimatorListener;)Landroid/support/v4/view/ViewPropertyAnimatorCompat;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPropertyAnimatorCompat;->start()V

    goto :goto_1
.end method

.method public setErrorEnabled(Z)V
    .locals 5
    .param p1, "enabled"    # Z

    .prologue
    .line 248
    iget-boolean v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorEnabled:Z

    if-eq v0, p1, :cond_1

    .line 249
    if-eqz p1, :cond_2

    .line 250
    new-instance v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    .line 251
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/support/design/widget/TextInputLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Landroid/support/design/widget/TextInputLayout;->mErrorTextAppearance:I

    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 252
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 253
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->addView(Landroid/view/View;)V

    .line 255
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    if-eqz v0, :cond_0

    .line 257
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    iget-object v1, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getPaddingStart(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x0

    iget-object v3, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-static {v3}, Landroid/support/v4/view/ViewCompat;->getPaddingEnd(Landroid/view/View;)I

    move-result v3

    iget-object v4, p0, Landroid/support/design/widget/TextInputLayout;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getPaddingBottom()I

    move-result v4

    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v4/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 264
    :cond_0
    :goto_0
    iput-boolean p1, p0, Landroid/support/design/widget/TextInputLayout;->mErrorEnabled:Z

    .line 266
    :cond_1
    return-void

    .line 261
    :cond_2
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->removeView(Landroid/view/View;)V

    .line 262
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mErrorView:Landroid/widget/TextView;

    goto :goto_0
.end method

.method public setHint(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "hint"    # Ljava/lang/CharSequence;

    .prologue
    .line 236
    iput-object p1, p0, Landroid/support/design/widget/TextInputLayout;->mHint:Ljava/lang/CharSequence;

    .line 237
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout;->mCollapsingTextHelper:Landroid/support/design/widget/CollapsingTextHelper;

    invoke-virtual {v0, p1}, Landroid/support/design/widget/CollapsingTextHelper;->setText(Ljava/lang/CharSequence;)V

    .line 239
    const/16 v0, 0x800

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TextInputLayout;->sendAccessibilityEvent(I)V

    .line 240
    return-void
.end method
