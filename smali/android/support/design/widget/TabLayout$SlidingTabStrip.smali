.class Landroid/support/design/widget/TabLayout$SlidingTabStrip;
.super Landroid/widget/LinearLayout;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SlidingTabStrip"
.end annotation


# instance fields
.field private mIndicatorLeft:I

.field private mIndicatorRight:I

.field private mSelectedIndicatorHeight:I

.field private final mSelectedIndicatorPaint:Landroid/graphics/Paint;

.field private mSelectedPosition:I

.field private mSelectionOffset:F

.field final synthetic this$0:Landroid/support/design/widget/TabLayout;


# direct methods
.method constructor <init>(Landroid/support/design/widget/TabLayout;Landroid/content/Context;)V
    .locals 1
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, -0x1

    .line 1211
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->this$0:Landroid/support/design/widget/TabLayout;

    .line 1212
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1205
    iput v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedPosition:I

    .line 1208
    iput v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorLeft:I

    .line 1209
    iput v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorRight:I

    .line 1213
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->setWillNotDraw(Z)V

    .line 1214
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    .line 1215
    return-void
.end method

.method static synthetic access$1600(Landroid/support/design/widget/TabLayout$SlidingTabStrip;II)V
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$SlidingTabStrip;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 1201
    invoke-direct {p0, p1, p2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->setIndicatorPosition(II)V

    return-void
.end method

.method static synthetic access$1702(Landroid/support/design/widget/TabLayout$SlidingTabStrip;I)I
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$SlidingTabStrip;
    .param p1, "x1"    # I

    .prologue
    .line 1201
    iput p1, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedPosition:I

    return p1
.end method

.method static synthetic access$1802(Landroid/support/design/widget/TabLayout$SlidingTabStrip;F)F
    .locals 0
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$SlidingTabStrip;
    .param p1, "x1"    # F

    .prologue
    .line 1201
    iput p1, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectionOffset:F

    return p1
.end method

.method private setIndicatorPosition(II)V
    .locals 1
    .param p1, "left"    # I
    .param p2, "right"    # I

    .prologue
    .line 1321
    iget v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorLeft:I

    if-ne p1, v0, :cond_0

    iget v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorRight:I

    if-eq p2, v0, :cond_1

    .line 1323
    :cond_0
    iput p1, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorLeft:I

    .line 1324
    iput p2, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorRight:I

    .line 1325
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 1327
    :cond_1
    return-void
.end method

.method private updateIndicatorPosition()V
    .locals 8

    .prologue
    const/high16 v7, 0x3f800000    # 1.0f

    .line 1298
    iget v4, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedPosition:I

    invoke-virtual {p0, v4}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 1301
    .local v3, "selectedTitle":Landroid/view/View;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v4

    if-lez v4, :cond_1

    .line 1302
    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 1303
    .local v0, "left":I
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v2

    .line 1305
    .local v2, "right":I
    iget v4, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectionOffset:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    if-lez v4, :cond_0

    iget v4, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedPosition:I

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ge v4, v5, :cond_0

    .line 1307
    iget v4, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedPosition:I

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v4}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 1308
    .local v1, "nextTitle":Landroid/view/View;
    iget v4, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectionOffset:F

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    iget v5, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectionOffset:F

    sub-float v5, v7, v5

    int-to-float v6, v0

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-int v0, v4

    .line 1310
    iget v4, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectionOffset:F

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    iget v5, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectionOffset:F

    sub-float v5, v7, v5

    int-to-float v6, v2

    mul-float/2addr v5, v6

    add-float/2addr v4, v5

    float-to-int v2, v4

    .line 1317
    .end local v1    # "nextTitle":Landroid/view/View;
    :cond_0
    :goto_0
    invoke-direct {p0, v0, v2}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->setIndicatorPosition(II)V

    .line 1318
    return-void

    .line 1314
    .end local v0    # "left":I
    .end local v2    # "right":I
    :cond_1
    const/4 v2, -0x1

    .restart local v2    # "right":I
    move v0, v2

    .restart local v0    # "left":I
    goto :goto_0
.end method


