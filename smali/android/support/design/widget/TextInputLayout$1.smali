.class Landroid/support/design/widget/TextInputLayout$1;
.super Ljava/lang/Object;
.source "TextInputLayout.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/support/design/widget/TextInputLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
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
    .line 83
    iput-object p1, p0, Landroid/support/design/widget/TextInputLayout$1;->this$0:Landroid/support/design/widget/TextInputLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2
    .param p1, "message"    # Landroid/os/Message;

    .prologue
    const/4 v0, 0x1

    .line 86
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 91
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 88
    :pswitch_0
    iget-object v1, p0, Landroid/support/design/widget/TextInputLayout$1;->this$0:Landroid/support/design/widget/TextInputLayout;

    invoke-static {v1, v0}, Landroid/support/design/widget/TextInputLayout;->access$000(Landroid/support/design/widget/TextInputLayout;Z)V

    goto :goto_0

    .line 86
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
