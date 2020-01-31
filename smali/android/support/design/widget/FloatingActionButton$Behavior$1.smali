.class Landroid/support/design/widget/FloatingActionButton$Behavior$1;
.super Ljava/lang/Object;
.source "FloatingActionButton.java"

# interfaces
.implements Landroid/support/v4/view/ViewPropertyAnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/FloatingActionButton$Behavior;->animateOut(Landroid/support/design/widget/FloatingActionButton;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/design/widget/FloatingActionButton$Behavior;


# direct methods
.method constructor <init>(Landroid/support/design/widget/FloatingActionButton$Behavior;)V
    .locals 0

    .prologue
    .line 409
    iput-object p1, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$1;->this$0:Landroid/support/design/widget/FloatingActionButton$Behavior;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 417
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$1;->this$0:Landroid/support/design/widget/FloatingActionButton$Behavior;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/design/widget/FloatingActionButton$Behavior;->access$302(Landroid/support/design/widget/FloatingActionButton$Behavior;Z)Z

    .line 418
    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 422
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$1;->this$0:Landroid/support/design/widget/FloatingActionButton$Behavior;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/design/widget/FloatingActionButton$Behavior;->access$302(Landroid/support/design/widget/FloatingActionButton$Behavior;Z)Z

    .line 423
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 424
    return-void
.end method

.method public onAnimationStart(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 412
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$1;->this$0:Landroid/support/design/widget/FloatingActionButton$Behavior;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/support/design/widget/FloatingActionButton$Behavior;->access$302(Landroid/support/design/widget/FloatingActionButton$Behavior;Z)Z

    .line 413
    return-void
.end method
