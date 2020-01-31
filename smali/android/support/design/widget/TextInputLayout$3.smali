.class Landroid/support/design/widget/TextInputLayout$3;
.super Ljava/lang/Object;
.source "TextInputLayout.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/TextInputLayout;->setEditText(Landroid/widget/EditText;Landroid/view/ViewGroup$LayoutParams;)Landroid/widget/LinearLayout$LayoutParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/widget/TextInputLayout;


# direct methods
.method constructor <init>(Landroid/support/design/widget/TextInputLayout;)V
    .locals 0

    .prologue
    .line 175
    iput-object p1, p0, Landroid/support/design/widget/TextInputLayout$3;->this$0:Landroid/support/design/widget/TextInputLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "focused"    # Z

    .prologue
    .line 178
    iget-object v0, p0, Landroid/support/design/widget/TextInputLayout$3;->this$0:Landroid/support/design/widget/TextInputLayout;

    invoke-static {v0}, Landroid/support/design/widget/TextInputLayout;->access$200(Landroid/support/design/widget/TextInputLayout;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 179
    return-void
.end method
