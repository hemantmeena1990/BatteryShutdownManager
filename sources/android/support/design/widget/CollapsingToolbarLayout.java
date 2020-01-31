package android.support.design.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.design.R;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.ValueAnimatorCompat;
import android.support.v4.content.ContextCompat;
import android.support.v4.view.OnApplyWindowInsetsListener;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.WindowInsetsCompat;
import android.support.v7.widget.Toolbar;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.FrameLayout;

public class CollapsingToolbarLayout extends FrameLayout {
    private static final int SCRIM_ANIMATION_DURATION = 600;
    /* access modifiers changed from: private */
    public final CollapsingTextHelper mCollapsingTextHelper;
    /* access modifiers changed from: private */
    public Drawable mContentScrim;
    /* access modifiers changed from: private */
    public int mCurrentOffset;
    private View mDummyView;
    private int mExpandedMarginBottom;
    private int mExpandedMarginLeft;
    private int mExpandedMarginRight;
    private int mExpandedMarginTop;
    /* access modifiers changed from: private */
    public WindowInsetsCompat mLastInsets;
    private AppBarLayout.OnOffsetChangedListener mOnOffsetChangedListener;
    private boolean mRefreshToolbar;
    /* access modifiers changed from: private */
    public int mScrimAlpha;
    private ValueAnimatorCompat mScrimAnimator;
    private boolean mScrimsAreShown;
    /* access modifiers changed from: private */
    public Drawable mStatusBarScrim;
    private final Rect mTmpRect;
    /* access modifiers changed from: private */
    public Toolbar mToolbar;
    private int mToolbarId;

    public CollapsingToolbarLayout(Context context) {
        this(context, (AttributeSet) null);
    }

