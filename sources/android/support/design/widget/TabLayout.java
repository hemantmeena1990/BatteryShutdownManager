package android.support.design.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.support.design.R;
import android.support.design.widget.ValueAnimatorCompat;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.ViewPager;
import android.support.v7.app.ActionBar;
import android.support.v7.internal.widget.TintManager;
import android.support.v7.widget.AppCompatTextView;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.Animation;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Iterator;

public class TabLayout extends HorizontalScrollView {
    private static final int ANIMATION_DURATION = 300;
    private static final int DEFAULT_HEIGHT = 48;
    private static final int FIXED_WRAP_GUTTER_MIN = 16;
    public static final int GRAVITY_CENTER = 1;
    public static final int GRAVITY_FILL = 0;
    private static final int MAX_TAB_TEXT_LINES = 2;
    public static final int MODE_FIXED = 1;
    public static final int MODE_SCROLLABLE = 0;
    private static final int MOTION_NON_ADJACENT_OFFSET = 24;
    private static final int TAB_MIN_WIDTH_MARGIN = 56;
    private int mContentInsetStart;
    /* access modifiers changed from: private */
    public int mMode;
    private OnTabSelectedListener mOnTabSelectedListener;
    private final int mRequestedTabMaxWidth;
    private Tab mSelectedTab;
    /* access modifiers changed from: private */
    public final int mTabBackgroundResId;
    private View.OnClickListener mTabClickListener;
    /* access modifiers changed from: private */
    public int mTabGravity;
    /* access modifiers changed from: private */
    public int mTabMaxWidth;
    /* access modifiers changed from: private */
    public final int mTabMinWidth;
    /* access modifiers changed from: private */
    public int mTabPaddingBottom;
    /* access modifiers changed from: private */
    public int mTabPaddingEnd;
    /* access modifiers changed from: private */
    public int mTabPaddingStart;
    /* access modifiers changed from: private */
    public int mTabPaddingTop;
    private final SlidingTabStrip mTabStrip;
    /* access modifiers changed from: private */
    public int mTabTextAppearance;
    /* access modifiers changed from: private */
    public ColorStateList mTabTextColors;
    private final ArrayList<Tab> mTabs;

    @Retention(RetentionPolicy.SOURCE)
    public @interface Mode {
    }

    public interface OnTabSelectedListener {
        void onTabReselected(Tab tab);

        void onTabSelected(Tab tab);

        void onTabUnselected(Tab tab);
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface TabGravity {
    }

    public TabLayout(Context context) {
        this(context, (AttributeSet) null);
    }

