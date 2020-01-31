package android.support.design.widget;

import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Build;
import android.support.design.R;
import android.support.v4.view.ViewCompat;
import android.text.TextPaint;
import android.text.TextUtils;
import android.view.View;
import android.view.animation.Interpolator;
import com.anjlab.android.iab.v3.Constants;

final class CollapsingTextHelper {
    private static final boolean DEBUG_DRAW = false;
    private static final Paint DEBUG_DRAW_PAINT = null;
    private static final boolean USE_SCALING_TEXTURE = (Build.VERSION.SDK_INT < 18);
    private final Rect mCollapsedBounds;
    private int mCollapsedTextColor;
    private float mCollapsedTextSize;
    private int mCollapsedTextVerticalGravity = 16;
    private float mCollapsedTop;
    private float mCurrentLeft;
    private float mCurrentRight;
    private float mCurrentTextSize;
    private float mCurrentTop;
    private final Rect mExpandedBounds;
    private float mExpandedFraction;
    private int mExpandedTextColor;
    private float mExpandedTextSize;
    private int mExpandedTextVerticalGravity = 16;
    private Bitmap mExpandedTitleTexture;
    private float mExpandedTop;
    private Interpolator mPositionInterpolator;
    private float mScale;
    private CharSequence mText;
    private final TextPaint mTextPaint;
    private Interpolator mTextSizeInterpolator;
    private CharSequence mTextToDraw;
    private float mTextWidth;
    private float mTextureAscent;
    private float mTextureDescent;
    private Paint mTexturePaint;
    private boolean mUseTexture;
    private final View mView;

    static {
        if (DEBUG_DRAW_PAINT != null) {
            DEBUG_DRAW_PAINT.setAntiAlias(true);
            DEBUG_DRAW_PAINT.setColor(-65281);
        }
    }

    public CollapsingTextHelper(View view) {
        this.mView = view;
        this.mTextPaint = new TextPaint();
        this.mTextPaint.setAntiAlias(true);
        this.mCollapsedBounds = new Rect();
        this.mExpandedBounds = new Rect();
    }

    /* access modifiers changed from: package-private */
    public void setTextSizeInterpolator(Interpolator interpolator) {
        this.mTextSizeInterpolator = interpolator;
        recalculate();
    }

    /* access modifiers changed from: package-private */
    public void setPositionInterpolator(Interpolator interpolator) {
        this.mPositionInterpolator = interpolator;
        recalculate();
    }

    /* access modifiers changed from: package-private */
    public void setExpandedTextSize(float textSize) {
        if (this.mExpandedTextSize != textSize) {
            this.mExpandedTextSize = textSize;
            recalculate();
        }
    }

    /* access modifiers changed from: package-private */
    public void setCollapsedTextSize(float textSize) {
        if (this.mCollapsedTextSize != textSize) {
            this.mCollapsedTextSize = textSize;
            recalculate();
        }
    }

    /* access modifiers changed from: package-private */
    public void setCollapsedTextColor(int textColor) {
        if (this.mCollapsedTextColor != textColor) {
            this.mCollapsedTextColor = textColor;
            recalculate();
        }
    }

    /* access modifiers changed from: package-private */
    public void setExpandedTextColor(int textColor) {
        if (this.mExpandedTextColor != textColor) {
            this.mExpandedTextColor = textColor;
            recalculate();
        }
    }

    /* access modifiers changed from: package-private */
    public void setExpandedBounds(int left, int top, int right, int bottom) {
        this.mExpandedBounds.set(left, top, right, bottom);
        recalculate();
    }

    /* access modifiers changed from: package-private */
    public void setCollapsedBounds(int left, int top, int right, int bottom) {
        this.mCollapsedBounds.set(left, top, right, bottom);
        recalculate();
    }

    /* access modifiers changed from: package-private */
    public void setExpandedTextVerticalGravity(int gravity) {
        int gravity2 = gravity & Constants.BILLING_ERROR_SKUDETAILS_FAILED;
        if (this.mExpandedTextVerticalGravity != gravity2) {
            this.mExpandedTextVerticalGravity = gravity2;
            recalculate();
        }
    }

    /* access modifiers changed from: package-private */
    public void setCollapsedTextVerticalGravity(int gravity) {
        int gravity2 = gravity & Constants.BILLING_ERROR_SKUDETAILS_FAILED;
        if (this.mCollapsedTextVerticalGravity != gravity2) {
            this.mCollapsedTextVerticalGravity = gravity2;
            recalculate();
        }
    }

    /* access modifiers changed from: package-private */
    public void setCollapsedTextAppearance(int resId) {
        TypedArray a = this.mView.getContext().obtainStyledAttributes(resId, R.styleable.TextAppearance);
        if (a.hasValue(R.styleable.TextAppearance_android_textColor)) {
            this.mCollapsedTextColor = a.getColor(R.styleable.TextAppearance_android_textColor, 0);
        }
        if (a.hasValue(R.styleable.TextAppearance_android_textSize)) {
            this.mCollapsedTextSize = (float) a.getDimensionPixelSize(R.styleable.TextAppearance_android_textSize, 0);
        }
        a.recycle();
        recalculate();
    }