# virtual methods
.method animateIndicatorToPosition(II)V
    .locals 10
    .param p1, "position"    # I
    .param p2, "duration"    # I

    .prologue
    const/4 v0, 0x1

    .line 1330
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v1

    if-ne v1, v0, :cond_2

    move v7, v0

    .line 1333
    .local v7, "isRtl":Z
    :goto_0
    invoke-virtual {p0, p1}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    .line 1334
    .local v9, "targetView":Landroid/view/View;
    invoke-virtual {v9}, Landroid/view/View;->getLeft()I

    move-result v3

    .line 1335
    .local v3, "targetLeft":I
    invoke-virtual {v9}, Landroid/view/View;->getRight()I

    move-result v5

    .line 1339
    .local v5, "targetRight":I
    iget v1, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedPosition:I

    sub-int v1, p1, v1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-gt v1, v0, :cond_3

    .line 1341
    iget v2, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorLeft:I

    .line 1342
    .local v2, "startLeft":I
    iget v4, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorRight:I

    .line 1363
    .local v4, "startRight":I
    :goto_1
    if-ne v2, v3, :cond_0

    if-eq v4, v5, :cond_1

    .line 1364
    :cond_0
    invoke-static {}, Landroid/support/design/widget/ViewUtils;->createAnimator()Landroid/support/design/widget/ValueAnimatorCompat;

    move-result-object v6

    .line 1365
    .local v6, "animator":Landroid/support/design/widget/ValueAnimatorCompat;
    sget-object v0, Landroid/support/design/widget/AnimationUtils;->FAST_OUT_SLOW_IN_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {v6, v0}, Landroid/support/design/widget/ValueAnimatorCompat;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 1366
    invoke-virtual {v6, p2}, Landroid/support/design/widget/ValueAnimatorCompat;->setDuration(I)V

    .line 1367
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v6, v0, v1}, Landroid/support/design/widget/ValueAnimatorCompat;->setFloatValues(FF)V

    .line 1368
    new-instance v0, Landroid/support/design/widget/TabLayout$SlidingTabStrip$1;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/support/design/widget/TabLayout$SlidingTabStrip$1;-><init>(Landroid/support/design/widget/TabLayout$SlidingTabStrip;IIII)V

    invoke-virtual {v6, v0}, Landroid/support/design/widget/ValueAnimatorCompat;->setUpdateListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener;)V

    .line 1377
    new-instance v0, Landroid/support/design/widget/TabLayout$SlidingTabStrip$2;

    invoke-direct {v0, p0, p1}, Landroid/support/design/widget/TabLayout$SlidingTabStrip$2;-><init>(Landroid/support/design/widget/TabLayout$SlidingTabStrip;I)V

    invoke-virtual {v6, v0}, Landroid/support/design/widget/ValueAnimatorCompat;->setListener(Landroid/support/design/widget/ValueAnimatorCompat$AnimatorListener;)V

    .line 1390
    invoke-virtual {v6}, Landroid/support/design/widget/ValueAnimatorCompat;->start()V

    .line 1392
    .end local v6    # "animator":Landroid/support/design/widget/ValueAnimatorCompat;
    :cond_1
    return-void

    .line 1330
    .end local v2    # "startLeft":I
    .end local v3    # "targetLeft":I
    .end local v4    # "startRight":I
    .end local v5    # "targetRight":I
    .end local v7    # "isRtl":Z
    .end local v9    # "targetView":Landroid/view/View;
    :cond_2
    const/4 v7, 0x0

    goto :goto_0

    .line 1345
    .restart local v3    # "targetLeft":I
    .restart local v5    # "targetRight":I
    .restart local v7    # "isRtl":Z
    .restart local v9    # "targetView":Landroid/view/View;
    :cond_3
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->this$0:Landroid/support/design/widget/TabLayout;

    const/16 v1, 0x18

    invoke-static {v0, v1}, Landroid/support/design/widget/TabLayout;->access$1400(Landroid/support/design/widget/TabLayout;I)I

    move-result v8

    .line 1346
    .local v8, "offset":I
    iget v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedPosition:I

    if-ge p1, v0, :cond_5

    .line 1348
    if-eqz v7, :cond_4

    .line 1349
    sub-int v4, v3, v8

    .restart local v4    # "startRight":I
    move v2, v4

    .restart local v2    # "startLeft":I
    goto :goto_1

    .line 1351
    .end local v2    # "startLeft":I
    .end local v4    # "startRight":I
    :cond_4
    add-int v4, v5, v8

    .restart local v4    # "startRight":I
    move v2, v4

    .restart local v2    # "startLeft":I
    goto :goto_1

    .line 1355
    .end local v2    # "startLeft":I
    .end local v4    # "startRight":I
    :cond_5
    if-eqz v7, :cond_6

    .line 1356
    add-int v4, v5, v8

    .restart local v4    # "startRight":I
    move v2, v4

    .restart local v2    # "startLeft":I
    goto :goto_1

    .line 1358
    .end local v2    # "startLeft":I
    .end local v4    # "startRight":I
    :cond_6
    sub-int v4, v3, v8

    .restart local v4    # "startRight":I
    move v2, v4

    .restart local v2    # "startLeft":I
    goto :goto_1
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    .line 1397
    iget v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorLeft:I

    if-ltz v0, :cond_0

    iget v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorRight:I

    iget v1, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorLeft:I

    if-le v0, v1, :cond_0

    .line 1398
    iget v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorLeft:I

    int-to-float v1, v0

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getHeight()I

    move-result v0

    iget v2, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedIndicatorHeight:I

    sub-int/2addr v0, v2

    int-to-float v2, v0

    iget v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mIndicatorRight:I

    int-to-float v3, v0

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getHeight()I

    move-result v0

    int-to-float v4, v0

    iget-object v5, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 1401
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 1
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 1288
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    .line 1290
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    invoke-static {v0}, Landroid/support/design/widget/TabLayout;->access$1100(Landroid/view/animation/Animation;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1293
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->updateIndicatorPosition()V

    .line 1295
    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 12
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 1238
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 1240
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v8

    const/high16 v9, 0x40000000    # 2.0f

    if-eq v8, v9, :cond_1

    .line 1284
    :cond_0
    :goto_0
    return-void

    .line 1246
    :cond_1
    iget-object v8, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v8}, Landroid/support/design/widget/TabLayout;->access$1200(Landroid/support/design/widget/TabLayout;)I

    move-result v8

    if-ne v8, v10, :cond_0

    iget-object v8, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v8}, Landroid/support/design/widget/TabLayout;->access$1300(Landroid/support/design/widget/TabLayout;)I

    move-result v8

    if-ne v8, v10, :cond_0

    .line 1247
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildCount()I

    move-result v1

    .line 1249
    .local v1, "count":I
    invoke-static {v11, v11}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 1252
    .local v6, "unspecifiedSpec":I
    const/4 v4, 0x0

    .line 1253
    .local v4, "largestTabWidth":I
    const/4 v3, 0x0

    .local v3, "i":I
    move v7, v1

    .local v7, "z":I
    :goto_1
    if-ge v3, v7, :cond_2

    .line 1254
    invoke-virtual {p0, v3}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1255
    .local v0, "child":Landroid/view/View;
    invoke-virtual {v0, v6, p2}, Landroid/view/View;->measure(II)V

    .line 1256
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-static {v4, v8}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 1253
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1259
    .end local v0    # "child":Landroid/view/View;
    :cond_2
    if-lez v4, :cond_0

    .line 1264
    iget-object v8, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->this$0:Landroid/support/design/widget/TabLayout;

    const/16 v9, 0x10

    invoke-static {v8, v9}, Landroid/support/design/widget/TabLayout;->access$1400(Landroid/support/design/widget/TabLayout;I)I

    move-result v2

    .line 1265
    .local v2, "gutter":I
    mul-int v8, v4, v1

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getMeasuredWidth()I

    move-result v9

    mul-int/lit8 v10, v2, 0x2

    sub-int/2addr v9, v10

    if-gt v8, v9, :cond_3

    .line 1268
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_4

    .line 1269
    invoke-virtual {p0, v3}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 1270
    .restart local v0    # "child":Landroid/view/View;
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    .line 1271
    .local v5, "lp":Landroid/widget/LinearLayout$LayoutParams;
    iput v4, v5, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 1272
    const/4 v8, 0x0

    iput v8, v5, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 1268
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1277
    .end local v0    # "child":Landroid/view/View;
    .end local v5    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_3
    iget-object v8, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v8, v11}, Landroid/support/design/widget/TabLayout;->access$1302(Landroid/support/design/widget/TabLayout;I)I

    .line 1278
    iget-object v8, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v8}, Landroid/support/design/widget/TabLayout;->access$1500(Landroid/support/design/widget/TabLayout;)V

    .line 1282
    :cond_4
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    goto :goto_0
.end method

.method setIndicatorPositionFromTabPosition(IF)V
    .locals 1
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F

    .prologue
    .line 1228
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    invoke-static {v0}, Landroid/support/design/widget/TabLayout;->access$1100(Landroid/view/animation/Animation;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1234
    :goto_0
    return-void

    .line 1231
    :cond_0
    iput p1, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedPosition:I

    .line 1232
    iput p2, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectionOffset:F

    .line 1233
    invoke-direct {p0}, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->updateIndicatorPosition()V

    goto :goto_0
.end method

.method setSelectedIndicatorColor(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 1218
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 1219
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 1220
    return-void
.end method

.method setSelectedIndicatorHeight(I)V
    .locals 0
    .param p1, "height"    # I

    .prologue
    .line 1223
    iput p1, p0, Landroid/support/design/widget/TabLayout$SlidingTabStrip;->mSelectedIndicatorHeight:I

    .line 1224
    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 1225
    return-void
.end method
