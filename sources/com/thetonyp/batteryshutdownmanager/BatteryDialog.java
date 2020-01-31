package com.thetonyp.batteryshutdownmanager;

import android.app.AlertDialog;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.content.res.XModuleResources;
import android.content.res.XResources;
import android.os.Build;
import android.os.CountDownTimer;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.support.v4.app.NotificationCompat;
import de.robv.android.xposed.IXposedHookInitPackageResources;
import de.robv.android.xposed.IXposedHookLoadPackage;
import de.robv.android.xposed.IXposedHookZygoteInit;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XC_MethodReplacement;
import de.robv.android.xposed.XSharedPreferences;
import de.robv.android.xposed.XposedBridge;
import de.robv.android.xposed.XposedHelpers;
import de.robv.android.xposed.callbacks.XC_InitPackageResources;
import de.robv.android.xposed.callbacks.XC_LoadPackage;

public class BatteryDialog implements IXposedHookLoadPackage, IXposedHookZygoteInit, IXposedHookInitPackageResources {
    public static final String CLASS_ACTIVITY_MANAGER_NATIVE = "android.app.ActivityManagerNative";
    public static final String CLASS_BATTERY_SERVICE = "com.android.server.BatteryService";
    private static final boolean DEBUG = false;
    static final int ID_NOTIFICATION = 999999999;
    public static String MODULE_PATH = null;
    public static final String PACKAGE_NAME = BatteryDialog.class.getPackage().getName();
    private static final long RELOAD_INTERVAL = 2000;
    private static final String TAG = "BatterySManager";
    public static AlertDialog alertDialog = null;
    public static int batteryLevel = 999;
    public static CountDownTimer countDown;
    public static int countPreventedShutdowns = 0;
    public static int fakeResBatteryOutline = 0;
    public static int fakeResPower = 0;
    public static boolean isOverride = false;
    public static boolean isPoweredLocked = false;
    public static boolean isScreenOn = true;
    private static long lastReload = 0;
    public static Context mContext;
    public static Handler mHandler;
    public static XModuleResources mModRes;
    public static NotificationManager mNotifManager;
    public static BroadcastReceiver mReceiver;
    public static Object myObject;
    public static int prefChosenTime;
    public static boolean prefDisableShutdown = false;
    public static boolean prefScreenOff = false;
    public static boolean prefTranslation = false;
    public static XSharedPreferences prefs;
    public static Resources res;
    public static SharedPreferences sharedPrefs;
    public static boolean showedDialog = false;
    public static BroadcastReceiver shutdownReceiver;
    public static boolean userDebugging = false;
    final int BATTERY_PLUGGED_AC = 1;
    final int BATTERY_PLUGGED_ANY = 7;
    final int BATTERY_PLUGGED_USB = 2;
    final int BATTERY_PLUGGED_WIRELESS = 4;

    /* access modifiers changed from: private */
    public static void debugLog(String entry) {
        if (userDebugging) {
            XposedBridge.log("BatterySManager: " + entry);
        }
    }

    /* access modifiers changed from: private */
    public static void debugLine(String debugMessage) {
        Object valueOf;
        if (userDebugging) {
            StringBuilder append = new StringBuilder().append(". batteryLevel=").append(batteryLevel).append(", isPoweredLocked=").append(isPoweredLocked).append(", prefChosenTime=").append(prefChosenTime).append(", alertDialog=");
            if (alertDialog == null) {
                valueOf = "null";
            } else {
                valueOf = Boolean.valueOf(alertDialog.isShowing());
            }
            XposedBridge.log("BatterySManager: " + debugMessage + append.append(valueOf).append(", showedDialog=").append(showedDialog).append(", prefScreenOff=").append(prefScreenOff).append(", prefDisableShutdown=").append(prefDisableShutdown).append(", isScreenOn=").append(isScreenOn).toString());
        }
    }

    public void initZygote(IXposedHookZygoteInit.StartupParam startupParam) throws Throwable {
        mModRes = XModuleResources.createInstance(startupParam.modulePath, (XResources) null);
        MODULE_PATH = startupParam.modulePath;
        prefs = new XSharedPreferences(PACKAGE_NAME);
        prefs.makeWorldReadable();
        sharedPrefs = prefs;
        userDebugging = prefs.getBoolean("pref_debug", false);
        debugLog("Debug Mode Enabled. v1.1, Android " + Build.VERSION.RELEASE + " (SDK " + Build.VERSION.SDK_INT + ")");
        debugLog("Battery Shutdown Manager debug logging is enabled. If you do not need the log output disable it in the app.");
    }

