.class Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;
.super Lde/robv/android/xposed/XC_MethodHook;
.source "BatteryDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->handleLoadPackage(Lde/robv/android/xposed/callbacks/XC_LoadPackage$LoadPackageParam;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

.field final synthetic val$classActivityManagerNative:Ljava/lang/Class;


# direct methods
.method constructor <init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;Ljava/lang/Class;)V
    .locals 0
    .param p1, "this$0"    # Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    .prologue
    .line 171
    iput-object p1, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    iput-object p2, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->val$classActivityManagerNative:Ljava/lang/Class;

    invoke-direct {p0}, Lde/robv/android/xposed/XC_MethodHook;-><init>()V

    return-void
.end method


# virtual methods
.method protected beforeHookedMethod(Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;)V
    .locals 14
    .param p1, "param"    # Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    const/4 v11, 0x0

    .line 175
    const/4 v3, 0x1

    .line 177
    .local v3, "isSystemReady":Z
    :try_start_0
    iget-object v6, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->val$classActivityManagerNative:Ljava/lang/Class;

    const-string v7, "isSystemReady"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v6, v7, v8}, Lde/robv/android/xposed/XposedHelpers;->callStaticMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 181
    :goto_0
    if-nez v3, :cond_0

    .line 182
    const-string v6, "invokeOriginalMethod, isSystemReady=false"

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$000(Ljava/lang/String;)V

    .line 308
    :goto_1
    return-void

    .line 178
    :catch_0
    move-exception v4

    .line 179
    .local v4, "t":Ljava/lang/Throwable;
    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 186
    .end local v4    # "t":Ljava/lang/Throwable;
    :cond_0
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$100(Lde/robv/android/xposed/XSharedPreferences;)V

    .line 187
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    const-string v7, "pref_debug"

    invoke-virtual {v6, v7, v11}, Lde/robv/android/xposed/XSharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    sput-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->userDebugging:Z

    .line 189
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    const-string v7, "pref_time"

    const-string v8, "1"

    invoke-virtual {v6, v7, v8}, Lde/robv/android/xposed/XSharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    sput v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefChosenTime:I

    .line 190
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    const-string v7, "pref_screen_off"

    invoke-virtual {v6, v7, v11}, Lde/robv/android/xposed/XSharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    sput-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefScreenOff:Z

    .line 191
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    const-string v7, "pref_translation"

    invoke-virtual {v6, v7, v11}, Lde/robv/android/xposed/XSharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    sput-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefTranslation:Z

    .line 193
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefs:Lde/robv/android/xposed/XSharedPreferences;

    const-string v7, "pref_disable_shutdown"

    invoke-virtual {v6, v7, v11}, Lde/robv/android/xposed/XSharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    sput-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefDisableShutdown:Z

    .line 195
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    if-nez v6, :cond_1

    .line 196
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-string v7, "mContext"

    invoke-static {v6, v7}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/Context;

    sput-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    .line 198
    :cond_1
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    if-nez v6, :cond_2

    .line 199
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-string v7, "mHandler"

    invoke-static {v6, v7}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/os/Handler;

    sput-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mHandler:Landroid/os/Handler;

    .line 201
    :cond_2
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    sput-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->myObject:Ljava/lang/Object;

    .line 204
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mReceiver:Landroid/content/BroadcastReceiver;

    if-nez v6, :cond_3

    .line 206
    new-instance v0, Landroid/content/IntentFilter;

    const-string v6, "android.intent.action.SCREEN_ON"

    invoke-direct {v0, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 207
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v6, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 208
    new-instance v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$ScreenReceiver;

    iget-object v7, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    invoke-direct {v6, v7}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$ScreenReceiver;-><init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;)V

    sput-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 209
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v6, v7, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 213
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_3
    :try_start_1
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x13

    if-lt v6, v7, :cond_8

    .line 214
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-string v7, "mBatteryProps"

    invoke-static {v6, v7}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    .line 215
    .local v5, "xBatteryProps":Ljava/lang/Object;
    const-string v6, "batteryLevel"

    invoke-static {v5, v6}, Lde/robv/android/xposed/XposedHelpers;->getObjectField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    sput v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->batteryLevel:I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 225
    .end local v5    # "xBatteryProps":Ljava/lang/Object;
    :goto_2
    :try_start_2
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x11

    if-lt v6, v7, :cond_9

    .line 226
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-string v7, "isPoweredLocked"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const/4 v10, 0x7

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Lde/robv/android/xposed/XposedHelpers;->callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    sput-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isPoweredLocked:Z
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2

    .line 235
    :goto_3
    sget v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->batteryLevel:I

    if-gtz v6, :cond_4

    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isPoweredLocked:Z

    if-eqz v6, :cond_a

    .line 236
    :cond_4
    sput-boolean v11, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isOverride:Z

    .line 243
    :cond_5
    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefDisableShutdown:Z

    if-eqz v6, :cond_b

    sget v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->batteryLevel:I

    if-nez v6, :cond_b

    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isPoweredLocked:Z

    if-nez v6, :cond_b

    .line 245
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->shutdownReceiver:Landroid/content/BroadcastReceiver;

    if-nez v6, :cond_6

    .line 246
    new-instance v1, Landroid/content/IntentFilter;

    invoke-direct {v1}, Landroid/content/IntentFilter;-><init>()V

    .line 247
    .local v1, "filter2":Landroid/content/IntentFilter;
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;->BATTERY_SM_SHUTDOWN:Ljava/lang/String;

    invoke-virtual {v1, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 248
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;->BATTERY_SM_DISMISS:Ljava/lang/String;

    invoke-virtual {v1, v6}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 249
    new-instance v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;

    invoke-direct {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$RebootReceiver;-><init>()V

    sput-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->shutdownReceiver:Landroid/content/BroadcastReceiver;

    .line 250
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    sget-object v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->shutdownReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v6, v7, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 251
    const-string v6, "Register Receiver"

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$000(Ljava/lang/String;)V

    .line 254
    .end local v1    # "filter2":Landroid/content/IntentFilter;
    :cond_6
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mNotifManager:Landroid/app/NotificationManager;

    if-nez v6, :cond_7

    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mContext:Landroid/content/Context;

    const-string v7, "notification"

    .line 255
    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/NotificationManager;

    sput-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->mNotifManager:Landroid/app/NotificationManager;

    .line 257
    :cond_7
    sget v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countPreventedShutdowns:I

    add-int/lit8 v6, v6, 0x1

    sput v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countPreventedShutdowns:I

    .line 258
    iget-object v6, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$200(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;)V

    .line 259
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "preventing shutdown: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sget v7, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countPreventedShutdowns:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$000(Ljava/lang/String;)V

    .line 260
    invoke-virtual {p1, v12}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 217
    :cond_8
    :try_start_3
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-string v7, "mBatteryLevel"

    invoke-static {v6, v7}, Lde/robv/android/xposed/XposedHelpers;->getIntField(Ljava/lang/Object;Ljava/lang/String;)I

    move-result v6

    sput v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->batteryLevel:I
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_2

    .line 219
    :catch_1
    move-exception v4

    .line 220
    .restart local v4    # "t":Ljava/lang/Throwable;
    const-string v6, "BatterySManager: WARNING: Resolving batteryLevel failed, your device is not yet supported. Please contact the developer!"

    invoke-static {v6}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 221
    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    goto/16 :goto_2

    .line 228
    .end local v4    # "t":Ljava/lang/Throwable;
    :cond_9
    :try_start_4
    iget-object v6, p1, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const-string v7, "isPowered"

    const/4 v8, 0x0

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v6, v7, v8}, Lde/robv/android/xposed/XposedHelpers;->callMethod(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    sput-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isPoweredLocked:Z
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_3

    .line 230
    :catch_2
    move-exception v4

    .line 231
    .restart local v4    # "t":Ljava/lang/Throwable;
    const-string v6, "BatterySManager: WARNING: Resolving isPowerLocked failed, your device is not yet supported. Please contact the developer!"

    invoke-static {v6}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    .line 232
    invoke-static {v4}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/Throwable;)V

    goto/16 :goto_3

    .line 237
    .end local v4    # "t":Ljava/lang/Throwable;
    :cond_a
    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isOverride:Z

    if-eqz v6, :cond_5

    .line 238
    const-string v6, "Override active"

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$000(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 264
    :cond_b
    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isPoweredLocked:Z

    if-eqz v6, :cond_d

    .line 265
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countDown:Landroid/os/CountDownTimer;

    if-nez v6, :cond_c

    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    if-nez v6, :cond_c

    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showedDialog:Z

    if-eqz v6, :cond_d

    .line 266
    :cond_c
    iget-object v6, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    invoke-static {v6, v11}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$300(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;Z)V

    .line 267
    const-string v6, "Charger connected, dismiss dialog"

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$400(Ljava/lang/String;)V

    .line 268
    invoke-virtual {p1, v12}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 273
    :cond_d
    sget v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->batteryLevel:I

    if-lez v6, :cond_e

    .line 274
    sput-boolean v11, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showedDialog:Z

    .line 275
    iget-object v6, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    invoke-static {v6, v11}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$300(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;Z)V

    .line 279
    :cond_e
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    if-nez v6, :cond_f

    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showedDialog:Z

    if-eqz v6, :cond_11

    .line 280
    :cond_f
    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->countDown:Landroid/os/CountDownTimer;

    if-nez v6, :cond_10

    .line 281
    iget-object v6, p0, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;->this$0:Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;

    invoke-static {v6, v13}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$300(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;Z)V

    .line 282
    const-string v6, "BatterySManager: WARNING: alertDialog is showing but the countDown stopped. Shutdown immediately"

    invoke-static {v6}, Lde/robv/android/xposed/XposedBridge;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 286
    :cond_10
    const-string v6, "AlertDialog is showing, postpone shutdown"

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$400(Ljava/lang/String;)V

    .line 287
    invoke-virtual {p1, v12}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 291
    :cond_11
    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showedDialog:Z

    if-nez v6, :cond_13

    sget v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->batteryLevel:I

    if-nez v6, :cond_13

    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isPoweredLocked:Z

    if-nez v6, :cond_13

    sget-object v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->alertDialog:Landroid/app/AlertDialog;

    if-nez v6, :cond_13

    sget v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefChosenTime:I

    if-lez v6, :cond_13

    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->isScreenOn:Z

    if-nez v6, :cond_12

    sget-boolean v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->prefScreenOff:Z

    if-eqz v6, :cond_13

    .line 292
    :cond_12
    sput-boolean v13, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->showedDialog:Z

    .line 295
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v6

    invoke-direct {v2, v6}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 296
    .local v2, "h":Landroid/os/Handler;
    new-instance v6, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1$1;

    invoke-direct {v6, p0}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1$1;-><init>(Lcom/thetonyp/batteryshutdownmanager/BatteryDialog$1;)V

    invoke-virtual {v2, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 302
    const-string v6, "Show dialog"

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$400(Ljava/lang/String;)V

    .line 303
    invoke-virtual {p1, v12}, Lde/robv/android/xposed/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 307
    .end local v2    # "h":Landroid/os/Handler;
    :cond_13
    const-string v6, "invokeOriginalMethod"

    invoke-static {v6}, Lcom/thetonyp/batteryshutdownmanager/BatteryDialog;->access$400(Ljava/lang/String;)V

    goto/16 :goto_1
.end method