    public CollapsingToolbarLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    /* JADX INFO: super call moved to the top of the method (can break code semantics) */
    public CollapsingToolbarLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        boolean isRtl = true;
        this.mRefreshToolbar = true;
        this.mTmpRect = new Rect();
        this.mCollapsingTextHelper = new CollapsingTextHelper(this);
        this.mCollapsingTextHelper.setExpandedTextVerticalGravity(80);
        this.mCollapsingTextHelper.setTextSizeInterpolator(AnimationUtils.DECELERATE_INTERPOLATOR);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.CollapsingToolbarLayout, defStyleAttr, R.style.Widget_Design_CollapsingToolbar);
        int dimensionPixelSize = a.getDimensionPixelSize(R.styleable.CollapsingToolbarLayout_expandedTitleMargin, 0);
        this.mExpandedMarginBottom = dimensionPixelSize;
        this.mExpandedMarginRight = dimensionPixelSize;
        this.mExpandedMarginTop = dimensionPixelSize;
        this.mExpandedMarginLeft = dimensionPixelSize;
        isRtl = ViewCompat.getLayoutDirection(this) != 1 ? false : isRtl;
        if (a.hasValue(R.styleable.CollapsingToolbarLayout_expandedTitleMarginStart)) {
            int marginStart = a.getDimensionPixelSize(R.styleable.CollapsingToolbarLayout_expandedTitleMarginStart, 0);
            if (isRtl) {
                this.mExpandedMarginRight = marginStart;
            } else {
                this.mExpandedMarginLeft = marginStart;
            }
        }
        if (a.hasValue(R.styleable.CollapsingToolbarLayout_expandedTitleMarginEnd)) {
            int marginEnd = a.getDimensionPixelSize(R.styleable.CollapsingToolbarLayout_expandedTitleMarginEnd, 0);
            if (isRtl) {
                this.mExpandedMarginLeft = marginEnd;
            } else {
                this.mExpandedMarginRight = marginEnd;
            }
        }
        if (a.hasValue(R.styleable.CollapsingToolbarLayout_expandedTitleMarginTop)) {
            this.mExpandedMarginTop = a.getDimensionPixelSize(R.styleable.CollapsingToolbarLayout_expandedTitleMarginTop, 0);
        }
        if (a.hasValue(R.styleable.CollapsingToolbarLayout_expandedTitleMarginBottom)) {
            this.mExpandedMarginBottom = a.getDimensionPixelSize(R.styleable.CollapsingToolbarLayout_expandedTitleMarginBottom, 0);
        }
        this.mCollapsingTextHelper.setExpandedTextAppearance(a.getResourceId(R.styleable.CollapsingToolbarLayout_expandedTitleTextAppearance, R.style.TextAppearance_AppCompat_Title));
        this.mCollapsingTextHelper.setCollapsedTextAppearance(a.getResourceId(R.styleable.CollapsingToolbarLayout_collapsedTitleTextAppearance, R.style.TextAppearance_AppCompat_Widget_ActionBar_Title));
        setContentScrim(a.getDrawable(R.styleable.CollapsingToolbarLayout_contentScrim));
        setStatusBarScrim(a.getDrawable(R.styleable.CollapsingToolbarLayout_statusBarScrim));
        this.mToolbarId = a.getResourceId(R.styleable.CollapsingToolbarLayout_toolbarId, -1);
        a.recycle();
        setWillNotDraw(false);
        ViewCompat.setOnApplyWindowInsetsListener(this, new OnApplyWindowInsetsListener() {
            public WindowInsetsCompat onApplyWindowInsets(View v, WindowInsetsCompat insets) {
                WindowInsetsCompat unused = CollapsingToolbarLayout.this.mLastInsets = insets;
                CollapsingToolbarLayout.this.requestLayout();
                return insets.consumeSystemWindowInsets();
            }
        });
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        ViewParent parent = getParent();
        if (parent instanceof AppBarLayout) {
            if (this.mOnOffsetChangedListener == null) {
                this.mOnOffsetChangedListener = new OffsetUpdateListener();
            }
            ((AppBarLayout) parent).addOnOffsetChangedListener(this.mOnOffsetChangedListener);
        }
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        ViewParent parent = getParent();
        if (this.mOnOffsetChangedListener != null && (parent instanceof AppBarLayout)) {
            ((AppBarLayout) parent).removeOnOffsetChangedListener(this.mOnOffsetChangedListener);
        }
        super.onDetachedFromWindow();
    }

    public void draw(Canvas canvas) {
        super.draw(canvas);
        ensureToolbar();
        if (this.mToolbar == null && this.mContentScrim != null && this.mScrimAlpha > 0) {
            this.mContentScrim.mutate().setAlpha(this.mScrimAlpha);
            this.mContentScrim.draw(canvas);
        }
        this.mCollapsingTextHelper.draw(canvas);
        if (this.mStatusBarScrim != null && this.mScrimAlpha > 0) {
            int topInset = this.mLastInsets != null ? this.mLastInsets.getSystemWindowInsetTop() : 0;
            if (topInset > 0) {
                this.mStatusBarScrim.setBounds(0, -this.mCurrentOffset, getWidth(), topInset - this.mCurrentOffset);
                this.mStatusBarScrim.mutate().setAlpha(this.mScrimAlpha);
                this.mStatusBarScrim.draw(canvas);
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean drawChild(Canvas canvas, View child, long drawingTime) {
        ensureToolbar();
        if (child == this.mToolbar && this.mContentScrim != null && this.mScrimAlpha > 0) {
            this.mContentScrim.mutate().setAlpha(this.mScrimAlpha);
            this.mContentScrim.draw(canvas);
        }
        return super.drawChild(canvas, child, drawingTime);
    }

    /* access modifiers changed from: protected */
    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (this.mContentScrim != null) {
            this.mContentScrim.setBounds(0, 0, w, h);
        }
    }

    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v0, resolved type: android.view.View} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r4v4, resolved type: android.support.v7.widget.Toolbar} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r4v6, resolved type: android.support.v7.widget.Toolbar} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r2v3, resolved type: android.support.v7.widget.Toolbar} */
    /* JADX WARNING: Multi-variable type inference failed */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void ensureToolbar() {
        /*
            r9 = this;
            r8 = 0
            r7 = -1
            boolean r5 = r9.mRefreshToolbar
            if (r5 != 0) goto L_0x0007
        L_0x0006:
            return
        L_0x0007:
            r2 = 0
            r4 = 0
            r3 = 0
            int r1 = r9.getChildCount()
        L_0x000e:
            if (r3 >= r1) goto L_0x0027
            android.view.View r0 = r9.getChildAt(r3)
            boolean r5 = r0 instanceof android.support.v7.widget.Toolbar
            if (r5 == 0) goto L_0x0049
            int r5 = r9.mToolbarId
            if (r5 == r7) goto L_0x004c
            int r5 = r9.mToolbarId
            int r6 = r0.getId()
            if (r5 != r6) goto L_0x0044
            r4 = r0
            android.support.v7.widget.Toolbar r4 = (android.support.v7.widget.Toolbar) r4
        L_0x0027:
            if (r4 != 0) goto L_0x002a
            r4 = r2
        L_0x002a:
            if (r4 == 0) goto L_0x0050
            r9.mToolbar = r4
            android.view.View r5 = new android.view.View
            android.content.Context r6 = r9.getContext()
            r5.<init>(r6)
            r9.mDummyView = r5
            android.support.v7.widget.Toolbar r5 = r9.mToolbar
            android.view.View r6 = r9.mDummyView
            r5.addView(r6, r7, r7)
        L_0x0040:
            r5 = 0
            r9.mRefreshToolbar = r5
            goto L_0x0006
        L_0x0044:
            if (r2 != 0) goto L_0x0049
            r2 = r0
            android.support.v7.widget.Toolbar r2 = (android.support.v7.widget.Toolbar) r2
        L_0x0049:
            int r3 = r3 + 1
            goto L_0x000e
        L_0x004c:
            r4 = r0
            android.support.v7.widget.Toolbar r4 = (android.support.v7.widget.Toolbar) r4
            goto L_0x0027
        L_0x0050:
            r9.mToolbar = r8
            r9.mDummyView = r8
            goto L_0x0040
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.design.widget.CollapsingToolbarLayout.ensureToolbar():void");
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int insetTop;
        super.onLayout(changed, left, top, right, bottom);
        int z = getChildCount();
        for (int i = 0; i < z; i++) {
            View child = getChildAt(i);
            if (this.mLastInsets != null && !ViewCompat.getFitsSystemWindows(child) && child.getTop() < (insetTop = this.mLastInsets.getSystemWindowInsetTop())) {
                child.offsetTopAndBottom(insetTop);
            }
            getViewOffsetHelper(child).onViewLayout();
        }
        this.mCollapsingTextHelper.onLayout(changed, left, top, right, bottom);
        ensureToolbar();
        if (this.mDummyView != null) {
            ViewGroupUtils.getDescendantRect(this, this.mDummyView, this.mTmpRect);
            this.mCollapsingTextHelper.setCollapsedBounds(this.mTmpRect.left, bottom - this.mTmpRect.height(), this.mTmpRect.right, bottom);
            this.mCollapsingTextHelper.setExpandedBounds(this.mExpandedMarginLeft + left, this.mTmpRect.bottom + this.mExpandedMarginTop, right - this.mExpandedMarginRight, bottom - this.mExpandedMarginBottom);
        }
        if (this.mToolbar != null) {
            setMinimumHeight(this.mToolbar.getHeight());
        }
    }

    /* access modifiers changed from: private */
    public static ViewOffsetHelper getViewOffsetHelper(View view) {
        ViewOffsetHelper offsetHelper = (ViewOffsetHelper) view.getTag(R.id.view_offset_helper);
        if (offsetHelper != null) {
            return offsetHelper;
        }
        ViewOffsetHelper offsetHelper2 = new ViewOffsetHelper(view);
        view.setTag(R.id.view_offset_helper, offsetHelper2);
        return offsetHelper2;
    }

    public void setTitle(CharSequence title) {
        this.mCollapsingTextHelper.setText(title);
    }

    /* access modifiers changed from: private */
    public void showScrim() {
        if (!this.mScrimsAreShown) {
            animateScrim(255);
            this.mScrimsAreShown = true;
        }
    }

    /* access modifiers changed from: private */
    public void hideScrim() {
        if (this.mScrimsAreShown) {
            animateScrim(0);
            this.mScrimsAreShown = false;
        }
    }

    private void animateScrim(int targetAlpha) {
        ensureToolbar();
        if (this.mScrimAnimator == null) {
            this.mScrimAnimator = ViewUtils.createAnimator();
            this.mScrimAnimator.setDuration(SCRIM_ANIMATION_DURATION);
            this.mScrimAnimator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
            this.mScrimAnimator.setUpdateListener(new ValueAnimatorCompat.AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimatorCompat animator) {
                    int newAlpha = animator.getAnimatedIntValue();
                    if (newAlpha != CollapsingToolbarLayout.this.mScrimAlpha) {
                        if (!(CollapsingToolbarLayout.this.mContentScrim == null || CollapsingToolbarLayout.this.mToolbar == null)) {
                            ViewCompat.postInvalidateOnAnimation(CollapsingToolbarLayout.this.mToolbar);
                        }
                        int unused = CollapsingToolbarLayout.this.mScrimAlpha = newAlpha;
                        ViewCompat.postInvalidateOnAnimation(CollapsingToolbarLayout.this);
                    }
                }
            });
        } else if (this.mScrimAnimator.isRunning()) {
            this.mScrimAnimator.cancel();
        }
        this.mScrimAnimator.setIntValues(this.mScrimAlpha, targetAlpha);
        this.mScrimAnimator.start();
    }

    public void setContentScrim(@Nullable Drawable drawable) {
        if (this.mContentScrim != drawable) {
            if (this.mContentScrim != null) {
                this.mContentScrim.setCallback((Drawable.Callback) null);
            }
            this.mContentScrim = drawable;
            drawable.setBounds(0, 0, getWidth(), getHeight());
            drawable.setCallback(this);
            drawable.mutate().setAlpha(this.mScrimAlpha);
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    public void setContentScrimColor(int color) {
        setContentScrim(new ColorDrawable(color));
    }

    public void setContentScrimResource(@DrawableRes int resId) {
        setContentScrim(ContextCompat.getDrawable(getContext(), resId));
    }

    public Drawable getContentScrim() {
        return this.mContentScrim;
    }

    public void setStatusBarScrim(@Nullable Drawable drawable) {
        if (this.mStatusBarScrim != drawable) {
            if (this.mStatusBarScrim != null) {
                this.mStatusBarScrim.setCallback((Drawable.Callback) null);
            }
            this.mStatusBarScrim = drawable;
            drawable.setCallback(this);
            drawable.mutate().setAlpha(this.mScrimAlpha);
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    public void setStatusBarScrimColor(int color) {
        setStatusBarScrim(new ColorDrawable(color));
    }

    public void setStatusBarScrimResource(@DrawableRes int resId) {
        setStatusBarScrim(ContextCompat.getDrawable(getContext(), resId));
    }

    public Drawable getStatusBarScrim() {
        return this.mStatusBarScrim;
    }

    public void setCollapsedTitleTextAppearance(int resId) {
        this.mCollapsingTextHelper.setCollapsedTextAppearance(resId);
    }

    public void setCollapsedTitleTextColor(int color) {
        this.mCollapsingTextHelper.setCollapsedTextColor(color);
    }

    public void setExpandedTitleTextAppearance(int resId) {
        this.mCollapsingTextHelper.setExpandedTextAppearance(resId);
    }

    public void setExpandedTitleColor(int color) {
        this.mCollapsingTextHelper.setExpandedTextColor(color);
    }

    /* access modifiers changed from: package-private */
    public final int getScrimTriggerOffset() {
        return ViewCompat.getMinimumHeight(this) * 2;
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    /* access modifiers changed from: protected */
    public LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(super.generateDefaultLayoutParams());
    }

    public FrameLayout.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    /* access modifiers changed from: protected */
    public FrameLayout.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(p);
    }

    public static class LayoutParams extends FrameLayout.LayoutParams {
        public static final int COLLAPSE_MODE_OFF = 0;
        public static final int COLLAPSE_MODE_PARALLAX = 2;
        public static final int COLLAPSE_MODE_PIN = 1;
        private static final float DEFAULT_PARALLAX_MULTIPLIER = 0.5f;
        int mCollapseMode = 0;
        float mParallaxMult = DEFAULT_PARALLAX_MULTIPLIER;

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            TypedArray a = c.obtainStyledAttributes(attrs, R.styleable.CollapsingAppBarLayout_LayoutParams);
            this.mCollapseMode = a.getInt(R.styleable.CollapsingAppBarLayout_LayoutParams_layout_collapseMode, 0);
            setParallaxMultiplier(a.getFloat(R.styleable.CollapsingAppBarLayout_LayoutParams_layout_collapseParallaxMultiplier, DEFAULT_PARALLAX_MULTIPLIER));
            a.recycle();
        }

        public LayoutParams(int width, int height) {
            super(width, height);
        }

        public LayoutParams(int width, int height, int gravity) {
            super(width, height, gravity);
        }

        public LayoutParams(ViewGroup.LayoutParams p) {
            super(p);
        }

        public LayoutParams(ViewGroup.MarginLayoutParams source) {
            super(source);
        }

        public LayoutParams(FrameLayout.LayoutParams source) {
            super(source);
        }

        public void setCollapseMode(int collapseMode) {
            this.mCollapseMode = collapseMode;
        }

        public int getCollapseMode() {
            return this.mCollapseMode;
        }

        public void setParallaxMultiplier(float multiplier) {
            this.mParallaxMult = multiplier;
        }

        public float getParallaxMultiplier() {
            return this.mParallaxMult;
        }
    }

    private class OffsetUpdateListener implements AppBarLayout.OnOffsetChangedListener {
        private OffsetUpdateListener() {
        }

        public void onOffsetChanged(AppBarLayout layout, int verticalOffset) {
            int unused = CollapsingToolbarLayout.this.mCurrentOffset = verticalOffset;
            int insetTop = CollapsingToolbarLayout.this.mLastInsets != null ? CollapsingToolbarLayout.this.mLastInsets.getSystemWindowInsetTop() : 0;
            int scrollRange = layout.getTotalScrollRange();
            int z = CollapsingToolbarLayout.this.getChildCount();
            for (int i = 0; i < z; i++) {
                View child = CollapsingToolbarLayout.this.getChildAt(i);
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                ViewOffsetHelper offsetHelper = CollapsingToolbarLayout.getViewOffsetHelper(child);
                switch (lp.mCollapseMode) {
                    case 1:
                        if ((CollapsingToolbarLayout.this.getHeight() - insetTop) + verticalOffset < child.getHeight()) {
                            break;
                        } else {
                            offsetHelper.setTopAndBottomOffset(-verticalOffset);
                            break;
                        }
                    case 2:
                        offsetHelper.setTopAndBottomOffset(Math.round(((float) (-verticalOffset)) * lp.mParallaxMult));
                        break;
                }
            }
            if (!(CollapsingToolbarLayout.this.mContentScrim == null && CollapsingToolbarLayout.this.mStatusBarScrim == null)) {
                if (CollapsingToolbarLayout.this.getHeight() + verticalOffset < CollapsingToolbarLayout.this.getScrimTriggerOffset() + insetTop) {
                    CollapsingToolbarLayout.this.showScrim();
                } else {
                    CollapsingToolbarLayout.this.hideScrim();
                }
            }
            if (CollapsingToolbarLayout.this.mStatusBarScrim != null && insetTop > 0) {
                ViewCompat.postInvalidateOnAnimation(CollapsingToolbarLayout.this);
            }
            CollapsingToolbarLayout.this.mCollapsingTextHelper.setExpansionFraction(((float) Math.abs(verticalOffset)) / ((float) ((CollapsingToolbarLayout.this.getHeight() - ViewCompat.getMinimumHeight(CollapsingToolbarLayout.this)) - insetTop)));
            if (Math.abs(verticalOffset) == scrollRange) {
                ViewCompat.setElevation(layout, layout.getTargetElevation());
            } else {
                ViewCompat.setElevation(layout, 0.0f);
            }
        }
    }
}
