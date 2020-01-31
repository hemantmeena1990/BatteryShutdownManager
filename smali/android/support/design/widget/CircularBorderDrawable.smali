.class Landroid/support/design/widget/CircularBorderDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "CircularBorderDrawable.java"


# static fields
.field private static final DRAW_STROKE_WIDTH_MULTIPLE:F = 1.3333f


# instance fields
.field mBorderWidth:F

.field private mBottomInnerStrokeColor:I

.field private mBottomOuterStrokeColor:I

.field private mInvalidateShader:Z

.field final mPaint:Landroid/graphics/Paint;

.field final mRect:Landroid/graphics/Rect;

.field final mRectF:Landroid/graphics/RectF;

.field private mTopInnerStrokeColor:I

.field private mTopOuterStrokeColor:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 55
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 43
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mRect:Landroid/graphics/Rect;

    .line 44
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mRectF:Landroid/graphics/RectF;

    .line 53
    iput-boolean v1, p0, Landroid/support/design/widget/CircularBorderDrawable;->mInvalidateShader:Z

    .line 56
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mPaint:Landroid/graphics/Paint;

    .line 57
    iget-object v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 58
    return-void
.end method

.method private createGradientShader()Landroid/graphics/Shader;
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/high16 v7, 0x3f800000    # 1.0f

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 137
    iget-object v9, p0, Landroid/support/design/widget/CircularBorderDrawable;->mRect:Landroid/graphics/Rect;

    .line 138
    .local v9, "rect":Landroid/graphics/Rect;
    invoke-virtual {p0, v9}, Landroid/support/design/widget/CircularBorderDrawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 140
    iget v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBorderWidth:F

    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    div-float v8, v0, v2

    .line 142
    .local v8, "borderRatio":F
    const/4 v0, 0x6

    new-array v5, v0, [I

    .line 143
    .local v5, "colors":[I
    iget v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mTopOuterStrokeColor:I

    aput v0, v5, v3

    .line 144
    iget v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mTopInnerStrokeColor:I

    aput v0, v5, v10

    .line 145
    const/4 v0, 0x2

    iget v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mTopInnerStrokeColor:I

    invoke-static {v2, v3}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v2

    aput v2, v5, v0

    .line 146
    const/4 v0, 0x3

    iget v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBottomInnerStrokeColor:I

    invoke-static {v2, v3}, Landroid/support/v4/graphics/ColorUtils;->setAlphaComponent(II)I

    move-result v2

    aput v2, v5, v0

    .line 147
    const/4 v0, 0x4

    iget v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBottomInnerStrokeColor:I

    aput v2, v5, v0

    .line 148
    const/4 v0, 0x5

    iget v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBottomOuterStrokeColor:I

    aput v2, v5, v0

    .line 150
    const/4 v0, 0x6

    new-array v6, v0, [F

    .line 151
    .local v6, "positions":[F
    aput v1, v6, v3

    .line 152
    aput v8, v6, v10

    .line 153
    const/4 v0, 0x2

    aput v4, v6, v0

    .line 154
    const/4 v0, 0x3

    aput v4, v6, v0

    .line 155
    const/4 v0, 0x4

    sub-float v2, v7, v8

    aput v2, v6, v0

    .line 156
    const/4 v0, 0x5

    aput v7, v6, v0

    .line 158
    new-instance v0, Landroid/graphics/LinearGradient;

    iget v2, v9, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget v3, v9, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v3

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move v3, v1

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    return-object v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 82
    iget-boolean v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mInvalidateShader:Z

    if-eqz v2, :cond_0

    .line 83
    iget-object v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-direct {p0}, Landroid/support/design/widget/CircularBorderDrawable;->createGradientShader()Landroid/graphics/Shader;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 84
    const/4 v2, 0x0

    iput-boolean v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mInvalidateShader:Z

    .line 87
    :cond_0
    iget-object v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float v0, v2, v3

    .line 88
    .local v0, "halfBorderWidth":F
    iget-object v1, p0, Landroid/support/design/widget/CircularBorderDrawable;->mRectF:Landroid/graphics/RectF;

    .line 92
    .local v1, "rectF":Landroid/graphics/RectF;
    iget-object v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mRect:Landroid/graphics/Rect;

    invoke-virtual {p0, v2}, Landroid/support/design/widget/CircularBorderDrawable;->copyBounds(Landroid/graphics/Rect;)V

    .line 93
    iget-object v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mRect:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    .line 94
    iget v2, v1, Landroid/graphics/RectF;->left:F

    add-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->left:F

    .line 95
    iget v2, v1, Landroid/graphics/RectF;->top:F

    add-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->top:F

    .line 96
    iget v2, v1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->right:F

    .line 97
    iget v2, v1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->bottom:F

    .line 100
    iget-object v2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 101
    return-void
.end method

.method public getOpacity()I
    .locals 2

    .prologue
    .line 124
    iget v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBorderWidth:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, -0x3

    :goto_0
    return v0

    :cond_0
    const/4 v0, -0x2

    goto :goto_0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .locals 2
    .param p1, "padding"    # Landroid/graphics/Rect;

    .prologue
    .line 105
    iget v1, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBorderWidth:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 106
    .local v0, "borderWidth":I
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 107
    const/4 v1, 0x1

    return v1
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .prologue
    .line 129
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mInvalidateShader:Z

    .line 130
    return-void
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .prologue
    .line 112
    iget-object v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 113
    invoke-virtual {p0}, Landroid/support/design/widget/CircularBorderDrawable;->invalidateSelf()V

    .line 114
    return-void
.end method

.method setBorderWidth(F)V
    .locals 2
    .param p1, "width"    # F

    .prologue
    .line 72
    iget v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBorderWidth:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 73
    iput p1, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBorderWidth:F

    .line 74
    iget-object v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mPaint:Landroid/graphics/Paint;

    const v1, 0x3faaa993    # 1.3333f

    mul-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 75
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mInvalidateShader:Z

    .line 76
    invoke-virtual {p0}, Landroid/support/design/widget/CircularBorderDrawable;->invalidateSelf()V

    .line 78
    :cond_0
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "colorFilter"    # Landroid/graphics/ColorFilter;

    .prologue
    .line 118
    iget-object v0, p0, Landroid/support/design/widget/CircularBorderDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 119
    invoke-virtual {p0}, Landroid/support/design/widget/CircularBorderDrawable;->invalidateSelf()V

    .line 120
    return-void
.end method

.method setGradientColors(IIII)V
    .locals 0
    .param p1, "topOuterStrokeColor"    # I
    .param p2, "topInnerStrokeColor"    # I
    .param p3, "bottomOuterStrokeColor"    # I
    .param p4, "bottomInnerStrokeColor"    # I

    .prologue
    .line 62
    iput p1, p0, Landroid/support/design/widget/CircularBorderDrawable;->mTopOuterStrokeColor:I

    .line 63
    iput p2, p0, Landroid/support/design/widget/CircularBorderDrawable;->mTopInnerStrokeColor:I

    .line 64
    iput p3, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBottomOuterStrokeColor:I

    .line 65
    iput p4, p0, Landroid/support/design/widget/CircularBorderDrawable;->mBottomInnerStrokeColor:I

    .line 66
    return-void
.end method