    public void handleInitPackageResources(XC_InitPackageResources.InitPackageResourcesParam resparam) {
        if (resparam.packageName.equals("android")) {
            if (fakeResBatteryOutline == 0) {
                fakeResBatteryOutline = resparam.res.addResource(mModRes, R.drawable.ic_battery_outline);
            }
            if (fakeResPower == 0) {
                fakeResPower = resparam.res.addResource(mModRes, R.drawable.ic_power);
            }
        }
    }

    public void handleLoadPackage(XC_LoadPackage.LoadPackageParam lpparam) throws Throwable {
        String shutdownMethod;
        if (lpparam.packageName.equals(PACKAGE_NAME)) {
            XposedHelpers.findAndHookMethod(PACKAGE_NAME + ".SettingsFragment", lpparam.classLoader, "xposedVersionCheck", new Object[]{XC_MethodReplacement.returnConstant(12)});
        } else if ("android".equals(lpparam.packageName)) {
            Class<?> classBatteryService = XposedHelpers.findClass(CLASS_BATTERY_SERVICE, lpparam.classLoader);
            final Class<?> classActivityManagerNative = XposedHelpers.findClass(CLASS_ACTIVITY_MANAGER_NATIVE, lpparam.classLoader);
            if (Build.VERSION.SDK_INT >= 17) {
                shutdownMethod = "shutdownIfNoPowerLocked";
            } else {
                shutdownMethod = "shutdownIfNoPower";
            }
            try {
                XposedHelpers.findAndHookMethod(classBatteryService, shutdownMethod, new Object[]{new XC_MethodHook() {
                    /* access modifiers changed from: protected */
                    public void beforeHookedMethod(XC_MethodHook.MethodHookParam param) throws Throwable {
                        boolean isSystemReady = true;
                        try {
                            isSystemReady = ((Boolean) XposedHelpers.callStaticMethod(classActivityManagerNative, "isSystemReady", new Object[0])).booleanValue();
                        } catch (Throwable t) {
                            XposedBridge.log(t);
                        }
                        if (!isSystemReady) {
                            BatteryDialog.debugLog("invokeOriginalMethod, isSystemReady=false");
                            return;
                        }
                        BatteryDialog.reloadPrefs(BatteryDialog.prefs);
                        BatteryDialog.userDebugging = BatteryDialog.prefs.getBoolean("pref_debug", false);
                        BatteryDialog.prefChosenTime = Integer.parseInt(BatteryDialog.prefs.getString("pref_time", "1"));
                        BatteryDialog.prefScreenOff = BatteryDialog.prefs.getBoolean("pref_screen_off", false);
                        BatteryDialog.prefTranslation = BatteryDialog.prefs.getBoolean("pref_translation", false);
                        BatteryDialog.prefDisableShutdown = BatteryDialog.prefs.getBoolean("pref_disable_shutdown", false);
                        if (BatteryDialog.mContext == null) {
                            BatteryDialog.mContext = (Context) XposedHelpers.getObjectField(param.thisObject, "mContext");
                        }
                        if (BatteryDialog.mContext == null) {
                            BatteryDialog.mHandler = (Handler) XposedHelpers.getObjectField(param.thisObject, "mHandler");
                        }
                        BatteryDialog.myObject = param.thisObject;
                        if (BatteryDialog.mReceiver == null) {
                            IntentFilter filter = new IntentFilter("android.intent.action.SCREEN_ON");
                            filter.addAction("android.intent.action.SCREEN_OFF");
                            BatteryDialog.mReceiver = new ScreenReceiver();
                            BatteryDialog.mContext.registerReceiver(BatteryDialog.mReceiver, filter);
                        }
                        try {
                            if (Build.VERSION.SDK_INT >= 19) {
                                BatteryDialog.batteryLevel = ((Integer) XposedHelpers.getObjectField(XposedHelpers.getObjectField(param.thisObject, "mBatteryProps"), "batteryLevel")).intValue();
                            } else {
                                BatteryDialog.batteryLevel = XposedHelpers.getIntField(param.thisObject, "mBatteryLevel");
                            }
                        } catch (Throwable t2) {
                            XposedBridge.log("BatterySManager: WARNING: Resolving batteryLevel failed, your device is not yet supported. Please contact the developer!");
                            XposedBridge.log(t2);
                        }
                        try {
                            if (Build.VERSION.SDK_INT >= 17) {
                                BatteryDialog.isPoweredLocked = ((Boolean) XposedHelpers.callMethod(param.thisObject, "isPoweredLocked", new Object[]{7})).booleanValue();
                            } else {
                                BatteryDialog.isPoweredLocked = ((Boolean) XposedHelpers.callMethod(param.thisObject, "isPowered", new Object[0])).booleanValue();
                            }
                        } catch (Throwable t3) {
                            XposedBridge.log("BatterySManager: WARNING: Resolving isPowerLocked failed, your device is not yet supported. Please contact the developer!");
                            XposedBridge.log(t3);
                        }
                        if (BatteryDialog.batteryLevel > 0 || BatteryDialog.isPoweredLocked) {
                            BatteryDialog.isOverride = false;
                        } else if (BatteryDialog.isOverride) {
                            BatteryDialog.debugLog("Override active");
                            return;
                        }
                        if (BatteryDialog.prefDisableShutdown && BatteryDialog.batteryLevel == 0 && !BatteryDialog.isPoweredLocked) {
                            if (BatteryDialog.shutdownReceiver == null) {
                                IntentFilter filter2 = new IntentFilter();
                                filter2.addAction(RebootReceiver.BATTERY_SM_SHUTDOWN);
                                filter2.addAction(RebootReceiver.BATTERY_SM_DISMISS);
                                BatteryDialog.shutdownReceiver = new RebootReceiver();
                                BatteryDialog.mContext.registerReceiver(BatteryDialog.shutdownReceiver, filter2);
                                BatteryDialog.debugLog("Register Receiver");
                            }
                            if (BatteryDialog.mNotifManager == null) {
                                BatteryDialog.mNotifManager = (NotificationManager) BatteryDialog.mContext.getSystemService("notification");
                            }
                            BatteryDialog.countPreventedShutdowns++;
                            BatteryDialog.this.showNotification();
                            BatteryDialog.debugLog("preventing shutdown: " + BatteryDialog.countPreventedShutdowns);
                            param.setResult((Object) null);
                        } else if (!BatteryDialog.isPoweredLocked || (BatteryDialog.countDown == null && BatteryDialog.alertDialog == null && !BatteryDialog.showedDialog)) {
                            if (BatteryDialog.batteryLevel > 0) {
                                BatteryDialog.showedDialog = false;
                                BatteryDialog.this.terminateDialog(false);
                            }
                            if (BatteryDialog.alertDialog != null || BatteryDialog.showedDialog) {
                                if (BatteryDialog.countDown == null) {
                                    BatteryDialog.this.terminateDialog(true);
                                    XposedBridge.log("BatterySManager: WARNING: alertDialog is showing but the countDown stopped. Shutdown immediately");
                                    return;
                                }
                                BatteryDialog.debugLine("AlertDialog is showing, postpone shutdown");
                                param.setResult((Object) null);
                            } else if (BatteryDialog.showedDialog || BatteryDialog.batteryLevel != 0 || BatteryDialog.isPoweredLocked || BatteryDialog.alertDialog != null || BatteryDialog.prefChosenTime <= 0 || (!BatteryDialog.isScreenOn && !BatteryDialog.prefScreenOff)) {
                                BatteryDialog.debugLine("invokeOriginalMethod");
                            } else {
                                BatteryDialog.showedDialog = true;
                                new Handler(Looper.getMainLooper()).post(new Runnable() {
                                    public void run() {
                                        BatteryDialog.this.showShutdownDialog(BatteryDialog.mContext);
                                    }
                                });
                                BatteryDialog.debugLine("Show dialog");
                                param.setResult((Object) null);
                            }
                        } else {
                            BatteryDialog.this.terminateDialog(false);
                            BatteryDialog.debugLine("Charger connected, dismiss dialog");
                            param.setResult((Object) null);
                        }
                    }
                }});
            } catch (Throwable t) {
                XposedBridge.log("BatterySM: ERROR: Hook failed, it appears as if your ROM is not supported! Please contact the developer if you want support for your ROM.");
                XposedBridge.log(t);
            }
        }
    }