    public TabLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public TabLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mTabs = new ArrayList<>();
        setHorizontalScrollBarEnabled(false);
        setFillViewport(true);
        this.mTabStrip = new SlidingTabStrip(context);
        addView(this.mTabStrip, -2, -1);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.TabLayout, defStyleAttr, R.style.Widget_Design_TabLayout);
        this.mTabStrip.setSelectedIndicatorHeight(a.getDimensionPixelSize(R.styleable.TabLayout_tabIndicatorHeight, 0));
        this.mTabStrip.setSelectedIndicatorColor(a.getColor(R.styleable.TabLayout_tabIndicatorColor, 0));
        this.mTabTextAppearance = a.getResourceId(R.styleable.TabLayout_tabTextAppearance, R.style.TextAppearance_Design_Tab);
        int dimensionPixelSize = a.getDimensionPixelSize(R.styleable.TabLayout_tabPadding, 0);
        this.mTabPaddingBottom = dimensionPixelSize;
        this.mTabPaddingEnd = dimensionPixelSize;
        this.mTabPaddingTop = dimensionPixelSize;
        this.mTabPaddingStart = dimensionPixelSize;
        this.mTabPaddingStart = a.getDimensionPixelSize(R.styleable.TabLayout_tabPaddingStart, this.mTabPaddingStart);
        this.mTabPaddingTop = a.getDimensionPixelSize(R.styleable.TabLayout_tabPaddingTop, this.mTabPaddingTop);
        this.mTabPaddingEnd = a.getDimensionPixelSize(R.styleable.TabLayout_tabPaddingEnd, this.mTabPaddingEnd);
        this.mTabPaddingBottom = a.getDimensionPixelSize(R.styleable.TabLayout_tabPaddingBottom, this.mTabPaddingBottom);
        this.mTabTextColors = loadTextColorFromTextAppearance(this.mTabTextAppearance);
        if (a.hasValue(R.styleable.TabLayout_tabTextColor)) {
            this.mTabTextColors = a.getColorStateList(R.styleable.TabLayout_tabTextColor);
        }
        if (a.hasValue(R.styleable.TabLayout_tabSelectedTextColor)) {
            this.mTabTextColors = createColorStateList(this.mTabTextColors.getDefaultColor(), a.getColor(R.styleable.TabLayout_tabSelectedTextColor, 0));
        }
        this.mTabMinWidth = a.getDimensionPixelSize(R.styleable.TabLayout_tabMinWidth, 0);
        this.mRequestedTabMaxWidth = a.getDimensionPixelSize(R.styleable.TabLayout_tabMaxWidth, 0);
        this.mTabBackgroundResId = a.getResourceId(R.styleable.TabLayout_tabBackground, 0);
        this.mContentInsetStart = a.getDimensionPixelSize(R.styleable.TabLayout_tabContentStart, 0);
        this.mMode = a.getInt(R.styleable.TabLayout_tabMode, 1);
        this.mTabGravity = a.getInt(R.styleable.TabLayout_tabGravity, 0);
        a.recycle();
        applyModeAndGravity();
    }

    public void setScrollPosition(int position, float positionOffset, boolean updateSelectedText) {
        if (!isAnimationRunning(getAnimation()) && position >= 0 && position < this.mTabStrip.getChildCount()) {
            this.mTabStrip.setIndicatorPositionFromTabPosition(position, positionOffset);
            scrollTo(calculateScrollXForTab(position, positionOffset), 0);
            if (updateSelectedText) {
                setSelectedTabView(Math.round(((float) position) + positionOffset));
            }
        }
    }

    public void addTab(Tab tab) {
        addTab(tab, this.mTabs.isEmpty());
    }

    public void addTab(Tab tab, int position) {
        addTab(tab, position, this.mTabs.isEmpty());
    }

    public void addTab(Tab tab, boolean setSelected) {
        if (tab.mParent != this) {
            throw new IllegalArgumentException("Tab belongs to a different TabLayout.");
        }
        addTabView(tab, setSelected);
        configureTab(tab, this.mTabs.size());
        if (setSelected) {
            tab.select();
        }
    }

    public void addTab(Tab tab, int position, boolean setSelected) {
        if (tab.mParent != this) {
            throw new IllegalArgumentException("Tab belongs to a different TabLayout.");
        }
        addTabView(tab, position, setSelected);
        configureTab(tab, position);
        if (setSelected) {
            tab.select();
        }
    }

    public void setOnTabSelectedListener(OnTabSelectedListener onTabSelectedListener) {
        this.mOnTabSelectedListener = onTabSelectedListener;
    }

    public Tab newTab() {
        return new Tab(this);
    }

    public int getTabCount() {
        return this.mTabs.size();
    }

    public Tab getTabAt(int index) {
        return this.mTabs.get(index);
    }

    public void removeTab(Tab tab) {
        if (tab.mParent != this) {
            throw new IllegalArgumentException("Tab does not belong to this TabLayout.");
        }
        removeTabAt(tab.getPosition());
    }

    public void removeTabAt(int position) {
        int selectedTabPosition;
        if (this.mSelectedTab != null) {
            selectedTabPosition = this.mSelectedTab.getPosition();
        } else {
            selectedTabPosition = 0;
        }
        removeTabViewAt(position);
        Tab removedTab = this.mTabs.remove(position);
        if (removedTab != null) {
            removedTab.setPosition(-1);
        }
        int newTabCount = this.mTabs.size();
        for (int i = position; i < newTabCount; i++) {
            this.mTabs.get(i).setPosition(i);
        }
        if (selectedTabPosition == position) {
            selectTab(this.mTabs.isEmpty() ? null : this.mTabs.get(Math.max(0, position - 1)));
        }
    }

    public void removeAllTabs() {
        this.mTabStrip.removeAllViews();
        Iterator<Tab> i = this.mTabs.iterator();
        while (i.hasNext()) {
            i.next().setPosition(-1);
            i.remove();
        }
    }

    public void setTabMode(int mode) {
        if (mode != this.mMode) {
            this.mMode = mode;
            applyModeAndGravity();
        }
    }

    public int getTabMode() {
        return this.mMode;
    }

    public void setTabGravity(int gravity) {
        if (this.mTabGravity != gravity) {
            this.mTabGravity = gravity;
            applyModeAndGravity();
        }
    }

    public int getTabGravity() {
        return this.mTabGravity;
    }

    public void setTabTextColors(ColorStateList textColor) {
        if (this.mTabTextColors != textColor) {
            this.mTabTextColors = textColor;
            updateAllTabs();
        }
    }

    public ColorStateList getTabTextColors() {
        return this.mTabTextColors;
    }

    public void setTabTextColors(int normalColor, int selectedColor) {
        setTabTextColors(createColorStateList(normalColor, selectedColor));
    }

    public void setupWithViewPager(ViewPager viewPager) {
        PagerAdapter adapter = viewPager.getAdapter();
        if (adapter == null) {
            throw new IllegalArgumentException("ViewPager does not have a PagerAdapter set");
        }
        setTabsFromPagerAdapter(adapter);
        viewPager.addOnPageChangeListener(new TabLayoutOnPageChangeListener(this));
        setOnTabSelectedListener(new ViewPagerOnTabSelectedListener(viewPager));
    }

    public void setTabsFromPagerAdapter(PagerAdapter adapter) {
        removeAllTabs();
        int count = adapter.getCount();
        for (int i = 0; i < count; i++) {
            addTab(newTab().setText(adapter.getPageTitle(i)));
        }
    }

    private void updateAllTabs() {
        int z = this.mTabStrip.getChildCount();
        for (int i = 0; i < z; i++) {
            updateTab(i);
        }
    }

    private TabView createTabView(Tab tab) {
        TabView tabView = new TabView(getContext(), tab);
        tabView.setFocusable(true);
        if (this.mTabClickListener == null) {
            this.mTabClickListener = new View.OnClickListener() {
                public void onClick(View view) {
                    ((TabView) view).getTab().select();
                }
            };
        }
        tabView.setOnClickListener(this.mTabClickListener);
        return tabView;
    }

    private void configureTab(Tab tab, int position) {
        tab.setPosition(position);
        this.mTabs.add(position, tab);
        int count = this.mTabs.size();
        for (int i = position + 1; i < count; i++) {
            this.mTabs.get(i).setPosition(i);
        }
    }

    /* access modifiers changed from: private */
    public void updateTab(int position) {
        TabView view = (TabView) this.mTabStrip.getChildAt(position);
        if (view != null) {
            view.update();
        }
    }

    private void addTabView(Tab tab, boolean setSelected) {
        TabView tabView = createTabView(tab);
        this.mTabStrip.addView(tabView, createLayoutParamsForTabs());
        if (setSelected) {
            tabView.setSelected(true);
        }
    }

    private void addTabView(Tab tab, int position, boolean setSelected) {
        TabView tabView = createTabView(tab);
        this.mTabStrip.addView(tabView, position, createLayoutParamsForTabs());
        if (setSelected) {
            tabView.setSelected(true);
        }
    }

    private LinearLayout.LayoutParams createLayoutParamsForTabs() {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -1);
        updateTabViewLayoutParams(lp);
        return lp;
    }

    private void updateTabViewLayoutParams(LinearLayout.LayoutParams lp) {
        if (this.mMode == 1 && this.mTabGravity == 0) {
            lp.width = 0;
            lp.weight = 1.0f;
            return;
        }
        lp.width = -2;
        lp.weight = 0.0f;
    }

    /* access modifiers changed from: private */
    public int dpToPx(int dps) {
        return Math.round(getResources().getDisplayMetrics().density * ((float) dps));
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        switch (View.MeasureSpec.getMode(heightMeasureSpec)) {
            case Integer.MIN_VALUE:
                heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(Math.min(dpToPx(48), View.MeasureSpec.getSize(heightMeasureSpec)), 1073741824);
                break;
            case 0:
                heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(dpToPx(48), 1073741824);
                break;
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (this.mMode == 1 && getChildCount() == 1) {
            View child = getChildAt(0);
            int width = getMeasuredWidth();
            if (child.getMeasuredWidth() > width) {
                child.measure(View.MeasureSpec.makeMeasureSpec(width, 1073741824), getChildMeasureSpec(heightMeasureSpec, getPaddingTop() + getPaddingBottom(), child.getLayoutParams().height));
            }
        }
        int maxTabWidth = this.mRequestedTabMaxWidth;
        int defaultTabMaxWidth = getMeasuredWidth() - dpToPx(56);
        if (maxTabWidth == 0 || maxTabWidth > defaultTabMaxWidth) {
            maxTabWidth = defaultTabMaxWidth;
        }
        this.mTabMaxWidth = maxTabWidth;
    }

    private void removeTabViewAt(int position) {
        this.mTabStrip.removeViewAt(position);
        requestLayout();
    }

    private void animateToTab(int newPosition) {
        clearAnimation();
        if (newPosition != -1) {
            if (getWindowToken() == null || !ViewCompat.isLaidOut(this)) {
                setScrollPosition(newPosition, 0.0f, true);
                return;
            }
            int startScrollX = getScrollX();
            int targetScrollX = calculateScrollXForTab(newPosition, 0.0f);
            if (startScrollX != targetScrollX) {
                ValueAnimatorCompat animator = ViewUtils.createAnimator();
                animator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
                animator.setDuration(ANIMATION_DURATION);
                animator.setIntValues(startScrollX, targetScrollX);
                animator.setUpdateListener(new ValueAnimatorCompat.AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimatorCompat animator) {
                        TabLayout.this.scrollTo(animator.getAnimatedIntValue(), 0);
                    }
                });
                animator.start();
            }
            this.mTabStrip.animateIndicatorToPosition(newPosition, ANIMATION_DURATION);
        }
    }

    private void setSelectedTabView(int position) {
        int tabCount = this.mTabStrip.getChildCount();
        int i = 0;
        while (i < tabCount) {
            this.mTabStrip.getChildAt(i).setSelected(i == position);
            i++;
        }
    }

    /* access modifiers changed from: private */
    public static boolean isAnimationRunning(Animation animation) {
        return animation != null && animation.hasStarted() && !animation.hasEnded();
    }

    /* access modifiers changed from: package-private */
    public void selectTab(Tab tab) {
        int newPosition;
        if (this.mSelectedTab != tab) {
            if (tab != null) {
                newPosition = tab.getPosition();
            } else {
                newPosition = -1;
            }
            setSelectedTabView(newPosition);
            if ((this.mSelectedTab == null || this.mSelectedTab.getPosition() == -1) && newPosition != -1) {
                setScrollPosition(newPosition, 0.0f, true);
            } else {
                animateToTab(newPosition);
            }
            if (!(this.mSelectedTab == null || this.mOnTabSelectedListener == null)) {
                this.mOnTabSelectedListener.onTabUnselected(this.mSelectedTab);
            }
            this.mSelectedTab = tab;
            if (this.mSelectedTab != null && this.mOnTabSelectedListener != null) {
                this.mOnTabSelectedListener.onTabSelected(this.mSelectedTab);
            }
        } else if (this.mSelectedTab != null) {
            if (this.mOnTabSelectedListener != null) {
                this.mOnTabSelectedListener.onTabReselected(this.mSelectedTab);
            }
            animateToTab(tab.getPosition());
        }
    }

    private int calculateScrollXForTab(int position, float positionOffset) {
        int selectedWidth;
        int nextWidth = 0;
        if (this.mMode != 0) {
            return 0;
        }
        View selectedChild = this.mTabStrip.getChildAt(position);
        View nextChild = position + 1 < this.mTabStrip.getChildCount() ? this.mTabStrip.getChildAt(position + 1) : null;
        if (selectedChild != null) {
            selectedWidth = selectedChild.getWidth();
        } else {
            selectedWidth = 0;
        }
        if (nextChild != null) {
            nextWidth = nextChild.getWidth();
        }
        return (int) (((((float) selectedChild.getLeft()) + ((((float) (selectedWidth + nextWidth)) * positionOffset) * 0.5f)) + (((float) selectedChild.getWidth()) * 0.5f)) - (((float) getWidth()) * 0.5f));
    }

    private void applyModeAndGravity() {
        int paddingStart = 0;
        if (this.mMode == 0) {
            paddingStart = Math.max(0, this.mContentInsetStart - this.mTabPaddingStart);
        }
        ViewCompat.setPaddingRelative(this.mTabStrip, paddingStart, 0, 0, 0);
        switch (this.mMode) {
            case 0:
                this.mTabStrip.setGravity(8388611);
                break;
            case 1:
                this.mTabStrip.setGravity(1);
                break;
        }
        updateTabViewsLayoutParams();
    }

    /* access modifiers changed from: private */
    public void updateTabViewsLayoutParams() {
        for (int i = 0; i < this.mTabStrip.getChildCount(); i++) {
            View child = this.mTabStrip.getChildAt(i);
            updateTabViewLayoutParams((LinearLayout.LayoutParams) child.getLayoutParams());
            child.requestLayout();
        }
    }

    public static final class Tab {
        public static final int INVALID_POSITION = -1;
        private CharSequence mContentDesc;
        private View mCustomView;
        private Drawable mIcon;
        /* access modifiers changed from: private */
        public final TabLayout mParent;
        private int mPosition = -1;
        private Object mTag;
        private CharSequence mText;

        Tab(TabLayout parent) {
            this.mParent = parent;
        }

        public Object getTag() {
            return this.mTag;
        }

        public Tab setTag(Object tag) {
            this.mTag = tag;
            return this;
        }

        /* access modifiers changed from: package-private */
        public View getCustomView() {
            return this.mCustomView;
        }

        public Tab setCustomView(View view) {
            this.mCustomView = view;
            if (this.mPosition >= 0) {
                this.mParent.updateTab(this.mPosition);
            }
            return this;
        }

        public Tab setCustomView(int layoutResId) {
            return setCustomView(LayoutInflater.from(this.mParent.getContext()).inflate(layoutResId, (ViewGroup) null));
        }

        public Drawable getIcon() {
            return this.mIcon;
        }

        public int getPosition() {
            return this.mPosition;
        }

        /* access modifiers changed from: package-private */
        public void setPosition(int position) {
            this.mPosition = position;
        }

        public CharSequence getText() {
            return this.mText;
        }

        public Tab setIcon(Drawable icon) {
            this.mIcon = icon;
            if (this.mPosition >= 0) {
                this.mParent.updateTab(this.mPosition);
            }
            return this;
        }

        public Tab setIcon(int resId) {
            return setIcon(TintManager.getDrawable(this.mParent.getContext(), resId));
        }

        public Tab setText(CharSequence text) {
            this.mText = text;
            if (this.mPosition >= 0) {
                this.mParent.updateTab(this.mPosition);
            }
            return this;
        }

        public Tab setText(int resId) {
            return setText(this.mParent.getResources().getText(resId));
        }

        public void select() {
            this.mParent.selectTab(this);
        }

        public Tab setContentDescription(int resId) {
            return setContentDescription(this.mParent.getResources().getText(resId));
        }

        public Tab setContentDescription(CharSequence contentDesc) {
            this.mContentDesc = contentDesc;
            if (this.mPosition >= 0) {
                this.mParent.updateTab(this.mPosition);
            }
            return this;
        }

        public CharSequence getContentDescription() {
            return this.mContentDesc;
        }
    }

    class TabView extends LinearLayout implements View.OnLongClickListener {
        private View mCustomView;
        private ImageView mIconView;
        private final Tab mTab;
        private TextView mTextView;

        public TabView(Context context, Tab tab) {
            super(context);
            this.mTab = tab;
            if (TabLayout.this.mTabBackgroundResId != 0) {
                setBackgroundDrawable(TintManager.getDrawable(context, TabLayout.this.mTabBackgroundResId));
            }
            ViewCompat.setPaddingRelative(this, TabLayout.this.mTabPaddingStart, TabLayout.this.mTabPaddingTop, TabLayout.this.mTabPaddingEnd, TabLayout.this.mTabPaddingBottom);
            setGravity(17);
            update();
        }

        public void setSelected(boolean selected) {
            boolean changed = isSelected() != selected;
            super.setSelected(selected);
            if (changed && selected) {
                sendAccessibilityEvent(4);
                if (this.mTextView != null) {
                    this.mTextView.setSelected(selected);
                }
                if (this.mIconView != null) {
                    this.mIconView.setSelected(selected);
                }
            }
        }

        @TargetApi(14)
        public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
            super.onInitializeAccessibilityEvent(event);
            event.setClassName(ActionBar.Tab.class.getName());
        }

        @TargetApi(14)
        public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
            super.onInitializeAccessibilityNodeInfo(info);
            info.setClassName(ActionBar.Tab.class.getName());
        }

        public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            if (TabLayout.this.mTabMaxWidth != 0 && getMeasuredWidth() > TabLayout.this.mTabMaxWidth) {
                super.onMeasure(View.MeasureSpec.makeMeasureSpec(TabLayout.this.mTabMaxWidth, 1073741824), heightMeasureSpec);
            } else if (TabLayout.this.mTabMinWidth > 0 && getMeasuredHeight() < TabLayout.this.mTabMinWidth) {
                super.onMeasure(View.MeasureSpec.makeMeasureSpec(TabLayout.this.mTabMinWidth, 1073741824), heightMeasureSpec);
            }
        }

        /* access modifiers changed from: package-private */
        public final void update() {
            boolean hasText;
            Tab tab = this.mTab;
            View custom = tab.getCustomView();
            if (custom != null) {
                ViewParent customParent = custom.getParent();
                if (customParent != this) {
                    if (customParent != null) {
                        ((ViewGroup) customParent).removeView(custom);
                    }
                    addView(custom);
                }
                this.mCustomView = custom;
                if (this.mTextView != null) {
                    this.mTextView.setVisibility(8);
                }
                if (this.mIconView != null) {
                    this.mIconView.setVisibility(8);
                    this.mIconView.setImageDrawable((Drawable) null);
                    return;
                }
                return;
            }
            if (this.mCustomView != null) {
                removeView(this.mCustomView);
                this.mCustomView = null;
            }
            Drawable icon = tab.getIcon();
            CharSequence text = tab.getText();
            if (icon != null) {
                if (this.mIconView == null) {
                    ImageView iconView = new ImageView(getContext());
                    LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(-2, -2);
                    lp.gravity = 16;
                    iconView.setLayoutParams(lp);
                    addView(iconView, 0);
                    this.mIconView = iconView;
                }
                this.mIconView.setImageDrawable(icon);
                this.mIconView.setVisibility(0);
            } else if (this.mIconView != null) {
                this.mIconView.setVisibility(8);
                this.mIconView.setImageDrawable((Drawable) null);
            }
            if (!TextUtils.isEmpty(text)) {
                hasText = true;
            } else {
                hasText = false;
            }
            if (hasText) {
                if (this.mTextView == null) {
                    AppCompatTextView textView = new AppCompatTextView(getContext());
                    textView.setTextAppearance(getContext(), TabLayout.this.mTabTextAppearance);
                    textView.setMaxLines(2);
                    textView.setEllipsize(TextUtils.TruncateAt.END);
                    textView.setGravity(17);
                    if (TabLayout.this.mTabTextColors != null) {
                        textView.setTextColor(TabLayout.this.mTabTextColors);
                    }
                    addView(textView, -2, -2);
                    this.mTextView = textView;
                }
                this.mTextView.setText(text);
                this.mTextView.setContentDescription(tab.getContentDescription());
                this.mTextView.setVisibility(0);
            } else if (this.mTextView != null) {
                this.mTextView.setVisibility(8);
                this.mTextView.setText((CharSequence) null);
            }
            if (this.mIconView != null) {
                this.mIconView.setContentDescription(tab.getContentDescription());
            }
            if (hasText || TextUtils.isEmpty(tab.getContentDescription())) {
                setOnLongClickListener((View.OnLongClickListener) null);
                setLongClickable(false);
                return;
            }
            setOnLongClickListener(this);
        }

        public boolean onLongClick(View v) {
            int[] screenPos = new int[2];
            getLocationOnScreen(screenPos);
            Context context = getContext();
            int width = getWidth();
            int height = getHeight();
            int screenWidth = context.getResources().getDisplayMetrics().widthPixels;
            Toast cheatSheet = Toast.makeText(context, this.mTab.getContentDescription(), 0);
            cheatSheet.setGravity(49, (screenPos[0] + (width / 2)) - (screenWidth / 2), height);
            cheatSheet.show();
            return true;
        }

        public Tab getTab() {
            return this.mTab;
        }
    }

    private class SlidingTabStrip extends LinearLayout {
        private int mIndicatorLeft = -1;
        private int mIndicatorRight = -1;
        private int mSelectedIndicatorHeight;
        private final Paint mSelectedIndicatorPaint;
        /* access modifiers changed from: private */
        public int mSelectedPosition = -1;
        /* access modifiers changed from: private */
        public float mSelectionOffset;

        SlidingTabStrip(Context context) {
            super(context);
            setWillNotDraw(false);
            this.mSelectedIndicatorPaint = new Paint();
        }

        /* access modifiers changed from: package-private */
        public void setSelectedIndicatorColor(int color) {
            this.mSelectedIndicatorPaint.setColor(color);
            ViewCompat.postInvalidateOnAnimation(this);
        }

        /* access modifiers changed from: package-private */
        public void setSelectedIndicatorHeight(int height) {
            this.mSelectedIndicatorHeight = height;
            ViewCompat.postInvalidateOnAnimation(this);
        }

        /* access modifiers changed from: package-private */
        public void setIndicatorPositionFromTabPosition(int position, float positionOffset) {
            if (!TabLayout.isAnimationRunning(getAnimation())) {
                this.mSelectedPosition = position;
                this.mSelectionOffset = positionOffset;
                updateIndicatorPosition();
            }
        }

        /* access modifiers changed from: protected */
        public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, heightMeasureSpec);
            if (View.MeasureSpec.getMode(widthMeasureSpec) == 1073741824 && TabLayout.this.mMode == 1 && TabLayout.this.mTabGravity == 1) {
                int count = getChildCount();
                int unspecifiedSpec = View.MeasureSpec.makeMeasureSpec(0, 0);
                int largestTabWidth = 0;
                int z = count;
                for (int i = 0; i < z; i++) {
                    View child = getChildAt(i);
                    child.measure(unspecifiedSpec, heightMeasureSpec);
                    largestTabWidth = Math.max(largestTabWidth, child.getMeasuredWidth());
                }
                if (largestTabWidth > 0) {
                    if (largestTabWidth * count <= getMeasuredWidth() - (TabLayout.this.dpToPx(16) * 2)) {
                        for (int i2 = 0; i2 < count; i2++) {
                            LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) getChildAt(i2).getLayoutParams();
                            lp.width = largestTabWidth;
                            lp.weight = 0.0f;
                        }
                    } else {
                        int unused = TabLayout.this.mTabGravity = 0;
                        TabLayout.this.updateTabViewsLayoutParams();
                    }
                    super.onMeasure(widthMeasureSpec, heightMeasureSpec);
                }
            }
        }

        /* access modifiers changed from: protected */
        public void onLayout(boolean changed, int l, int t, int r, int b) {
            super.onLayout(changed, l, t, r, b);
            if (!TabLayout.isAnimationRunning(getAnimation())) {
                updateIndicatorPosition();
            }
        }

        private void updateIndicatorPosition() {
            int right;
            int left;
            View selectedTitle = getChildAt(this.mSelectedPosition);
            if (selectedTitle == null || selectedTitle.getWidth() <= 0) {
                right = -1;
                left = -1;
            } else {
                left = selectedTitle.getLeft();
                right = selectedTitle.getRight();
                if (this.mSelectionOffset > 0.0f && this.mSelectedPosition < getChildCount() - 1) {
                    View nextTitle = getChildAt(this.mSelectedPosition + 1);
                    left = (int) ((this.mSelectionOffset * ((float) nextTitle.getLeft())) + ((1.0f - this.mSelectionOffset) * ((float) left)));
                    right = (int) ((this.mSelectionOffset * ((float) nextTitle.getRight())) + ((1.0f - this.mSelectionOffset) * ((float) right)));
                }
            }
            setIndicatorPosition(left, right);
        }

        /* access modifiers changed from: private */
        public void setIndicatorPosition(int left, int right) {
            if (left != this.mIndicatorLeft || right != this.mIndicatorRight) {
                this.mIndicatorLeft = left;
                this.mIndicatorRight = right;
                ViewCompat.postInvalidateOnAnimation(this);
            }
        }

        /* access modifiers changed from: package-private */
        public void animateIndicatorToPosition(final int position, int duration) {
            final int startRight;
            final int startLeft;
            boolean isRtl = ViewCompat.getLayoutDirection(this) == 1;
            View targetView = getChildAt(position);
            final int targetLeft = targetView.getLeft();
            final int targetRight = targetView.getRight();
            if (Math.abs(position - this.mSelectedPosition) <= 1) {
                startLeft = this.mIndicatorLeft;
                startRight = this.mIndicatorRight;
            } else {
                int offset = TabLayout.this.dpToPx(24);
                if (position < this.mSelectedPosition) {
                    if (isRtl) {
                        startRight = targetLeft - offset;
                        startLeft = startRight;
                    } else {
                        startRight = targetRight + offset;
                        startLeft = startRight;
                    }
                } else if (isRtl) {
                    startRight = targetRight + offset;
                    startLeft = startRight;
                } else {
                    startRight = targetLeft - offset;
                    startLeft = startRight;
                }
            }
            if (startLeft != targetLeft || startRight != targetRight) {
                ValueAnimatorCompat animator = ViewUtils.createAnimator();
                animator.setInterpolator(AnimationUtils.FAST_OUT_SLOW_IN_INTERPOLATOR);
                animator.setDuration(duration);
                animator.setFloatValues(0.0f, 1.0f);
                animator.setUpdateListener(new ValueAnimatorCompat.AnimatorUpdateListener() {
                    public void onAnimationUpdate(ValueAnimatorCompat animator) {
                        float fraction = animator.getAnimatedFraction();
                        SlidingTabStrip.this.setIndicatorPosition(AnimationUtils.lerp(startLeft, targetLeft, fraction), AnimationUtils.lerp(startRight, targetRight, fraction));
                    }
                });
                animator.setListener(new ValueAnimatorCompat.AnimatorListenerAdapter() {
                    public void onAnimationEnd(ValueAnimatorCompat animator) {
                        int unused = SlidingTabStrip.this.mSelectedPosition = position;
                        float unused2 = SlidingTabStrip.this.mSelectionOffset = 0.0f;
                    }

                    public void onAnimationCancel(ValueAnimatorCompat animator) {
                        int unused = SlidingTabStrip.this.mSelectedPosition = position;
                        float unused2 = SlidingTabStrip.this.mSelectionOffset = 0.0f;
                    }
                });
                animator.start();
            }
        }

        /* access modifiers changed from: protected */
        public void onDraw(Canvas canvas) {
            if (this.mIndicatorLeft >= 0 && this.mIndicatorRight > this.mIndicatorLeft) {
                canvas.drawRect((float) this.mIndicatorLeft, (float) (getHeight() - this.mSelectedIndicatorHeight), (float) this.mIndicatorRight, (float) getHeight(), this.mSelectedIndicatorPaint);
            }
        }
    }

    private static ColorStateList createColorStateList(int defaultColor, int selectedColor) {
        int[][] states = new int[2][];
        int[] colors = new int[2];
        states[0] = SELECTED_STATE_SET;
        colors[0] = selectedColor;
        int i = 0 + 1;
        states[i] = EMPTY_STATE_SET;
        colors[i] = defaultColor;
        int i2 = i + 1;
        return new ColorStateList(states, colors);
    }

    private ColorStateList loadTextColorFromTextAppearance(int textAppearanceResId) {
        TypedArray a = getContext().obtainStyledAttributes(textAppearanceResId, R.styleable.TextAppearance);
        try {
            return a.getColorStateList(R.styleable.TextAppearance_android_textColor);
        } finally {
            a.recycle();
        }
    }

    public static class TabLayoutOnPageChangeListener implements ViewPager.OnPageChangeListener {
        private int mScrollState;
        private final WeakReference<TabLayout> mTabLayoutRef;

        public TabLayoutOnPageChangeListener(TabLayout tabLayout) {
            this.mTabLayoutRef = new WeakReference<>(tabLayout);
        }

        public void onPageScrollStateChanged(int state) {
            this.mScrollState = state;
        }

        public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
            boolean z = true;
            TabLayout tabLayout = (TabLayout) this.mTabLayoutRef.get();
            if (tabLayout != null) {
                if (this.mScrollState != 1) {
                    z = false;
                }
                tabLayout.setScrollPosition(position, positionOffset, z);
            }
        }

        public void onPageSelected(int position) {
            TabLayout tabLayout = (TabLayout) this.mTabLayoutRef.get();
            if (tabLayout != null) {
                tabLayout.getTabAt(position).select();
            }
        }
    }

    public static class ViewPagerOnTabSelectedListener implements OnTabSelectedListener {
        private final ViewPager mViewPager;

        public ViewPagerOnTabSelectedListener(ViewPager viewPager) {
            this.mViewPager = viewPager;
        }

        public void onTabSelected(Tab tab) {
            this.mViewPager.setCurrentItem(tab.getPosition());
        }

        public void onTabUnselected(Tab tab) {
        }

        public void onTabReselected(Tab tab) {
        }
    }
}