    /* access modifiers changed from: package-private */
    public void setExpandedTextAppearance(int resId) {
        TypedArray a = this.mView.getContext().obtainStyledAttributes(resId, R.styleable.TextAppearance);
        if (a.hasValue(R.styleable.TextAppearance_android_textColor)) {
            this.mExpandedTextColor = a.getColor(R.styleable.TextAppearance_android_textColor, 0);
        }
        if (a.hasValue(R.styleable.TextAppearance_android_textSize)) {
            this.mExpandedTextSize = (float) a.getDimensionPixelSize(R.styleable.TextAppearance_android_textSize, 0);
        }
        a.recycle();
        recalculate();
    }

    /* access modifiers changed from: package-private */
    public void setExpansionFraction(float fraction) {
        float fraction2 = MathUtils.constrain(fraction, 0.0f, 1.0f);
        if (fraction2 != this.mExpandedFraction) {
            this.mExpandedFraction = fraction2;
            calculateOffsets();
        }
    }

    /* access modifiers changed from: package-private */
    public float getExpansionFraction() {
        return this.mExpandedFraction;
    }

    /* access modifiers changed from: package-private */
    public float getCollapsedTextSize() {
        return this.mCollapsedTextSize;
    }

    /* access modifiers changed from: package-private */
    public float getExpandedTextSize() {
        return this.mExpandedTextSize;
    }

    private void calculateOffsets() {
        float fraction = this.mExpandedFraction;
        this.mCurrentLeft = interpolate((float) this.mExpandedBounds.left, (float) this.mCollapsedBounds.left, fraction, this.mPositionInterpolator);
        this.mCurrentTop = interpolate(this.mExpandedTop, this.mCollapsedTop, fraction, this.mPositionInterpolator);
        this.mCurrentRight = interpolate((float) this.mExpandedBounds.right, (float) this.mCollapsedBounds.right, fraction, this.mPositionInterpolator);
        setInterpolatedTextSize(interpolate(this.mExpandedTextSize, this.mCollapsedTextSize, fraction, this.mTextSizeInterpolator));
        if (this.mCollapsedTextColor != this.mExpandedTextColor) {
            this.mTextPaint.setColor(blendColors(this.mExpandedTextColor, this.mCollapsedTextColor, fraction));
        } else {
            this.mTextPaint.setColor(this.mCollapsedTextColor);
        }
        ViewCompat.postInvalidateOnAnimation(this.mView);
    }

    private void calculateBaselines() {
        this.mTextPaint.setTextSize(this.mCollapsedTextSize);
        switch (this.mCollapsedTextVerticalGravity) {
            case 48:
                this.mCollapsedTop = ((float) this.mCollapsedBounds.top) - this.mTextPaint.ascent();
                break;
            case 80:
                this.mCollapsedTop = (float) this.mCollapsedBounds.bottom;
                break;
            default:
                this.mCollapsedTop = ((float) this.mCollapsedBounds.centerY()) + (((this.mTextPaint.descent() - this.mTextPaint.ascent()) / 2.0f) - this.mTextPaint.descent());
                break;
        }
        this.mTextPaint.setTextSize(this.mExpandedTextSize);
        switch (this.mExpandedTextVerticalGravity) {
            case 48:
                this.mExpandedTop = ((float) this.mExpandedBounds.top) - this.mTextPaint.ascent();
                break;
            case 80:
                this.mExpandedTop = (float) this.mExpandedBounds.bottom;
                break;
            default:
                this.mExpandedTop = ((float) this.mExpandedBounds.centerY()) + (((this.mTextPaint.descent() - this.mTextPaint.ascent()) / 2.0f) - this.mTextPaint.descent());
                break;
        }
        this.mTextureAscent = this.mTextPaint.ascent();
        this.mTextureDescent = this.mTextPaint.descent();
        clearTexture();
    }

    public void draw(Canvas canvas) {
        float ascent;
        boolean drawTexture = true;
        int saveCount = canvas.save();
        if (this.mTextToDraw != null) {
            boolean isRtl = ViewCompat.getLayoutDirection(this.mView) == 1;
            float x = isRtl ? this.mCurrentRight : this.mCurrentLeft;
            float y = this.mCurrentTop;
            if (!this.mUseTexture || this.mExpandedTitleTexture == null) {
                drawTexture = false;
            }
            this.mTextPaint.setTextSize(this.mCurrentTextSize);
            if (drawTexture) {
                ascent = this.mTextureAscent * this.mScale;
                float f = this.mTextureDescent * this.mScale;
            } else {
                ascent = this.mTextPaint.ascent() * this.mScale;
                float descent = this.mTextPaint.descent() * this.mScale;
            }
            if (drawTexture) {
                y += ascent;
            }
            if (this.mScale != 1.0f) {
                canvas.scale(this.mScale, this.mScale, x, y);
            }
            if (isRtl) {
                x -= this.mTextWidth;
            }
            if (drawTexture) {
                canvas.drawBitmap(this.mExpandedTitleTexture, x, y, this.mTexturePaint);
            } else {
                canvas.drawText(this.mTextToDraw, 0, this.mTextToDraw.length(), x, y, this.mTextPaint);
            }
        }
        canvas.restoreToCount(saveCount);
    }