    /* access modifiers changed from: private */
    public void showNotification() {
        NotificationCompat.Builder build = new NotificationCompat.Builder(mContext);
        build.setOngoing(true);
        if (Build.VERSION.SDK_INT >= 21) {
            build.setVisibility(1);
        }
        build.setSmallIcon(fakeResBatteryOutline == 0 ? 17301543 : fakeResBatteryOutline);
        build.setContentTitle(String.format(mModRes.getString(R.string.d_shutdown_disabled_title), new Object[]{Integer.valueOf(countPreventedShutdowns)}));
        build.setContentText(mModRes.getString(R.string.d_shutdown_disabled_summary));
        PendingIntent nextPendingIntent = PendingIntent.getBroadcast(mContext, 0, new Intent(RebootReceiver.BATTERY_SM_SHUTDOWN), 134217728);
        PendingIntent nextPendingIntent2 = PendingIntent.getBroadcast(mContext, 0, new Intent(RebootReceiver.BATTERY_SM_DISMISS), 134217728);
        build.setStyle(new NotificationCompat.BigTextStyle().bigText(mModRes.getString(R.string.d_shutdown_disabled_long)));
        build.addAction(17301560, mModRes.getString(R.string.d_shutdown_disabled_dismiss), nextPendingIntent2);
        build.addAction(fakeResPower, getSystemString("power_off"), nextPendingIntent);
        mNotifManager.notify(ID_NOTIFICATION, build.build());
    }

