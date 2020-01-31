package android.support.design.widget;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Handler;
import android.os.Message;
import android.support.design.R;
import android.support.design.widget.ValueAnimatorCompat;
import android.support.v4.view.AccessibilityDelegateCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.support.v4.view.accessibility.AccessibilityNodeInfoCompat;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.animation.AccelerateInterpolator;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

public class TextInputLayout extends LinearLayout {
    private static final int ANIMATION_DURATION = 200;
    private static final int MSG_UPDATE_LABEL = 0;
    private ValueAnimatorCompat mAnimator;
    /* access modifiers changed from: private */
    public final CollapsingTextHelper mCollapsingTextHelper;
    /* access modifiers changed from: private */
    public EditText mEditText;
    private boolean mErrorEnabled;
    private int mErrorTextAppearance;
    /* access modifiers changed from: private */
    public TextView mErrorView;
    /* access modifiers changed from: private */
    public final Handler mHandler;
    private CharSequence mHint;
    private ColorStateList mLabelTextColor;

    public TextInputLayout(Context context) {
        this(context, (AttributeSet) null);
    }

    public TextInputLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        setOrientation(1);
        setWillNotDraw(false);
        this.mCollapsingTextHelper = new CollapsingTextHelper(this);
        this.mHandler = new Handler(new Handler.Callback() {
            public boolean handleMessage(Message message) {
                switch (message.what) {
                    case 0:
                        TextInputLayout.this.updateLabelVisibility(true);
                        return true;
                    default:
                        return false;
                }
            }
        });
        this.mCollapsingTextHelper.setTextSizeInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
        this.mCollapsingTextHelper.setPositionInterpolator(new AccelerateInterpolator());
        this.mCollapsingTextHelper.setCollapsedTextVerticalGravity(48);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.TextInputLayout, 0, R.style.Widget_Design_TextInputLayout);
        this.mHint = a.getText(R.styleable.TextInputLayout_android_hint);
        int hintAppearance = a.getResourceId(R.styleable.TextInputLayout_hintTextAppearance, -1);
        if (hintAppearance != -1) {
            this.mCollapsingTextHelper.setCollapsedTextAppearance(hintAppearance);
        }
        this.mErrorTextAppearance = a.getResourceId(R.styleable.TextInputLayout_errorTextAppearance, 0);
        boolean errorEnabled = a.getBoolean(R.styleable.TextInputLayout_errorEnabled, false);
        this.mLabelTextColor = createLabelTextColorStateList(this.mCollapsingTextHelper.getCollapsedTextColor());
        this.mCollapsingTextHelper.setCollapsedTextColor(this.mLabelTextColor.getDefaultColor());
        this.mCollapsingTextHelper.setExpandedTextColor(this.mLabelTextColor.getDefaultColor());
        a.recycle();
        if (errorEnabled) {
            setErrorEnabled(true);
        }
        if (ViewCompat.getImportantForAccessibility(this) == 0) {
            ViewCompat.setImportantForAccessibility(this, 1);
        }
        ViewCompat.setAccessibilityDelegate(this, new TextInputAccessibilityDelegate());
    }

    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        if (child instanceof EditText) {
            super.addView(child, 0, setEditText((EditText) child, params));
        } else {
            super.addView(child, index, params);
        }
    }

    private LinearLayout.LayoutParams setEditText(EditText editText, ViewGroup.LayoutParams lp) {
        if (this.mEditText != null) {
            throw new IllegalArgumentException("We already have an EditText, can only have one");
        }
        this.mEditText = editText;
        this.mCollapsingTextHelper.setExpandedTextSize(this.mEditText.getTextSize());
        this.mEditText.addTextChangedListener(new TextWatcher() {
            public void afterTextChanged(Editable s) {
                TextInputLayout.this.mHandler.sendEmptyMessage(0);
            }

            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            public void onTextChanged(CharSequence s, int start, int before, int count) {
            }
        });
        this.mEditText.setOnFocusChangeListener(new View.OnFocusChangeListener() {
            public void onFocusChange(View view, boolean focused) {
                TextInputLayout.this.mHandler.sendEmptyMessage(0);
            }
        });
        if (TextUtils.isEmpty(this.mHint)) {
            setHint(this.mEditText.getHint());
            this.mEditText.setHint((CharSequence) null);
        }
        if (this.mErrorView != null) {
            ViewCompat.setPaddingRelative(this.mErrorView, ViewCompat.getPaddingStart(this.mEditText), 0, ViewCompat.getPaddingEnd(this.mEditText), this.mEditText.getPaddingBottom());
        }
        updateLabelVisibility(false);
        LinearLayout.LayoutParams newLp = new LinearLayout.LayoutParams(lp);
        Paint paint = new Paint();
        paint.setTextSize(this.mCollapsingTextHelper.getExpandedTextSize());
        newLp.topMargin = (int) (-paint.ascent());
        return newLp;
    }

    /* access modifiers changed from: private */
    public void updateLabelVisibility(boolean animate) {
        boolean hasText = !TextUtils.isEmpty(this.mEditText.getText());
        boolean isFocused = this.mEditText.isFocused();
        this.mCollapsingTextHelper.setCollapsedTextColor(this.mLabelTextColor.getColorForState(isFocused ? FOCUSED_STATE_SET : EMPTY_STATE_SET, this.mLabelTextColor.getDefaultColor()));
        if (hasText || isFocused) {
            collapseHint(animate);
        } else {
            expandHint(animate);
        }
    }

    public EditText getEditText() {
        return this.mEditText;
    }

    public void setHint(CharSequence hint) {
        this.mHint = hint;
        this.mCollapsingTextHelper.setText(hint);
        sendAccessibilityEvent(2048);
    }

    public void setErrorEnabled(boolean enabled) {
        if (this.mErrorEnabled != enabled) {
            if (enabled) {
                this.mErrorView = new TextView(getContext());
                this.mErrorView.setTextAppearance(getContext(), this.mErrorTextAppearance);
                this.mErrorView.setVisibility(4);
                addView(this.mErrorView);
                if (this.mEditText != null) {
                    ViewCompat.setPaddingRelative(this.mErrorView, ViewCompat.getPaddingStart(this.mEditText), 0, ViewCompat.getPaddingEnd(this.mEditText), this.mEditText.getPaddingBottom());
                }
            } else {
                removeView(this.mErrorView);
                this.mErrorView = null;
            }
            this.mErrorEnabled = enabled;
        }
    }

    public void setError(CharSequence error) {
        if (!this.mErrorEnabled) {
            if (!TextUtils.isEmpty(error)) {
                setErrorEnabled(true);
            } else {
                return;
            }
        }
        if (!TextUtils.isEmpty(error)) {
            this.mErrorView.setText(error);
            this.mErrorView.setVisibility(0);
            ViewCompat.setAlpha(this.mErrorView, 0.0f);
            ViewCompat.animate(this.mErrorView).alpha(1.0f).setDuration(200).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setListener((ViewPropertyAnimatorListener) null).start();
        } else if (this.mErrorView.getVisibility() == 0) {
            ViewCompat.animate(this.mErrorView).alpha(0.0f).setDuration(200).setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR).setListener(new ViewPropertyAnimatorListenerAdapter() {
                public void onAnimationEnd(View view) {
                    TextInputLayout.this.mErrorView.setText((CharSequence) null);
                    TextInputLayout.this.mErrorView.setVisibility(4);
                }
            }).start();
        }
        sendAccessibilityEvent(2048);
    }

    public void draw(Canvas canvas) {
        super.draw(canvas);
        this.mCollapsingTextHelper.draw(canvas);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        this.mCollapsingTextHelper.onLayout(changed, left, top, right, bottom);
        if (this.mEditText != null) {
            int l = this.mEditText.getLeft() + this.mEditText.getPaddingLeft();
            int r = this.mEditText.getRight() - this.mEditText.getPaddingRight();
            this.mCollapsingTextHelper.setExpandedBounds(l, this.mEditText.getTop() + this.mEditText.getPaddingTop(), r, this.mEditText.getBottom() - this.mEditText.getPaddingBottom());
            this.mCollapsingTextHelper.setCollapsedBounds(l, getPaddingTop(), r, (bottom - top) - getPaddingBottom());
        }
    }

    private void collapseHint(boolean animate) {
        if (animate) {
            animateToExpansionFraction(1.0f);
        } else {
            this.mCollapsingTextHelper.setExpansionFraction(1.0f);
        }
    }

    private void expandHint(boolean animate) {
        if (animate) {
            animateToExpansionFraction(0.0f);
        } else {
            this.mCollapsingTextHelper.setExpansionFraction(0.0f);
        }
    }

    private void animateToExpansionFraction(float target) {
        if (this.mAnimator == null) {
            this.mAnimator = ViewUtils.createAnimator();
            this.mAnimator.setInterpolator(AnimationUtils.LINEAR_INTERPOLATOR);
            this.mAnimator.setDuration(ANIMATION_DURATION);
            this.mAnimator.setUpdateListener(new ValueAnimatorCompat.AnimatorUpdateListener() {
                public void onAnimationUpdate(ValueAnimatorCompat animator) {
                    TextInputLayout.this.mCollapsingTextHelper.setExpansionFraction(animator.getAnimatedFloatValue());
                }
            });
        } else if (this.mAnimator.isRunning()) {
            this.mAnimator.cancel();
        }
        this.mAnimator.setFloatValues(this.mCollapsingTextHelper.getExpansionFraction(), target);
        this.mAnimator.start();
    }

    private ColorStateList createLabelTextColorStateList(int color) {
        int[][] states = new int[2][];
        int[] colors = new int[2];
        states[0] = FOCUSED_STATE_SET;
        colors[0] = color;
        int i = 0 + 1;
        states[i] = EMPTY_STATE_SET;
        colors[i] = getThemeAttrColor(16842906);
        int i2 = i + 1;
        return new ColorStateList(states, colors);
    }

    private int getThemeAttrColor(int attr) {
        TypedValue tv = new TypedValue();
        if (getContext().getTheme().resolveAttribute(attr, tv, true)) {
            return tv.data;
        }
        return -65281;
    }

    private class TextInputAccessibilityDelegate extends AccessibilityDelegateCompat {
        private TextInputAccessibilityDelegate() {
        }

        public void onInitializeAccessibilityEvent(View host, AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(host, event);
            event.setClassName(TextInputLayout.class.getSimpleName());
        }

        public void onPopulateAccessibilityEvent(View host, AccessibilityEvent event) {
            super.onPopulateAccessibilityEvent(host, event);
            CharSequence text = TextInputLayout.this.mCollapsingTextHelper.getText();
            if (!TextUtils.isEmpty(text)) {
                event.getText().add(text);
            }
        }

        public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfoCompat info) {
            super.onInitializeAccessibilityNodeInfo(host, info);
            info.setClassName(TextInputLayout.class.getSimpleName());
            CharSequence text = TextInputLayout.this.mCollapsingTextHelper.getText();
            if (!TextUtils.isEmpty(text)) {
                info.setText(text);
            }
            if (TextInputLayout.this.mEditText != null) {
                info.setLabelFor(TextInputLayout.this.mEditText);
            }
            CharSequence error = TextInputLayout.this.mErrorView != null ? TextInputLayout.this.mErrorView.getText() : null;
            if (!TextUtils.isEmpty(error)) {
                info.setContentInvalid(true);
                info.setError(error);
            }
        }
    }
}
