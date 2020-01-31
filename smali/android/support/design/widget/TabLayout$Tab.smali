.class public final Landroid/support/design/widget/TabLayout$Tab;
.super Ljava/lang/Object;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/design/widget/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Tab"
.end annotation


# static fields
.field public static final INVALID_POSITION:I = -0x1


# instance fields
.field private mContentDesc:Ljava/lang/CharSequence;

.field private mCustomView:Landroid/view/View;

.field private mIcon:Landroid/graphics/drawable/Drawable;

.field private final mParent:Landroid/support/design/widget/TabLayout;

.field private mPosition:I

.field private mTag:Ljava/lang/Object;

.field private mText:Ljava/lang/CharSequence;


# direct methods
.method constructor <init>(Landroid/support/design/widget/TabLayout;)V
    .locals 1
    .param p1, "parent"    # Landroid/support/design/widget/TabLayout;

    .prologue
    .line 847
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 842
    const/4 v0, -0x1

    iput v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    .line 848
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    .line 849
    return-void
.end method

.method static synthetic access$000(Landroid/support/design/widget/TabLayout$Tab;)Landroid/support/design/widget/TabLayout;
    .locals 1
    .param p0, "x0"    # Landroid/support/design/widget/TabLayout$Tab;

    .prologue
    .line 829
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    return-object v0
.end method


# virtual methods
.method public getContentDescription()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 1027
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mContentDesc:Ljava/lang/CharSequence;

    return-object v0
.end method

.method getCustomView()Landroid/view/View;
    .locals 1

    .prologue
    .line 870
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mCustomView:Landroid/view/View;

    return-object v0
.end method

.method public getIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .prologue
    .line 906
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 916
    iget v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    return v0
.end method

.method public getTag()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 855
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mTag:Ljava/lang/Object;

    return-object v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 929
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public select()V
    .locals 1

    .prologue
    .line 986
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0, p0}, Landroid/support/design/widget/TabLayout;->selectTab(Landroid/support/design/widget/TabLayout$Tab;)V

    .line 987
    return-void
.end method

.method public setContentDescription(I)Landroid/support/design/widget/TabLayout$Tab;
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 999
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$Tab;->setContentDescription(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setContentDescription(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;
    .locals 2
    .param p1, "contentDesc"    # Ljava/lang/CharSequence;

    .prologue
    .line 1012
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mContentDesc:Ljava/lang/CharSequence;

    .line 1013
    iget v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    if-ltz v0, :cond_0

    .line 1014
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    iget v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    invoke-static {v0, v1}, Landroid/support/design/widget/TabLayout;->access$100(Landroid/support/design/widget/TabLayout;I)V

    .line 1016
    :cond_0
    return-object p0
.end method

.method public setCustomView(I)Landroid/support/design/widget/TabLayout$Tab;
    .locals 2
    .param p1, "layoutResId"    # I

    .prologue
    .line 896
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$Tab;->setCustomView(Landroid/view/View;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setCustomView(Landroid/view/View;)Landroid/support/design/widget/TabLayout$Tab;
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 881
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mCustomView:Landroid/view/View;

    .line 882
    iget v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    if-ltz v0, :cond_0

    .line 883
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    iget v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    invoke-static {v0, v1}, Landroid/support/design/widget/TabLayout;->access$100(Landroid/support/design/widget/TabLayout;I)V

    .line 885
    :cond_0
    return-object p0
.end method

.method public setIcon(I)Landroid/support/design/widget/TabLayout$Tab;
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 953
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/support/v7/internal/widget/TintManager;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$Tab;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/support/design/widget/TabLayout$Tab;
    .locals 2
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 939
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 940
    iget v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    if-ltz v0, :cond_0

    .line 941
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    iget v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    invoke-static {v0, v1}, Landroid/support/design/widget/TabLayout;->access$100(Landroid/support/design/widget/TabLayout;I)V

    .line 943
    :cond_0
    return-object p0
.end method

.method setPosition(I)V
    .locals 0
    .param p1, "position"    # I

    .prologue
    .line 920
    iput p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    .line 921
    return-void
.end method

.method public setTag(Ljava/lang/Object;)Landroid/support/design/widget/TabLayout$Tab;
    .locals 0
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 865
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mTag:Ljava/lang/Object;

    .line 866
    return-object p0
.end method

.method public setText(I)Landroid/support/design/widget/TabLayout$Tab;
    .locals 1
    .param p1, "resId"    # I

    .prologue
    .line 979
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    invoke-virtual {v0}, Landroid/support/design/widget/TabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/design/widget/TabLayout$Tab;->setText(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;

    move-result-object v0

    return-object v0
.end method

.method public setText(Ljava/lang/CharSequence;)Landroid/support/design/widget/TabLayout$Tab;
    .locals 2
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 964
    iput-object p1, p0, Landroid/support/design/widget/TabLayout$Tab;->mText:Ljava/lang/CharSequence;

    .line 965
    iget v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    if-ltz v0, :cond_0

    .line 966
    iget-object v0, p0, Landroid/support/design/widget/TabLayout$Tab;->mParent:Landroid/support/design/widget/TabLayout;

    iget v1, p0, Landroid/support/design/widget/TabLayout$Tab;->mPosition:I

    invoke-static {v0, v1}, Landroid/support/design/widget/TabLayout;->access$100(Landroid/support/design/widget/TabLayout;I)V

    .line 968
    :cond_0
    return-object p0
.end method
