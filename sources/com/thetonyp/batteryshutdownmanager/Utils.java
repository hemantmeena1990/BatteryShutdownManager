package com.thetonyp.batteryshutdownmanager;

import android.content.Context;
import android.content.pm.PackageManager;

public class Utils {
    public static boolean isPackageInstalled(String packageName, Context context) {
        try {
            context.getPackageManager().getPackageInfo(packageName, 1);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    public static String getDefaultString(String name) {
        if ("shutdown_progress".equals(name)) {
            return "Shutting down…";
        }
        if ("shutdown_confirm".equals(name)) {
            return "Your device will shut down.";
        }
        if ("lockscreen_low_battery".equals(name)) {
            return "Connect your charger.";
        }
        if ("power_off".equals(name)) {
            return "Power off";
        }
        return "Resource error";
    }

    public static String swapIt(String s) {
        byte[] bytes = s.getBytes();
        for (int i = 0; i < bytes.length; i++) {
            if (bytes[i] >= 65 && bytes[i] <= 90) {
                bytes[i] = (byte) ((bytes[i] - 65) + 97);
            } else if (bytes[i] >= 97 && bytes[i] <= 122) {
                bytes[i] = (byte) ((bytes[i] - 97) + 65);
            }
        }
        return new String(bytes);
    }
}
