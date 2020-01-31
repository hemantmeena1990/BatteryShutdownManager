package android.support.design.widget;

import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.support.design.R;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.view.View;

abstract class FloatingActionButtonImpl {
    static final int[] EMPTY_STATE_SET = new int[0];
    static final int[] FOCUSED_ENABLED_STATE_SET = {16842908, 16842910};
    static final int[] PRESSED_ENABLED_STATE_SET = {16842919, 16842910};
    final ShadowViewDelegate mShadowViewDelegate;
    final View mView;

    /* access modifiers changed from: package-private */
    public abstract void jumpDrawableToCurrentState();

    /* access modifiers changed from: package-private */
    public abstract void onDrawableStateChanged(int[] iArr);

    /* access modifiers changed from: package-private */
    public abstract void setBackgroundDrawable(Drawable drawable, ColorStateList colorStateList, PorterDuff.Mode mode, int i, int i2);

    /* access modifiers changed from: package-private */
    public abstract void setBackgroundTintList(ColorStateList colorStateList);

    /* access modifiers changed from: package-private */
    public abstract void setBackgroundTintMode(PorterDuff.Mode mode);

    /* access modifiers changed from: package-private */
    public abstract void setElevation(float f);

    /* access modifiers changed from: package-private */
    public abstract void setPressedTranslationZ(float f);

    /* access modifiers changed from: package-private */
    public abstract void setRippleColor(int i);

    FloatingActionButtonImpl(View view, ShadowViewDelegate shadowViewDelegate) {
        this.mView = view;
        this.mShadowViewDelegate = shadowViewDelegate;
    }

    /* access modifiers changed from: package-private */
    public Drawable createBorderDrawable(int borderWidth, ColorStateList backgroundTint) {
        Resources resources = this.mView.getResources();
        CircularBorderDrawable borderDrawable = newCircularDrawable();
        borderDrawable.setGradientColors(resources.getColor(R.color.fab_stroke_top_outer_color), resources.getColor(R.color.fab_stroke_top_inner_color), resources.getColor(R.color.fab_stroke_end_inner_color), resources.getColor(R.color.fab_stroke_end_outer_color));
        borderDrawable.setBorderWidth((float) borderWidth);
        Drawable d = DrawableCompat.wrap(borderDrawable);
        DrawableCompat.setTintList(d, backgroundTint);
        DrawableCompat.setTintMode(d, PorterDuff.Mode.DST_OVER);
        return d;
    }

    /* access modifiers changed from: package-private */
    public CircularBorderDrawable newCircularDrawable() {
        return new CircularBorderDrawable();
    }
}
