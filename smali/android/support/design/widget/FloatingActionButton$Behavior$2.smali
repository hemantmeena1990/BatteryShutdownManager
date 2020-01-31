.class Landroid/support/design/widget/FloatingActionButton$Behavior$2;
.super Landroid/support/design/widget/AnimationUtils$AnimationListenerAdapter;
.source "FloatingActionButton.java"


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

.field final synthetic val$button:Landroid/support/design/widget/FloatingActionButton;


# direct methods
.method constructor <init>(Landroid/support/design/widget/FloatingActionButton$Behavior;Landroid/support/design/widget/FloatingActionButton;)V
    .locals 0

    .prologue
    .line 431
    iput-object p1, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$2;->this$0:Landroid/support/design/widget/FloatingActionButton$Behavior;

    iput-object p2, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$2;->val$button:Landroid/support/design/widget/FloatingActionButton;

    invoke-direct {p0}, Landroid/support/design/widget/AnimationUtils$AnimationListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 439
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$2;->this$0:Landroid/support/design/widget/FloatingActionButton$Behavior;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/design/widget/FloatingActionButton$Behavior;->access$302(Landroid/support/design/widget/FloatingActionButton$Behavior;Z)Z

    .line 440
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$2;->val$button:Landroid/support/design/widget/FloatingActionButton;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/design/widget/FloatingActionButton;->setVisibility(I)V

    .line 441
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 434
    iget-object v0, p0, Landroid/support/design/widget/FloatingActionButton$Behavior$2;->this$0:Landroid/support/design/widget/FloatingActionButton$Behavior;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/support/design/widget/FloatingActionButton$Behavior;->access$302(Landroid/support/design/widget/FloatingActionButton$Behavior;Z)Z

    .line 435
    return-void
.end method
