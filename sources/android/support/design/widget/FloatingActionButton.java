package android.support.design.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.PorterDuff;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.design.R;
import android.support.design.widget.AnimationUtils;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.Snackbar;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import java.util.List;

@CoordinatorLayout.DefaultBehavior(Behavior.class)
public class FloatingActionButton extends ImageView {
    private static final int SIZE_MINI = 1;
    private static final int SIZE_NORMAL = 0;
    private ColorStateList mBackgroundTint;
    private PorterDuff.Mode mBackgroundTintMode;
    private int mBorderWidth;
    /* access modifiers changed from: private */
    public int mContentPadding;
    private final FloatingActionButtonImpl mImpl;
    private int mRippleColor;
    /* access modifiers changed from: private */
    public final Rect mShadowPadding;
    private int mSize;

    public FloatingActionButton(Context context) {
        this(context, (AttributeSet) null);
    }

    public FloatingActionButton(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public FloatingActionButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mShadowPadding = new Rect();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.FloatingActionButton, defStyleAttr, R.style.Widget_Design_FloatingActionButton);
        Drawable background = a.getDrawable(R.styleable.FloatingActionButton_android_background);
        this.mBackgroundTint = a.getColorStateList(R.styleable.FloatingActionButton_backgroundTint);
        this.mBackgroundTintMode = parseTintMode(a.getInt(R.styleable.FloatingActionButton_backgroundTintMode, -1), (PorterDuff.Mode) null);
        this.mRippleColor = a.getColor(R.styleable.FloatingActionButton_rippleColor, 0);
        this.mSize = a.getInt(R.styleable.FloatingActionButton_fabSize, 0);
        this.mBorderWidth = a.getDimensionPixelSize(R.styleable.FloatingActionButton_borderWidth, 0);
        float elevation = a.getDimension(R.styleable.FloatingActionButton_elevation, 0.0f);
        float pressedTranslationZ = a.getDimension(R.styleable.FloatingActionButton_pressedTranslationZ, 0.0f);
        a.recycle();
        ShadowViewDelegate delegate = new ShadowViewDelegate() {
            public float getRadius() {
                return ((float) FloatingActionButton.this.getSizeDimension()) / 2.0f;
            }

            public void setShadowPadding(int left, int top, int right, int bottom) {
                FloatingActionButton.this.mShadowPadding.set(left, top, right, bottom);
                FloatingActionButton.this.setPadding(FloatingActionButton.this.mContentPadding + left, FloatingActionButton.this.mContentPadding + top, FloatingActionButton.this.mContentPadding + right, FloatingActionButton.this.mContentPadding + bottom);
            }

            public void setBackgroundDrawable(Drawable background) {
                FloatingActionButton.super.setBackgroundDrawable(background);
            }
        };
        if (Build.VERSION.SDK_INT >= 21) {
            this.mImpl = new FloatingActionButtonLollipop(this, delegate);
        } else {
            this.mImpl = new FloatingActionButtonEclairMr1(this, delegate);
        }
        this.mContentPadding = (getSizeDimension() - ((int) getResources().getDimension(R.dimen.fab_content_size))) / 2;
        this.mImpl.setBackgroundDrawable(background, this.mBackgroundTint, this.mBackgroundTintMode, this.mRippleColor, this.mBorderWidth);
        this.mImpl.setElevation(elevation);
        this.mImpl.setPressedTranslationZ(pressedTranslationZ);
        setClickable(true);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int preferredSize = getSizeDimension();
        int d = Math.min(resolveAdjustedSize(preferredSize, widthMeasureSpec), resolveAdjustedSize(preferredSize, heightMeasureSpec));
        setMeasuredDimension(this.mShadowPadding.left + d + this.mShadowPadding.right, this.mShadowPadding.top + d + this.mShadowPadding.bottom);
    }

    public void setRippleColor(int color) {
        if (this.mRippleColor != color) {
            this.mRippleColor = color;
            this.mImpl.setRippleColor(color);
        }
    }

    @Nullable
    public ColorStateList getBackgroundTintList() {
        return this.mBackgroundTint;
    }

    public void setBackgroundTintList(@Nullable ColorStateList tint) {
        this.mImpl.setBackgroundTintList(tint);
    }

    @Nullable
    public PorterDuff.Mode getBackgroundTintMode() {
        return this.mBackgroundTintMode;
    }

    public void setBackgroundTintMode(@Nullable PorterDuff.Mode tintMode) {
        this.mImpl.setBackgroundTintMode(tintMode);
    }

    public void setBackgroundDrawable(Drawable background) {
        if (this.mImpl != null) {
            this.mImpl.setBackgroundDrawable(background, this.mBackgroundTint, this.mBackgroundTintMode, this.mRippleColor, this.mBorderWidth);
        }
    }

    /* access modifiers changed from: package-private */
    public final int getSizeDimension() {
        switch (this.mSize) {
            case 1:
                return getResources().getDimensionPixelSize(R.dimen.fab_size_mini);
            default:
                return getResources().getDimensionPixelSize(R.dimen.fab_size_normal);
        }
    }

    /* access modifiers changed from: protected */
    public void drawableStateChanged() {
        super.drawableStateChanged();
        this.mImpl.onDrawableStateChanged(getDrawableState());
    }

    @TargetApi(11)
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        this.mImpl.jumpDrawableToCurrentState();
    }

    private static int resolveAdjustedSize(int desiredSize, int measureSpec) {
        int result = desiredSize;
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        switch (specMode) {
            case Integer.MIN_VALUE:
                return Math.min(desiredSize, specSize);
            case 0:
                return desiredSize;
            case 1073741824:
                return specSize;
            default:
                return result;
        }
    }

    static PorterDuff.Mode parseTintMode(int value, PorterDuff.Mode defaultMode) {
        switch (value) {
            case 3:
                return PorterDuff.Mode.SRC_OVER;
            case 5:
                return PorterDuff.Mode.SRC_IN;
            case 9:
                return PorterDuff.Mode.SRC_ATOP;
            case 14:
                return PorterDuff.Mode.MULTIPLY;
            case 15:
                return PorterDuff.Mode.SCREEN;
            default:
                return defaultMode;
        }
    }

    public static class Behavior extends CoordinatorLayout.Behavior<FloatingActionButton> {
        private static final boolean SNACKBAR_BEHAVIOR_ENABLED = (Build.VERSION.SDK_INT >= 11);
        /* access modifiers changed from: private */
        public boolean mIsAnimatingOut;
        private Rect mTmpRect;
        private float mTranslationY;

        public boolean layoutDependsOn(CoordinatorLayout parent, FloatingActionButton child, View dependency) {
            return SNACKBAR_BEHAVIOR_ENABLED && (dependency instanceof Snackbar.SnackbarLayout);
        }

        public boolean onDependentViewChanged(CoordinatorLayout parent, FloatingActionButton child, View dependency) {
            if (dependency instanceof Snackbar.SnackbarLayout) {
                updateFabTranslationForSnackbar(parent, child, dependency);
                return false;
            } else if (!(dependency instanceof AppBarLayout)) {
                return false;
            } else {
                AppBarLayout appBarLayout = (AppBarLayout) dependency;
                if (this.mTmpRect == null) {
                    this.mTmpRect = new Rect();
                }
                Rect rect = this.mTmpRect;
                ViewGroupUtils.getDescendantRect(parent, dependency, rect);
                if (rect.bottom <= appBarLayout.getMinimumHeightForVisibleOverlappingContent()) {
                    if (this.mIsAnimatingOut || child.getVisibility() != 0) {
                        return false;
                    }
                    animateOut(child);
                    return false;
                } else if (child.getVisibility() == 0) {
                    return false;
                } else {
                    animateIn(child);
                    return false;
                }
            }
        }

        private void updateFabTranslationForSnackbar(CoordinatorLayout parent, FloatingActionButton fab, View snackbar) {
            float translationY = getFabTranslationYForSnackbar(parent, fab);
            if (translationY != this.mTranslationY) {
                ViewCompat.animate(fab).cancel();
                if (Math.abs(translationY - this.mTranslationY) == ((float) snackbar.getHeight())) {
                    ViewCompat.animate(fab).translationY(translationY).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setListener((ViewPropertyAnimatorListener) null);
                } else {
                    ViewCompat.setTranslationY(fab, translationY);
                }
                this.mTranslationY = translationY;
            }
        }

        private float getFabTranslationYForSnackbar(CoordinatorLayout parent, FloatingActionButton fab) {
            float minOffset = 0.0f;
            List<View> dependencies = parent.getDependencies(fab);
            int z = dependencies.size();
            for (int i = 0; i < z; i++) {
                View view = dependencies.get(i);
                if ((view instanceof Snackbar.SnackbarLayout) && parent.doViewsOverlap(fab, view)) {
                    minOffset = Math.min(minOffset, ViewCompat.getTranslationY(view) - ((float) view.getHeight()));
                }
            }
            return minOffset;
        }

        private void animateIn(FloatingActionButton button) {
            button.setVisibility(0);
            if (Build.VERSION.SDK_INT >= 14) {
                ViewCompat.animate(button).scaleX(1.0f).scaleY(1.0f).alpha(1.0f).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).withLayer().setListener((ViewPropertyAnimatorListener) null).start();
                return;
            }
            Animation anim = AnimationUtils.loadAnimation(button.getContext(), R.anim.fab_in);
            anim.setDuration(200);
            anim.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
            button.startAnimation(anim);
        }

        private void animateOut(final FloatingActionButton button) {
            if (Build.VERSION.SDK_INT >= 14) {
                ViewCompat.animate(button).scaleX(0.0f).scaleY(0.0f).alpha(0.0f).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).withLayer().setListener(new ViewPropertyAnimatorListener() {
                    public void onAnimationStart(View view) {
                        boolean unused = Behavior.this.mIsAnimatingOut = true;
                    }

                    public void onAnimationCancel(View view) {
                        boolean unused = Behavior.this.mIsAnimatingOut = false;
                    }

                    public void onAnimationEnd(View view) {
                        boolean unused = Behavior.this.mIsAnimatingOut = false;
                        view.setVisibility(8);
                    }
                }).start();
                return;
            }
            Animation anim = AnimationUtils.loadAnimation(button.getContext(), R.anim.fab_out);
            anim.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
            anim.setDuration(200);
            anim.setAnimationListener(new AnimationUtils.AnimationListenerAdapter() {
                public void onAnimationStart(Animation animation) {
                    boolean unused = Behavior.this.mIsAnimatingOut = true;
                }

                public void onAnimationEnd(Animation animation) {
                    boolean unused = Behavior.this.mIsAnimatingOut = false;
                    button.setVisibility(8);
                }
            });
            button.startAnimation(anim);
        }
    }
}