    private void setInterpolatedTextSize(float textSize) {
        float availableWidth;
        float newTextSize;
        boolean z = true;
        if (this.mText != null) {
            boolean updateDrawText = false;
            if (isClose(textSize, this.mCollapsedTextSize)) {
                availableWidth = (float) this.mCollapsedBounds.width();
                newTextSize = this.mCollapsedTextSize;
                this.mScale = 1.0f;
            } else {
                availableWidth = (float) this.mExpandedBounds.width();
                newTextSize = this.mExpandedTextSize;
                if (isClose(textSize, this.mExpandedTextSize)) {
                    this.mScale = 1.0f;
                } else {
                    this.mScale = textSize / this.mExpandedTextSize;
                }
            }
            if (availableWidth > 0.0f) {
                if (this.mCurrentTextSize != newTextSize) {
                    updateDrawText = true;
                } else {
                    updateDrawText = false;
                }
                this.mCurrentTextSize = newTextSize;
            }
            if (this.mTextToDraw == null || updateDrawText) {
                this.mTextPaint.setTextSize(this.mCurrentTextSize);
                CharSequence title = TextUtils.ellipsize(this.mText, this.mTextPaint, availableWidth, TextUtils.TruncateAt.END);
                if (this.mTextToDraw == null || !this.mTextToDraw.equals(title)) {
                    this.mTextToDraw = title;
                }
                this.mTextWidth = this.mTextPaint.measureText(this.mTextToDraw, 0, this.mTextToDraw.length());
            }
            if (!USE_SCALING_TEXTURE || this.mScale == 1.0f) {
                z = false;
            }
            this.mUseTexture = z;
            if (this.mUseTexture) {
                ensureExpandedTexture();
            }
            ViewCompat.postInvalidateOnAnimation(this.mView);
        }
    }

    private void ensureExpandedTexture() {
        if (this.mExpandedTitleTexture == null && !this.mExpandedBounds.isEmpty() && !TextUtils.isEmpty(this.mTextToDraw)) {
            this.mTextPaint.setTextSize(this.mExpandedTextSize);
            this.mTextPaint.setColor(this.mExpandedTextColor);
            int w = Math.round(this.mTextPaint.measureText(this.mTextToDraw, 0, this.mTextToDraw.length()));
            int h = Math.round(this.mTextPaint.descent() - this.mTextPaint.ascent());
            this.mTextWidth = (float) w;
            if (w > 0 || h > 0) {
                this.mExpandedTitleTexture = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
                new Canvas(this.mExpandedTitleTexture).drawText(this.mTextToDraw, 0, this.mTextToDraw.length(), 0.0f, ((float) h) - this.mTextPaint.descent(), this.mTextPaint);
                if (this.mTexturePaint == null) {
                    this.mTexturePaint = new Paint();
                    this.mTexturePaint.setAntiAlias(true);
                    this.mTexturePaint.setFilterBitmap(true);
                }
            }
        }
    }

    private void recalculate() {
        if (ViewCompat.isLaidOut(this.mView)) {
            calculateBaselines();
            calculateOffsets();
        }
    }

    /* access modifiers changed from: package-private */
    public void setText(CharSequence text) {
        if (text == null || !text.equals(this.mText)) {
            this.mText = text;
            clearTexture();
            recalculate();
        }
    }

    /* access modifiers changed from: package-private */
    public CharSequence getText() {
        return this.mText;
    }

    private void clearTexture() {
        if (this.mExpandedTitleTexture != null) {
            this.mExpandedTitleTexture.recycle();
            this.mExpandedTitleTexture = null;
        }
    }

    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        recalculate();
    }

    private static boolean isClose(float value, float targetValue) {
        return Math.abs(value - targetValue) < 0.001f;
    }

    /* access modifiers changed from: package-private */
    public int getExpandedTextColor() {
        return this.mExpandedTextColor;
    }

    /* access modifiers changed from: package-private */
    public int getCollapsedTextColor() {
        return this.mCollapsedTextColor;
    }

    private static int blendColors(int color1, int color2, float ratio) {
        float inverseRatio = 1.0f - ratio;
        return Color.argb((int) ((((float) Color.alpha(color1)) * inverseRatio) + (((float) Color.alpha(color2)) * ratio)), (int) ((((float) Color.red(color1)) * inverseRatio) + (((float) Color.red(color2)) * ratio)), (int) ((((float) Color.green(color1)) * inverseRatio) + (((float) Color.green(color2)) * ratio)), (int) ((((float) Color.blue(color1)) * inverseRatio) + (((float) Color.blue(color2)) * ratio)));
    }

    private static float interpolate(float startValue, float endValue, float fraction, Interpolator interpolator) {
        if (interpolator != null) {
            fraction = interpolator.getInterpolation(fraction);
        }
        return AnimationUtils.lerp(startValue, endValue, fraction);
    }
}
