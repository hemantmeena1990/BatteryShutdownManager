.class Landroid/support/design/widget/TabLayout$TabView;
.super Landroid/widget/LinearLayout;
.source "TabLayout.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "TabView"
.end annotation


# instance fields
.field private mCustomView:Landroid/view/View;

.field private mIconView:Landroid/widget/ImageView;

.field private final mTab:Landroid/support/design/widget/TabLayout$Tab;

.field private mTextView:Landroid/widget/TextView;

.field final synthetic this$0:Landroid/support/design/widget/TabLayout;


# direct methods
.method public constructor <init>(Landroid/support/design/widget/TabLayout;Landroid/content/Context;Landroid/support/design/widget/TabLayout$Tab;)V
    .locals 4
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "tab"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 1037
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    .line 1038
    invoke-direct {p0, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 1039
    iput-object p3, p0, Landroid/support/design/widget/TabLayout$TabView;->mTab:Landroid/support/design/widget/TabLayout$Tab;

    .line 1040
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$200(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 1041
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$200(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    invoke-static {p2, v0}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$TabView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1043
    :cond_0
    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$300(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$400(Landroid/support/design/widget/TabLayout;)I

    move-result v1

    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$500(Landroid/support/design/widget/TabLayout;)I

    move-result v2

    invoke-static {p1}, Landroid/support/design/widget/TabLayout;->access$600(Landroid/support/design/widget/TabLayout;)I

    move-result v3

    invoke-static {p0, v0, v1, v2, v3}, Landroid/support/v4/view/ViewCompat;->setPaddingRelative(Landroid/view/View;IIII)V

    .line 1045
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$TabView;->setGravity(I)V

    .line 1046
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->update()V

    .line 1047
    return-void
.end method


# virtual methods
.method public getTab()Landroid/support/design/widget/TabLayout$Tab;
    .locals 1

    .prologue
    .line 1197
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$TabView;->mTab:Landroid/support/design/widget/TabLayout$Tab;

    return-object v0
.end method

.method public onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 1
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 1068
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 1070
    const-class v0, Landroid/support/v7/app/ActionBar$Tab;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 1071
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 1076
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 1078
    const-class v0, Landroid/support/v7/app/ActionBar$Tab;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setClassName(Ljava/lang/CharSequence;)V

    .line 1079
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v7, 0x0

    .line 1178
    const/4 v6, 0x2

    new-array v3, v6, [I

    .line 1179
    .local v3, "screenPos":[I
    invoke-virtual {p0, v3}, Landroid/support/design/widget/TabLayout$TabView;->getLocationOnScreen([I)V

    .line 1181
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 1182
    .local v1, "context":Landroid/content/Context;
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getWidth()I

    move-result v5

    .line 1183
    .local v5, "width":I
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getHeight()I

    move-result v2

    .line 1184
    .local v2, "height":I
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v6

    iget v4, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 1186
    .local v4, "screenWidth":I
    iget-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->mTab:Landroid/support/design/widget/TabLayout$Tab;

    invoke-virtual {v6}, Landroid/support/design/widget/TabLayout$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-static {v1, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 1189
    .local v0, "cheatSheet":Landroid/widget/Toast;
    const/16 v6, 0x31

    aget v7, v3, v7

    div-int/lit8 v8, v5, 0x2

    add-int/2addr v7, v8

    div-int/lit8 v8, v4, 0x2

    sub-int/2addr v7, v8

    invoke-virtual {v0, v6, v7, v2}, Landroid/widget/Toast;->setGravity(III)V

    .line 1192
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1193
    const/4 v6, 0x1

    return v6
.end method

.method public onMeasure(II)V
    .locals 3
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 1083
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 1085
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v0}, Landroid/support/design/widget/TabLayout;->access$700(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getMeasuredWidth()I

    move-result v0

    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v1}, Landroid/support/design/widget/TabLayout;->access$700(Landroid/support/design/widget/TabLayout;)I

    move-result v1

    if-le v0, v1, :cond_1

    .line 1087
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v0}, Landroid/support/design/widget/TabLayout;->access$700(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-super {p0, v0, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    .line 1094
    :cond_0
    :goto_0
    return-void

    .line 1089
    :cond_1
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v0}, Landroid/support/design/widget/TabLayout;->access$800(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getMeasuredHeight()I

    move-result v0

    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v1}, Landroid/support/design/widget/TabLayout;->access$800(Landroid/support/design/widget/TabLayout;)I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 1091
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v0}, Landroid/support/design/widget/TabLayout;->access$800(Landroid/support/design/widget/TabLayout;)I

    move-result v0

    invoke-static {v0, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-super {p0, v0, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    goto :goto_0
.end method

.method public setSelected(Z)V
    .locals 2
    .param p1, "selected"    # Z

    .prologue
    .line 1051
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->isSelected()Z

    move-result v1

    if-eq v1, p1, :cond_2

    const/4 v0, 0x1

    .line 1052
    .local v0, "changed":Z
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->setSelected(Z)V

    .line 1053
    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    .line 1054
    const/4 v1, 0x4

    invoke-virtual {p0, v1}, Landroid/support/design/widget/TabLayout$TabView;->sendAccessibilityEvent(I)V

    .line 1056
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 1057
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 1059
    :cond_0
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v1, :cond_1

    .line 1060
    iget-object v1, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 1063
    :cond_1
    return-void

    .line 1051
    .end local v0    # "changed":Z
    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method final update()V
    .locals 14

    .prologue
    const/16 v11, 0x8

    const/4 v13, -0x2

    const/4 v12, 0x0

    const/4 v9, 0x0

    .line 1097
    iget-object v6, p0, Landroid/support/design/widget/TabLayout$TabView;->mTab:Landroid/support/design/widget/TabLayout$Tab;

    .line 1098
    .local v6, "tab":Landroid/support/design/widget/TabLayout$Tab;
    invoke-virtual {v6}, Landroid/support/design/widget/TabLayout$Tab;->getCustomView()Landroid/view/View;

    move-result-object v0

    .line 1099
    .local v0, "custom":Landroid/view/View;
    if-eqz v0, :cond_4

    .line 1100
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    .line 1101
    .local v1, "customParent":Landroid/view/ViewParent;
    if-eq v1, p0, :cond_1

    .line 1102
    if-eqz v1, :cond_0

    .line 1103
    check-cast v1, Landroid/view/ViewGroup;

    .end local v1    # "customParent":Landroid/view/ViewParent;
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 1105
    :cond_0
    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$TabView;->addView(Landroid/view/View;)V

    .line 1107
    :cond_1
    iput-object v0, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    .line 1108
    iget-object v9, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v9, :cond_2

    .line 1109
    iget-object v9, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1111
    :cond_2
    iget-object v9, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v9, :cond_3

    .line 1112
    iget-object v9, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v9, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1113
    iget-object v9, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v9, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1174
    :cond_3
    :goto_0
    return-void

    .line 1116
    :cond_4
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    if-eqz v10, :cond_5

    .line 1117
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    invoke-virtual {p0, v10}, Landroid/support/design/widget/TabLayout$TabView;->removeView(Landroid/view/View;)V

    .line 1118
    iput-object v12, p0, Landroid/support/design/widget/TabLayout$TabView;->mCustomView:Landroid/view/View;

    .line 1121
    :cond_5
    invoke-virtual {v6}, Landroid/support/design/widget/TabLayout$Tab;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 1122
    .local v3, "icon":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v6}, Landroid/support/design/widget/TabLayout$Tab;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    .line 1124
    .local v7, "text":Ljava/lang/CharSequence;
    if-eqz v3, :cond_c

    .line 1125
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-nez v10, :cond_6

    .line 1126
    new-instance v4, Landroid/widget/ImageView;

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v4, v10}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 1127
    .local v4, "iconView":Landroid/widget/ImageView;
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v5, v13, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1129
    .local v5, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v10, 0x10

    iput v10, v5, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 1130
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1131
    invoke-virtual {p0, v4, v9}, Landroid/support/design/widget/TabLayout$TabView;->addView(Landroid/view/View;I)V

    .line 1132
    iput-object v4, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    .line 1134
    .end local v4    # "iconView":Landroid/widget/ImageView;
    .end local v5    # "lp":Landroid/widget/LinearLayout$LayoutParams;
    :cond_6
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v10, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1135
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v10, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1141
    :cond_7
    :goto_1
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_d

    const/4 v2, 0x1

    .line 1142
    .local v2, "hasText":Z
    :goto_2
    if-eqz v2, :cond_e

    .line 1143
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-nez v10, :cond_9

    .line 1144
    new-instance v8, Landroid/support/v7/widget/AppCompatTextView;

    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-direct {v8, v10}, Landroid/support/v7/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    .line 1145
    .local v8, "textView":Landroid/support/v7/widget/AppCompatTextView;
    invoke-virtual {p0}, Landroid/support/design/widget/TabLayout$TabView;->getContext()Landroid/content/Context;

    move-result-object v10

    iget-object v11, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v11}, Landroid/support/design/widget/TabLayout;->access$900(Landroid/support/design/widget/TabLayout;)I

    move-result v11

    invoke-virtual {v8, v10, v11}, Landroid/support/v7/widget/AppCompatTextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 1146
    const/4 v10, 0x2

    invoke-virtual {v8, v10}, Landroid/support/v7/widget/AppCompatTextView;->setMaxLines(I)V

    .line 1147
    sget-object v10, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v8, v10}, Landroid/support/v7/widget/AppCompatTextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 1148
    const/16 v10, 0x11

    invoke-virtual {v8, v10}, Landroid/support/v7/widget/AppCompatTextView;->setGravity(I)V

    .line 1149
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v10}, Landroid/support/design/widget/TabLayout;->access$1000(Landroid/support/design/widget/TabLayout;)Landroid/content/res/ColorStateList;

    move-result-object v10

    if-eqz v10, :cond_8

    .line 1150
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->this$0:Landroid/support/design/widget/TabLayout;

    invoke-static {v10}, Landroid/support/design/widget/TabLayout;->access$1000(Landroid/support/design/widget/TabLayout;)Landroid/content/res/ColorStateList;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/support/v7/widget/AppCompatTextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 1152
    :cond_8
    invoke-virtual {p0, v8, v13, v13}, Landroid/support/design/widget/TabLayout$TabView;->addView(Landroid/view/View;II)V

    .line 1153
    iput-object v8, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    .line 1155
    .end local v8    # "textView":Landroid/support/v7/widget/AppCompatTextView;
    :cond_9
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1156
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v6}, Landroid/support/design/widget/TabLayout$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1157
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1163
    :cond_a
    :goto_3
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v10, :cond_b

    .line 1164
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v6}, Landroid/support/design/widget/TabLayout$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v11

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1167
    :cond_b
    if-nez v2, :cond_f

    invoke-virtual {v6}, Landroid/support/design/widget/TabLayout$Tab;->getContentDescription()Ljava/lang/CharSequence;

    move-result-object v10

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_f

    .line 1168
    invoke-virtual {p0, p0}, Landroid/support/design/widget/TabLayout$TabView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    goto/16 :goto_0

    .line 1136
    .end local v2    # "hasText":Z
    :cond_c
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    if-eqz v10, :cond_7

    .line 1137
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v10, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1138
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mIconView:Landroid/widget/ImageView;

    invoke-virtual {v10, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto/16 :goto_1

    :cond_d
    move v2, v9

    .line 1141
    goto/16 :goto_2

    .line 1158
    .restart local v2    # "hasText":Z
    :cond_e
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    if-eqz v10, :cond_a

    .line 1159
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1160
    iget-object v10, p0, Landroid/support/design/widget/TabLayout$TabView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v10, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_3

    .line 1170
    :cond_f
    invoke-virtual {p0, v12}, Landroid/support/design/widget/TabLayout$TabView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 1171
    invoke-virtual {p0, v9}, Landroid/support/design/widget/TabLayout$TabView;->setLongClickable(Z)V

    goto/16 :goto_0
.end method
