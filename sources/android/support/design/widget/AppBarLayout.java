package android.support.design.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.design.R;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.ValueAnimatorCompat;
import android.support.v4.view.OnApplyWindowInsetsListener;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.WindowInsetsCompat;
import android.support.v4.widget.ScrollerCompat;
import android.support.v7.widget.ActivityChooserView;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import android.widget.LinearLayout;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@CoordinatorLayout.DefaultBehavior(Behavior.class)
public class AppBarLayout extends LinearLayout {
    private static final int INVALID_SCROLL_RANGE = -1;
    private int mDownPreScrollRange;
    private int mDownScrollRange;
    boolean mHaveChildWithInterpolator;
    private WindowInsetsCompat mLastInsets;
    /* access modifiers changed from: private */
    public final List<WeakReference<OnOffsetChangedListener>> mListeners;
    private float mTargetElevation;
    private int mTotalScrollRange;

    public interface OnOffsetChangedListener {
        void onOffsetChanged(AppBarLayout appBarLayout, int i);
    }

    public AppBarLayout(Context context) {
        this(context, (AttributeSet) null);
    }

    public AppBarLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTotalScrollRange = -1;
        this.mDownPreScrollRange = -1;
        this.mDownScrollRange = -1;
        setOrientation(1);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.AppBarLayout, 0, R.style.Widget_Design_AppBarLayout);
        this.mTargetElevation = (float) a.getDimensionPixelSize(R.styleable.AppBarLayout_elevation, 0);
        setBackgroundDrawable(a.getDrawable(R.styleable.AppBarLayout_android_background));
        a.recycle();
        ViewUtils.setBoundsViewOutlineProvider(this);
        this.mListeners = new ArrayList();
        ViewCompat.setElevation(this, this.mTargetElevation);
        ViewCompat.setOnApplyWindowInsetsListener(this, new OnApplyWindowInsetsListener() {
            public WindowInsetsCompat onApplyWindowInsets(View v, WindowInsetsCompat insets) {
                AppBarLayout.this.setWindowInsets(insets);
                return insets.consumeSystemWindowInsets();
            }
        });
    }

    public void addOnOffsetChangedListener(OnOffsetChangedListener listener) {
        int i = 0;
        int z = this.mListeners.size();
        while (i < z) {
            WeakReference<OnOffsetChangedListener> ref = this.mListeners.get(i);
            if (ref == null || ref.get() != listener) {
                i++;
            } else {
                return;
            }
        }
        this.mListeners.add(new WeakReference(listener));
    }

    public void removeOnOffsetChangedListener(OnOffsetChangedListener listener) {
        Iterator<WeakReference<OnOffsetChangedListener>> i = this.mListeners.iterator();
        while (i.hasNext()) {
            OnOffsetChangedListener item = (OnOffsetChangedListener) i.next().get();
            if (item == listener || item == null) {
                i.remove();
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        this.mTotalScrollRange = -1;
        this.mDownPreScrollRange = -1;
        this.mDownPreScrollRange = -1;
        this.mHaveChildWithInterpolator = false;
        int z = getChildCount();
        for (int i = 0; i < z; i++) {
            if (((LayoutParams) getChildAt(i).getLayoutParams()).getScrollInterpolator() != null) {
                this.mHaveChildWithInterpolator = true;
                return;
            }
        }
    }

    public void setOrientation(int orientation) {
        if (orientation != 1) {
            throw new IllegalArgumentException("AppBarLayout is always vertical and does not support horizontal orientation");
        }
        super.setOrientation(orientation);
    }

    /* access modifiers changed from: protected */
    public boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    /* access modifiers changed from: protected */
    public LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-1, -2);
    }

    public LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    /* access modifiers changed from: protected */
    public LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        if (p instanceof LinearLayout.LayoutParams) {
            return new LayoutParams((LinearLayout.LayoutParams) p);
        }
        if (p instanceof ViewGroup.MarginLayoutParams) {
            return new LayoutParams((ViewGroup.MarginLayoutParams) p);
        }
        return new LayoutParams(p);
    }

    /* access modifiers changed from: package-private */
    public final boolean hasChildWithInterpolator() {
        return this.mHaveChildWithInterpolator;
    }

    public final int getTotalScrollRange() {
        if (this.mTotalScrollRange != -1) {
            return this.mTotalScrollRange;
        }
        int range = 0;
        int i = 0;
        int z = getChildCount();
        while (true) {
            if (i >= z) {
                break;
            }
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            int childHeight = ViewCompat.isLaidOut(child) ? child.getHeight() : child.getMeasuredHeight();
            int flags = lp.mScrollFlags;
            if ((flags & 1) == 0) {
                break;
            }
            range += childHeight;
            if ((flags & 2) != 0) {
                range -= ViewCompat.getMinimumHeight(child);
                break;
            }
            i++;
        }
        int systemWindowInsetTop = range - (this.mLastInsets != null ? this.mLastInsets.getSystemWindowInsetTop() : 0);
        this.mTotalScrollRange = systemWindowInsetTop;
        return systemWindowInsetTop;
    }

    /* access modifiers changed from: package-private */
    public final boolean hasScrollableChildren() {
        return getTotalScrollRange() != 0;
    }

    /* access modifiers changed from: package-private */
    public final int getUpNestedPreScrollRange() {
        return getTotalScrollRange();
    }

    /* access modifiers changed from: package-private */
    public final int getDownNestedPreScrollRange() {
        if (this.mDownPreScrollRange != -1) {
            return this.mDownPreScrollRange;
        }
        int range = 0;
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            int childHeight = ViewCompat.isLaidOut(child) ? child.getHeight() : child.getMeasuredHeight();
            int flags = lp.mScrollFlags;
            if ((flags & 5) == 5) {
                if ((flags & 8) != 0) {
                    range += ViewCompat.getMinimumHeight(child);
                } else {
                    range += childHeight;
                }
            } else if (range > 0) {
                break;
            }
        }
        this.mDownPreScrollRange = range;
        return range;
    }

    /* access modifiers changed from: package-private */
    public final int getDownNestedScrollRange() {
        if (this.mDownScrollRange != -1) {
            return this.mDownScrollRange;
        }
        int range = 0;
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            int childHeight = ViewCompat.isLaidOut(child) ? child.getHeight() : child.getMeasuredHeight();
            int flags = lp.mScrollFlags;
            if ((flags & 1) == 0) {
                break;
            }
            range += childHeight;
            if ((flags & 2) != 0) {
                return range - ViewCompat.getMinimumHeight(child);
            }
        }
        this.mDownScrollRange = range;
        return range;
    }

    /* access modifiers changed from: package-private */
    public final int getMinimumHeightForVisibleOverlappingContent() {
        int topInset;
        if (this.mLastInsets != null) {
            topInset = this.mLastInsets.getSystemWindowInsetTop();
        } else {
            topInset = 0;
        }
        int minHeight = ViewCompat.getMinimumHeight(this);
        if (minHeight != 0) {
            return (minHeight * 2) + topInset;
        }
        int childCount = getChildCount();
        if (childCount >= 1) {
            return (ViewCompat.getMinimumHeight(getChildAt(childCount - 1)) * 2) + topInset;
        }
        return 0;
    }

    public void setTargetElevation(float elevation) {
        this.mTargetElevation = elevation;
    }

    public float getTargetElevation() {
        return this.mTargetElevation;
    }

    /* access modifiers changed from: private */
    public void setWindowInsets(WindowInsetsCompat insets) {
        this.mTotalScrollRange = -1;
        this.mLastInsets = insets;
        int i = 0;
        int z = getChildCount();
        while (i < z) {
            insets = ViewCompat.dispatchApplyWindowInsets(getChildAt(i), insets);
            if (!insets.isConsumed()) {
                i++;
            } else {
                return;
            }
        }
    }

    public static class LayoutParams extends LinearLayout.LayoutParams {
        static final int FLAG_QUICK_RETURN = 5;
        public static final int SCROLL_FLAG_ENTER_ALWAYS = 4;
        public static final int SCROLL_FLAG_ENTER_ALWAYS_COLLAPSED = 8;
        public static final int SCROLL_FLAG_EXIT_UNTIL_COLLAPSED = 2;
        public static final int SCROLL_FLAG_SCROLL = 1;
        int mScrollFlags = 1;
        Interpolator mScrollInterpolator;

        @Retention(RetentionPolicy.SOURCE)
        public @interface ScrollFlags {
        }

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            TypedArray a = c.obtainStyledAttributes(attrs, R.styleable.AppBarLayout_LayoutParams);
            this.mScrollFlags = a.getInt(R.styleable.AppBarLayout_LayoutParams_layout_scrollFlags, 0);
            if (a.hasValue(R.styleable.AppBarLayout_LayoutParams_layout_scrollInterpolator)) {
                this.mScrollInterpolator = AnimationUtils.loadInterpolator(c, a.getResourceId(R.styleable.AppBarLayout_LayoutParams_layout_scrollInterpolator, 0));
            }
            a.recycle();
        }

        public LayoutParams(int width, int height) {
            super(width, height);
        }

        public LayoutParams(int width, int height, float weight) {
            super(width, height, weight);
        }

        public LayoutParams(ViewGroup.LayoutParams p) {
            super(p);
        }

        public LayoutParams(ViewGroup.MarginLayoutParams source) {
            super(source);
        }

        public LayoutParams(LinearLayout.LayoutParams source) {
            super(source);
        }

        public LayoutParams(LayoutParams source) {
            super(source);
            this.mScrollFlags = source.mScrollFlags;
            this.mScrollInterpolator = source.mScrollInterpolator;
        }

        public void setScrollFlags(int flags) {
            this.mScrollFlags = flags;
        }

        public int getScrollFlags() {
            return this.mScrollFlags;
        }

        public void setScrollInterpolator(Interpolator interpolator) {
            this.mScrollInterpolator = interpolator;
        }

        public Interpolator getScrollInterpolator() {
            return this.mScrollInterpolator;
        }
    }

    public static class Behavior extends ViewOffsetBehavior<AppBarLayout> {
        private static final int INVALID_POSITION = -1;
        private ValueAnimatorCompat mAnimator;
        private Runnable mFlingRunnable;
        private int mOffsetDelta;
        private int mOffsetToChildIndexOnLayout = -1;
        private boolean mOffsetToChildIndexOnLayoutIsMinHeight;
        private float mOffsetToChildIndexOnLayoutPerc;
        /* access modifiers changed from: private */
        public ScrollerCompat mScroller;
        private boolean mSkipNestedPreScroll;

        public /* bridge */ /* synthetic */ int getLeftAndRightOffset() {
            return super.getLeftAndRightOffset();
        }

        public /* bridge */ /* synthetic */ int getTopAndBottomOffset() {
            return super.getTopAndBottomOffset();
        }

        public /* bridge */ /* synthetic */ boolean setLeftAndRightOffset(int x0) {
            return super.setLeftAndRightOffset(x0);
        }

        public /* bridge */ /* synthetic */ boolean setTopAndBottomOffset(int x0) {
            return super.setTopAndBottomOffset(x0);
        }

        public Behavior() {
        }

        public Behavior(Context context, AttributeSet attrs) {
            super(context, attrs);
        }

        public boolean onStartNestedScroll(CoordinatorLayout coordinatorLayout, AppBarLayout child, View directTargetChild, View target, int nestedScrollAxes) {
            boolean started = (nestedScrollAxes & 2) != 0 && child.hasScrollableChildren();
            if (started && this.mAnimator != null) {
                this.mAnimator.cancel();
            }
            return started;
        }

        public void onNestedPreScroll(CoordinatorLayout coordinatorLayout, AppBarLayout child, View target, int dx, int dy, int[] consumed) {
            int min;
            int max;
            if (dy != 0 && !this.mSkipNestedPreScroll) {
                if (dy < 0) {
                    min = -child.getTotalScrollRange();
                    max = min + child.getDownNestedPreScrollRange();
                } else {
                    min = -child.getUpNestedPreScrollRange();
                    max = 0;
                }
                consumed[1] = scroll(coordinatorLayout, child, dy, min, max);
            }
        }

        public void onNestedScroll(CoordinatorLayout coordinatorLayout, AppBarLayout child, View target, int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed) {
            if (dyUnconsumed < 0) {
                scroll(coordinatorLayout, child, dyUnconsumed, -child.getDownNestedScrollRange(), 0);
                this.mSkipNestedPreScroll = true;
                return;
            }
            this.mSkipNestedPreScroll = false;
        }

        public void onStopNestedScroll(CoordinatorLayout coordinatorLayout, AppBarLayout child, View target) {
            this.mSkipNestedPreScroll = false;
        }

        public boolean onNestedFling(CoordinatorLayout coordinatorLayout, AppBarLayout child, View target, float velocityX, float velocityY, boolean consumed) {
            int targetScroll;
            if (!consumed) {
                return fling(coordinatorLayout, child, -child.getTotalScrollRange(), 0, -velocityY);
            }
            if (velocityY < 0.0f) {
                targetScroll = (-child.getTotalScrollRange()) + child.getDownNestedPreScrollRange();
                if (getTopBottomOffsetForScrollingSibling() > targetScroll) {
                    return false;
                }
            } else {
                targetScroll = -child.getUpNestedPreScrollRange();
                if (getTopBottomOffsetForScrollingSibling() < targetScroll) {
                    return false;
                }
            }
            if (getTopBottomOffsetForScrollingSibling() == targetScroll) {
                return false;
            }
            animateOffsetTo(coordinatorLayout, child, targetScroll);
            return true;
        }

        private void animateOffsetTo(final CoordinatorLayout coordinatorLayout, final AppBarLayout child, int offset) {
            if (this.mAnimator == null) {
                this.mAnimator = ViewUtils.createAnimator();
                this.mAnimator.setInterpolator(AnimationUtils.DECELERATE_INTERPOLATOR);
                this.mAnimator.setUpdateListener(new ValueAnimatorCompat.AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimatorCompat animator) {
                        Behavior.this.setAppBarTopBottomOffset(coordinatorLayout, child, animator.getAnimatedIntValue());
                    }
                });
            } else {
                this.mAnimator.cancel();
            }
            this.mAnimator.setIntValues(getTopBottomOffsetForScrollingSibling(), offset);
            this.mAnimator.start();
        }

        private boolean fling(CoordinatorLayout coordinatorLayout, AppBarLayout layout, int minOffset, int maxOffset, float velocityY) {
            if (this.mFlingRunnable != null) {
                layout.removeCallbacks(this.mFlingRunnable);
            }
            if (this.mScroller == null) {
                this.mScroller = ScrollerCompat.create(layout.getContext());
            }
            this.mScroller.fling(0, getTopBottomOffsetForScrollingSibling(), 0, Math.round(velocityY), 0, 0, minOffset, maxOffset);
            if (this.mScroller.computeScrollOffset()) {
                this.mFlingRunnable = new FlingRunnable(coordinatorLayout, layout);
                ViewCompat.postOnAnimation(layout, this.mFlingRunnable);
                return true;
            }
            this.mFlingRunnable = null;
            return false;
        }

        private class FlingRunnable implements Runnable {
            private final AppBarLayout mLayout;
            private final CoordinatorLayout mParent;

            FlingRunnable(CoordinatorLayout parent, AppBarLayout layout) {
                this.mParent = parent;
                this.mLayout = layout;
            }

            public void run() {
                if (this.mLayout != null && Behavior.this.mScroller != null && Behavior.this.mScroller.computeScrollOffset()) {
                    Behavior.this.setAppBarTopBottomOffset(this.mParent, this.mLayout, Behavior.this.mScroller.getCurrY());
                    ViewCompat.postOnAnimation(this.mLayout, this);
                }
            }
        }

        public boolean onLayoutChild(CoordinatorLayout parent, AppBarLayout appBarLayout, int layoutDirection) {
            int offset;
            boolean handled = super.onLayoutChild(parent, appBarLayout, layoutDirection);
            if (this.mOffsetToChildIndexOnLayout >= 0) {
                View child = appBarLayout.getChildAt(this.mOffsetToChildIndexOnLayout);
                int offset2 = -child.getBottom();
                if (this.mOffsetToChildIndexOnLayoutIsMinHeight) {
                    offset = offset2 + ViewCompat.getMinimumHeight(child);
                } else {
                    offset = offset2 + Math.round(((float) child.getHeight()) * this.mOffsetToChildIndexOnLayoutPerc);
                }
                setTopAndBottomOffset(offset);
                this.mOffsetToChildIndexOnLayout = -1;
            }
            dispatchOffsetUpdates(appBarLayout);
            return handled;
        }

        private int scroll(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, int dy, int minOffset, int maxOffset) {
            return setAppBarTopBottomOffset(coordinatorLayout, appBarLayout, getTopBottomOffsetForScrollingSibling() - dy, minOffset, maxOffset);
        }

        /* access modifiers changed from: package-private */
        public final int setAppBarTopBottomOffset(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, int newOffset) {
            return setAppBarTopBottomOffset(coordinatorLayout, appBarLayout, newOffset, Integer.MIN_VALUE, ActivityChooserView.ActivityChooserViewAdapter.MAX_ACTIVITY_COUNT_UNLIMITED);
        }

        /* access modifiers changed from: package-private */
        public final int setAppBarTopBottomOffset(CoordinatorLayout coordinatorLayout, AppBarLayout appBarLayout, int newOffset, int minOffset, int maxOffset) {
            int newOffset2;
            int curOffset = getTopBottomOffsetForScrollingSibling();
            int consumed = 0;
            if (minOffset != 0 && curOffset >= minOffset && curOffset <= maxOffset && curOffset != (newOffset2 = MathUtils.constrain(newOffset, minOffset, maxOffset))) {
                int interpolatedOffset = appBarLayout.hasChildWithInterpolator() ? interpolateOffset(appBarLayout, newOffset2) : newOffset2;
                boolean offsetChanged = setTopAndBottomOffset(interpolatedOffset);
                consumed = curOffset - newOffset2;
                this.mOffsetDelta = newOffset2 - interpolatedOffset;
                if (!offsetChanged && appBarLayout.hasChildWithInterpolator()) {
                    coordinatorLayout.dispatchDependentViewsChanged(appBarLayout);
                }
                dispatchOffsetUpdates(appBarLayout);
            }
            return consumed;
        }

        private void dispatchOffsetUpdates(AppBarLayout layout) {
            List<WeakReference<OnOffsetChangedListener>> listeners = layout.mListeners;
            int z = listeners.size();
            for (int i = 0; i < z; i++) {
                WeakReference<OnOffsetChangedListener> ref = listeners.get(i);
                OnOffsetChangedListener listener = ref != null ? (OnOffsetChangedListener) ref.get() : null;
                if (listener != null) {
                    listener.onOffsetChanged(layout, getTopAndBottomOffset());
                }
            }
        }

        private int interpolateOffset(AppBarLayout layout, int offset) {
            int absOffset = Math.abs(offset);
            int i = 0;
            int z = layout.getChildCount();
            while (i < z) {
                View child = layout.getChildAt(i);
                LayoutParams childLp = (LayoutParams) child.getLayoutParams();
                Interpolator interpolator = childLp.getScrollInterpolator();
                if (absOffset < child.getTop() || absOffset > child.getBottom()) {
                    i++;
                } else if (interpolator == null) {
                    return offset;
                } else {
                    int childScrollableHeight = 0;
                    int flags = childLp.getScrollFlags();
                    if ((flags & 1) != 0) {
                        childScrollableHeight = 0 + child.getHeight();
                        if ((flags & 2) != 0) {
                            childScrollableHeight -= ViewCompat.getMinimumHeight(child);
                        }
                    }
                    if (childScrollableHeight <= 0) {
                        return offset;
                    }
                    return Integer.signum(offset) * (child.getTop() + Math.round(((float) childScrollableHeight) * interpolator.getInterpolation(((float) (absOffset - child.getTop())) / ((float) childScrollableHeight))));
                }
            }
            return offset;
        }

        /* access modifiers changed from: package-private */
        public final int getTopBottomOffsetForScrollingSibling() {
            return getTopAndBottomOffset() + this.mOffsetDelta;
        }

        public Parcelable onSaveInstanceState(CoordinatorLayout parent, AppBarLayout appBarLayout) {
            Parcelable superState = super.onSaveInstanceState(parent, appBarLayout);
            int offset = getTopAndBottomOffset();
            int i = 0;
            int count = appBarLayout.getChildCount();
            while (i < count) {
                View child = appBarLayout.getChildAt(i);
                int visBottom = child.getBottom() + offset;
                if (child.getTop() + offset > 0 || visBottom < 0) {
                    i++;
                } else {
                    SavedState ss = new SavedState(superState);
                    ss.firstVisibleChildIndex = i;
                    ss.firstVisibileChildAtMinimumHeight = visBottom == ViewCompat.getMinimumHeight(child);
                    ss.firstVisibileChildPercentageShown = ((float) visBottom) / ((float) child.getHeight());
                    return ss;
                }
            }
            return superState;
        }

        public void onRestoreInstanceState(CoordinatorLayout parent, AppBarLayout appBarLayout, Parcelable state) {
            if (state instanceof SavedState) {
                SavedState ss = (SavedState) state;
                super.onRestoreInstanceState(parent, appBarLayout, ss.getSuperState());
                this.mOffsetToChildIndexOnLayout = ss.firstVisibleChildIndex;
                this.mOffsetToChildIndexOnLayoutPerc = ss.firstVisibileChildPercentageShown;
                this.mOffsetToChildIndexOnLayoutIsMinHeight = ss.firstVisibileChildAtMinimumHeight;
                return;
            }
            super.onRestoreInstanceState(parent, appBarLayout, state);
            this.mOffsetToChildIndexOnLayout = -1;
        }

        protected static class SavedState extends View.BaseSavedState {
            public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() {
                public SavedState createFromParcel(Parcel source) {
                    return new SavedState(source);
                }

                public SavedState[] newArray(int size) {
                    return new SavedState[size];
                }
            };
            boolean firstVisibileChildAtMinimumHeight;
            float firstVisibileChildPercentageShown;
            int firstVisibleChildIndex;

            public SavedState(Parcel source) {
                super(source);
                this.firstVisibleChildIndex = source.readInt();
                this.firstVisibileChildPercentageShown = source.readFloat();
                this.firstVisibileChildAtMinimumHeight = source.readByte() != 0;
            }

            public SavedState(Parcelable superState) {
                super(superState);
            }

            public void writeToParcel(Parcel dest, int flags) {
                super.writeToParcel(dest, flags);
                dest.writeInt(this.firstVisibleChildIndex);
                dest.writeFloat(this.firstVisibileChildPercentageShown);
                dest.writeByte((byte) (this.firstVisibileChildAtMinimumHeight ? 1 : 0));
            }
        }
    }

    public static class ScrollingViewBehavior extends ViewOffsetBehavior<View> {
        private int mOverlayTop;

        public /* bridge */ /* synthetic */ int getLeftAndRightOffset() {
            return super.getLeftAndRightOffset();
        }

        public /* bridge */ /* synthetic */ int getTopAndBottomOffset() {
            return super.getTopAndBottomOffset();
        }

        public /* bridge */ /* synthetic */ boolean onLayoutChild(CoordinatorLayout x0, View x1, int x2) {
            return super.onLayoutChild(x0, x1, x2);
        }

        public /* bridge */ /* synthetic */ boolean setLeftAndRightOffset(int x0) {
            return super.setLeftAndRightOffset(x0);
        }

        public /* bridge */ /* synthetic */ boolean setTopAndBottomOffset(int x0) {
            return super.setTopAndBottomOffset(x0);
        }

        public ScrollingViewBehavior() {
        }

        public ScrollingViewBehavior(Context context, AttributeSet attrs) {
            super(context, attrs);
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ScrollingViewBehavior_Params);
            this.mOverlayTop = a.getDimensionPixelSize(R.styleable.ScrollingViewBehavior_Params_behavior_overlapTop, 0);
            a.recycle();
        }

        public boolean layoutDependsOn(CoordinatorLayout parent, View child, View dependency) {
            return dependency instanceof AppBarLayout;
        }

        public boolean onMeasureChild(CoordinatorLayout parent, View child, int parentWidthMeasureSpec, int widthUsed, int parentHeightMeasureSpec, int heightUsed) {
            AppBarLayout appBar;
            if (child.getLayoutParams().height == -1) {
                List<View> dependencies = parent.getDependencies(child);
                if (!dependencies.isEmpty() && (appBar = findFirstAppBarLayout(dependencies)) != null && ViewCompat.isLaidOut(appBar)) {
                    if (ViewCompat.getFitsSystemWindows(appBar)) {
                        ViewCompat.setFitsSystemWindows(child, true);
                    }
                    CoordinatorLayout coordinatorLayout = parent;
                    View view = child;
                    int i = parentWidthMeasureSpec;
                    int i2 = widthUsed;
                    coordinatorLayout.onMeasureChild(view, i, i2, View.MeasureSpec.makeMeasureSpec((parent.getHeight() - appBar.getMeasuredHeight()) + appBar.getTotalScrollRange(), Integer.MIN_VALUE), heightUsed);
                    return true;
                }
            }
            return false;
        }

        public boolean onDependentViewChanged(CoordinatorLayout parent, View child, View dependency) {
            CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) dependency.getLayoutParams()).getBehavior();
            if (!(behavior instanceof Behavior)) {
                return false;
            }
            int appBarOffset = ((Behavior) behavior).getTopBottomOffsetForScrollingSibling();
            int expandedMax = dependency.getHeight() - this.mOverlayTop;
            int collapsedMin = parent.getHeight() - child.getHeight();
            if (this.mOverlayTop == 0 || !(dependency instanceof AppBarLayout)) {
                setTopAndBottomOffset(MathUtils.constrain((dependency.getHeight() - this.mOverlayTop) + appBarOffset, collapsedMin, expandedMax));
                return false;
            }
            setTopAndBottomOffset(AnimationUtils.lerp(expandedMax, collapsedMin, ((float) Math.abs(appBarOffset)) / ((float) ((AppBarLayout) dependency).getTotalScrollRange())));
            return false;
        }

        public void setOverlayTop(int overlayTop) {
            this.mOverlayTop = overlayTop;
        }

        public int getOverlayTop() {
            return this.mOverlayTop;
        }

        private static AppBarLayout findFirstAppBarLayout(List<View> views) {
            int z = views.size();
            for (int i = 0; i < z; i++) {
                View view = views.get(i);
                if (view instanceof AppBarLayout) {
                    return (AppBarLayout) view;
                }
            }
            return null;
        }
    }
}