    public void showShutdownDialog(Context mContext2) {
        final String shutdownString = getSystemString("shutdown_progress");
        alertDialog = new AlertDialog.Builder(mContext2).create();
        alertDialog.setCancelable(false);
        alertDialog.setTitle(shutdownString);
        alertDialog.setMessage(getSystemString("shutdown_confirm") + " " + getSystemString("lockscreen_low_battery"));
        alertDialog.setIconAttribute(16843605);
        alertDialog.getWindow().setType(2009);
        if (isScreenOn || prefScreenOff) {
            alertDialog.getWindow().addFlags(2097152);
        }
        alertDialog.setButton(-1, getSystemString("power_off"), new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                BatteryDialog.this.terminateDialog(true);
            }
        });
        alertDialog.show();
        countDown = new CountDownTimer((long) (prefChosenTime * 1000), 500) {
            public void onTick(long millisUntilFinished) {
                if (BatteryDialog.alertDialog != null) {
                    BatteryDialog.alertDialog.setTitle(shutdownString + " " + (millisUntilFinished / 1000));
                } else {
                    BatteryDialog.debugLog("WARNING: alertDialog == null");
                }
            }

            public void onFinish() {
                BatteryDialog.this.terminateDialog(true);
            }
        }.start();
    }

    /* access modifiers changed from: private */
    public void terminateDialog(boolean processValues) {
        if (alertDialog != null) {
            alertDialog.dismiss();
            alertDialog = null;
        }
        if (processValues) {
            isOverride = true;
            debugLog("Dismiss dialog, callProcessValues");
            callProcessValues();
        }
        if (countDown != null) {
            countDown.cancel();
            countDown = null;
        }
    }

    public String getSystemString(String name) {
        if (res == null) {
            res = Resources.getSystem();
        }
        if (res == null || !prefTranslation) {
            return Utils.getDefaultString(name);
        }
        if ("lockscreen_low_battery".equals(name)) {
            debugLog("testing: " + mModRes.getString(R.string.lockscreen_low_battery));
            return mModRes.getString(R.string.lockscreen_low_battery);
        }
        int id = res.getIdentifier(name, "string", "android");
        if (id == 0) {
            return Utils.getDefaultString(name);
        }
        try {
            return res.getString(id);
        } catch (Resources.NotFoundException e) {
            return Utils.getDefaultString(name);
        }
    }

    public class ScreenReceiver extends BroadcastReceiver {
        public ScreenReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                BatteryDialog.isScreenOn = false;
            } else if (intent.getAction().equals("android.intent.action.SCREEN_ON")) {
                BatteryDialog.isScreenOn = true;
            }
        }
    }

    public static class RebootReceiver extends BroadcastReceiver {
        public static String BATTERY_SM_DISMISS = "bsm_dismiss";
        public static String BATTERY_SM_SHUTDOWN = "bsm_reboot";

        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals(BATTERY_SM_SHUTDOWN)) {
                BatteryDialog.isOverride = true;
                BatteryDialog.callProcessValues();
            } else if (intent.getAction().equals(BATTERY_SM_DISMISS)) {
                BatteryDialog.mNotifManager.cancel(BatteryDialog.ID_NOTIFICATION);
                BatteryDialog.countPreventedShutdowns = 0;
            }
        }
    }

    public static void callProcessValues() {
        debugLog("callProcessValues");
        try {
            if (Build.VERSION.SDK_INT >= 21) {
                XposedHelpers.callMethod(myObject, "processValuesLocked", new Object[]{false});
            } else if (Build.VERSION.SDK_INT >= 17) {
                XposedHelpers.callMethod(myObject, "processValuesLocked", new Object[0]);
            } else {
                XposedHelpers.callMethod(myObject, "processValues", new Object[0]);
            }
        } catch (Throwable t) {
            XposedBridge.log(t);
        }
    }

    /* access modifiers changed from: private */
    public static void reloadPrefs(XSharedPreferences prefs2) {
        if (lastReload + RELOAD_INTERVAL < SystemClock.elapsedRealtime()) {
            lastReload = SystemClock.elapsedRealtime();
            prefs2.reload();
        }
    }
}
