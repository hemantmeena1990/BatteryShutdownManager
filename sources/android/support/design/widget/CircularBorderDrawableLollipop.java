package android.support.design.widget;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;

class CircularBorderDrawableLollipop extends CircularBorderDrawable {
    private ColorStateList mTint;
    private PorterDuffColorFilter mTintFilter;
    private PorterDuff.Mode mTintMode = PorterDuff.Mode.SRC_IN;

    CircularBorderDrawableLollipop() {
    }

    public void draw(Canvas canvas) {
        boolean clearColorFilter;
        if (this.mTintFilter == null || this.mPaint.getColorFilter() != null) {
            clearColorFilter = false;
        } else {
            this.mPaint.setColorFilter(this.mTintFilter);
            clearColorFilter = true;
        }
        super.draw(canvas);
        if (clearColorFilter) {
            this.mPaint.setColorFilter((ColorFilter) null);
        }
    }

    public void setTintList(ColorStateList tint) {
        this.mTint = tint;
        this.mTintFilter = updateTintFilter(tint, this.mTintMode);
        invalidateSelf();
    }

    public void setTintMode(PorterDuff.Mode tintMode) {
        this.mTintMode = tintMode;
        this.mTintFilter = updateTintFilter(this.mTint, tintMode);
        invalidateSelf();
    }

    private PorterDuffColorFilter updateTintFilter(ColorStateList tint, PorterDuff.Mode tintMode) {
        if (tint == null || tintMode == null) {
            return null;
        }
        return new PorterDuffColorFilter(tint.getColorForState(getState(), 0), tintMode);
    }
}
