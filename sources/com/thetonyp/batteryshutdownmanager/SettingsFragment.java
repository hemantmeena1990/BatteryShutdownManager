package com.thetonyp.batteryshutdownmanager;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.net.Uri;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceCategory;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AlertDialog;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.anjlab.android.iab.v3.BillingProcessor;
import com.anjlab.android.iab.v3.TransactionDetails;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SettingsFragment extends PreferenceFragment implements BillingProcessor.IBillingHandler {
    public static final boolean DEBUG = false;
    static final String SKU_PRO = "com.thetonyp.batteryshutdownmanager.pro_0";
    public static final String TAG = "BatterySManager";
    public static AlertDialog alertDialog = null;
    public static CountDownTimer countDown;
    /* access modifiers changed from: private */
    public static boolean isFreeloading = false;
    private static boolean isPro = false;
    public static SharedPreferences sharedPrefs;
    public static boolean startupDialogsShown;
    public static boolean userDebugging = false;
    private final long ONE_DAY = 86400000;
    public BillingProcessor bp;
    private final Preference.OnPreferenceClickListener buyProClickListener = new Preference.OnPreferenceClickListener() {
        public boolean onPreferenceClick(Preference preference) {
            SettingsFragment.this.onButtonUpgradeClicked();
            return false;
        }
    };
    private final Preference.OnPreferenceChangeListener changeListenerLauncher = new Preference.OnPreferenceChangeListener() {
        public boolean onPreferenceChange(Preference preference, Object newValue) {
            int componentState = ((Boolean) newValue).booleanValue() ? 1 : 2;
            Activity activity = SettingsFragment.this.getActivity();
            activity.getPackageManager().setComponentEnabledSetting(new ComponentName(activity, SettingsFragment.this.getActivity().getPackageName() + ".SettingsActivity-Insert"), componentState, 1);
            return true;
        }
    };
    private final Preference.OnPreferenceChangeListener disableShutdownChangeListenerLauncher = new Preference.OnPreferenceChangeListener() {
        public boolean onPreferenceChange(Preference preference, Object newValue) {
            final CheckBoxPreference prefDisableShutdown = (CheckBoxPreference) SettingsFragment.this.findPreference("pref_disable_shutdown");
            if (prefDisableShutdown.isChecked()) {
                return true;
            }
            new AlertDialog.Builder(SettingsFragment.this.getActivity(), R.style.AppCompatAlertDialogStyle).setTitle((int) R.string.d_disable_shutdown).setMessage((int) R.string.d_disable_shutdown_summary).setCancelable(false).setNegativeButton(17039369, (DialogInterface.OnClickListener) null).setPositiveButton(17039379, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int which) {
                    prefDisableShutdown.setChecked(true);
                    SettingsFragment.this.putPref("pref_disable_shutdown", (Boolean) true);
                }
            }).show();
            return false;
        }
    };
    @SuppressLint({"SimpleDateFormat"})
    private final SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    private final Preference.OnPreferenceChangeListener freeloadChangeListenerLauncher = new Preference.OnPreferenceChangeListener() {
        public boolean onPreferenceChange(Preference preference, Object newValue) {
            if (!((CheckBoxPreference) SettingsFragment.this.findPreference("pref_freeload")).isChecked()) {
                boolean unused = SettingsFragment.isFreeloading = true;
                new AlertDialog.Builder(SettingsFragment.this.getActivity(), R.style.AppCompatAlertDialogStyle).setTitle((int) R.string.d_freeload).setMessage((int) R.string.d_freeload_text).setCancelable(true).setPositiveButton(17039370, (DialogInterface.OnClickListener) null).show();
            } else {
                boolean unused2 = SettingsFragment.isFreeloading = false;
            }
            SettingsFragment.this.updateUI();
            SettingsFragment.this.updateFragment();
            return true;
        }
    };
    public boolean mBillingServiceReady = false;
    private final Preference.OnPreferenceClickListener testDialogClickListener = new Preference.OnPreferenceClickListener() {
        public boolean onPreferenceClick(Preference preference) {
            SettingsFragment.this.testDialog();
            return false;
        }
    };

    /* access modifiers changed from: private */
    public static void debugLog(String message) {
        if (userDebugging) {
            Log.d(TAG, message);
        }
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getPreferenceManager().setSharedPreferencesMode(1);
        addPreferencesFromResource(R.xml.preferences);
        findPreference("pref_about").setTitle(getString(R.string.app_name) + " " + getString(R.string.pref_about_title_v, new Object[]{BuildConfig.VERSION_NAME}));
        findPreference("pref_launcher").setOnPreferenceChangeListener(this.changeListenerLauncher);
        sharedPrefs = PreferenceManager.getDefaultSharedPreferences(getActivity());
        isFreeloading = sharedPrefs.getBoolean("pref_freeload", false);
        isPro = sharedPrefs.getBoolean("pref_pro_temp", false);
        userDebugging = sharedPrefs.getBoolean("pref_debug", false);
        findPreference("pref_buy_pro").setOnPreferenceClickListener(this.buyProClickListener);
        findPreference("pref_test_dialog").setOnPreferenceClickListener(this.testDialogClickListener);
        findPreference("pref_freeload").setOnPreferenceChangeListener(this.freeloadChangeListenerLauncher);
        findPreference("pref_disable_shutdown").setOnPreferenceChangeListener(this.disableShutdownChangeListenerLauncher);
        this.bp = new BillingProcessor(getActivity().getApplicationContext(), Utils.swapIt("miibiJanbGKQHKIg9W0baqefaaocaq8amiibcGkcaqeaMf5rsOgGnhAjuApXOHCjkG8aN3puKv0NJ82ElTtpQYQw0Rw8Ebd8DCqIvpboYWr2h2AQTL0CvWiiyKAZwAj/jaHxDWSsGS/1p4V8tbMKLOdAn2djgz1WWBdB+MUeY1IdDHuCrnV+KTsL+XlM/+xtDidt788ZncRvuGTOYFM1fduWtzYzIj5o0wCJMpcaJpCaSLIrS7TOhGqlY3outYeMExsgW0HAyJNFZ+sDBLUglbeX3KING7X/pTAF3RKDF9awtYoMdOpqLNxRFO4KqjUDgRQ5UGXD+QdQRZ6pFUNQihDAVfnJSf+rzeaqkrfXqADY5TxxJzp4G8vcCKHMj4hB0Widaqab"), this);
        updateUI();
        showStartupDialogs();
    }

    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        int i = 0;
        View v = inflater.inflate(R.layout.layout_warning, container, false);
        View warnView = v.findViewById(R.id.xposed_settings_warning);
        TextView tv = (TextView) warnView;
        Preference prefAttention = findPreference("pref_attention");
        if (!isInstallerPresent()) {
            tv.setText(R.string.warn_xposed_installer_missing);
            if (prefAttention != null) {
                prefAttention.setSummary(R.string.pref_attention_installer_missing);
            }
        } else if (isModuleActiveButOutdated()) {
            tv.setText(R.string.warn_version_mismatch);
            if (prefAttention != null) {
                prefAttention.setSummary(R.string.pref_attention_version_mismatch);
            }
        } else if (!isModuleActive()) {
            tv.setText(R.string.warn_module_not_active);
            if (prefAttention != null) {
                prefAttention.setSummary(R.string.pref_attention_module_not_active);
            }
        } else if (hookFailed()) {
            tv.setText(R.string.warn_xposed_hook_failed);
            if (prefAttention != null) {
                prefAttention.setSummary(R.string.pref_attention_module_hook_failed);
            }
        }
        if (isModuleActive() && !hookFailed()) {
            i = 8;
        }
        warnView.setVisibility(i);
        return v;
    }

    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        super.onPreferenceTreeClick(preferenceScreen, preference);
        if (!(preference instanceof PreferenceScreen)) {
            return false;
        }
        setUpNestedScreen((PreferenceScreen) preference);
        return false;
    }

    public void setUpNestedScreen(PreferenceScreen preferenceScreen) {
        final Dialog dialog = preferenceScreen.getDialog();
        LinearLayout root = (LinearLayout) dialog.findViewById(16908298).getParent();
        Toolbar bar = (Toolbar) LayoutInflater.from(getActivity()).inflate(R.layout.settings_toolbar, root, false);
        root.addView(bar, 0);
        bar.setTitle(preferenceScreen.getTitle());
        bar.setNavigationIcon((int) R.drawable.abc_ic_ab_back_mtrl_am_alpha);
        bar.setNavigationOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
    }

    public void onButtonUpgradeClicked() {
        if (!this.mBillingServiceReady) {
            showSnack((int) R.string.toast_billing_not_ready);
        } else {
            this.bp.purchase(getActivity(), SKU_PRO);
        }
    }

    public void onPause() {
        super.onPause();
        File sharedPrefsFile = new File(new File(getActivity().getApplicationInfo().dataDir, "shared_prefs"), getPreferenceManager().getSharedPreferencesName() + ".xml");
        if (sharedPrefsFile.exists()) {
            sharedPrefsFile.setReadable(true, false);
        }
    }

    public void onBillingInitialized() {
        this.mBillingServiceReady = true;
        this.bp.loadOwnedPurchasesFromGoogle();
        debugLog("BillingServiceReady: " + this.mBillingServiceReady);
    }

    public void onProductPurchased(String productId, TransactionDetails details) {
        debugLog("purchased: " + productId + " | details: " + details.toString());
        if (productId.equals(SKU_PRO)) {
            showSnack((int) R.string.toast_purchased);
            isPro = true;
            putPref("pref_pro_temp", (Boolean) true);
            updateUI();
            updateFragment();
        }
    }

    public void onBillingError(int errorCode, Throwable error) {
        debugLog("BillingError: " + errorCode);
    }

    public void onPurchaseHistoryRestored() {
        boolean oldPro = isPro;
        isPro = false;
        if (this.bp.isPurchased(SKU_PRO)) {
            debugLog("purchase check success");
            isPro = true;
        }
        putPref("pref_pro_temp", Boolean.valueOf(isPro));
        updateUI();
        if (oldPro && !isPro) {
            debugLog("reverted incorrect purchase");
            updateFragment();
        }
        if (!oldPro && isPro) {
            showSnack((int) R.string.toast_purchase_restored);
            updateFragment();
        }
        debugLog("purchase history restored. isPro=" + isPro);
    }

    /* access modifiers changed from: private */
    public void testDialog() {
        if (countDown != null) {
            countDown.cancel();
            countDown = null;
        }
        if (alertDialog != null) {
            alertDialog.dismiss();
            alertDialog.cancel();
        }
        int time = Integer.parseInt(sharedPrefs.getString("pref_time", "1"));
        if (time == 0) {
            showSnack((int) R.string.toast_no_time_set);
            return;
        }
        alertDialog = new AlertDialog.Builder(getActivity()).create();
        alertDialog.setCancelable(true);
        alertDialog.setTitle(getSystemString("shutdown_progress"));
        alertDialog.setMessage(getSystemString("shutdown_confirm") + " " + getSystemString("lockscreen_low_battery"));
        alertDialog.setIconAttribute(16843605);
        alertDialog.setOnCancelListener(new DialogInterface.OnCancelListener() {
            public void onCancel(DialogInterface dialog) {
                SettingsFragment.this.terminateDialog();
            }
        });
        alertDialog.setButton(-1, (CharSequence) getSystemString("power_off"), (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int id) {
                SettingsFragment.this.showSnack((int) R.string.toast_power_off_pressed);
                SettingsFragment.this.terminateDialog();
            }
        });
        alertDialog.show();
        countDown = new CountDownTimer((long) (time * 1000), 500) {
            public void onTick(long millisUntilFinished) {
                SettingsFragment.alertDialog.setTitle(SettingsFragment.this.getSystemString("shutdown_progress") + " " + (millisUntilFinished / 1000));
            }

            public void onFinish() {
                SettingsFragment.debugLog("dismiss dialog");
                SettingsFragment.alertDialog.dismiss();
                SettingsFragment.alertDialog = null;
            }
        }.start();
    }

    /* access modifiers changed from: private */
    public void terminateDialog() {
        if (countDown != null) {
            countDown.cancel();
            countDown = null;
        }
        alertDialog.dismiss();
        alertDialog = null;
    }

    /* access modifiers changed from: private */
    public void showSnack(int message) {
        Snackbar.make(getActivity().findViewById(16908290), message, 0).setAction((CharSequence) "Action", (View.OnClickListener) null).show();
    }

    private void showSnack(String message) {
        Snackbar.make(getActivity().findViewById(16908290), (CharSequence) message, 0).setAction((CharSequence) "Action", (View.OnClickListener) null).show();
    }

    public String getSystemString(String name) {
        Resources res = Resources.getSystem();
        if (res == null || !sharedPrefs.getBoolean("pref_translation", false)) {
            return Utils.getDefaultString(name);
        }
        if ("lockscreen_low_battery".equals(name)) {
            return getString(R.string.lockscreen_low_battery);
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

    /* access modifiers changed from: private */
    public void updateFragment() {
        ((SettingsActivity) getActivity()).restartFragment();
    }

    /* access modifiers changed from: private */
    public void updateUI() {
        boolean state;
        debugLog(String.format("isPro=%b, isFreeLoading=%b", new Object[]{Boolean.valueOf(isPro), Boolean.valueOf(isFreeloading)}));
        PreferenceScreen ps = getPreferenceScreen();
        PreferenceCategory categoryOther = (PreferenceCategory) findPreference("pref_category_other");
        Preference prefPro = findPreference("pref_buy_pro");
        CheckBoxPreference prefFreeload = (CheckBoxPreference) findPreference("pref_freeload");
        Preference prefTime = findPreference("pref_time");
        CheckBoxPreference prefTranslation = (CheckBoxPreference) findPreference("pref_translation");
        CheckBoxPreference prefScreenOff = (CheckBoxPreference) findPreference("pref_screen_off");
        CheckBoxPreference prefDisableShutdown = (CheckBoxPreference) findPreference("pref_disable_shutdown");
        CheckBoxPreference[] cPrefs = {prefDisableShutdown};
        Preference attention = findPreference("pref_attention");
        if (attention != null && xposedVersionCheck() == 12 && !hookFailed()) {
            ps.removePreference(attention);
        }
        if (isPro) {
            if (prefPro != null) {
                ps.removePreference(prefPro);
            }
            if (prefFreeload != null) {
                categoryOther.removePreference(prefFreeload);
            }
            isFreeloading = false;
            state = true;
        } else if (isFreeloading) {
            state = true;
        } else {
            state = false;
            prefTranslation.setChecked(false);
            prefScreenOff.setChecked(false);
        }
        prefTime.setSelectable(state);
        prefTime.setEnabled(state);
        prefTranslation.setSelectable(state);
        prefTranslation.setEnabled(state);
        prefScreenOff.setSelectable(state);
        prefScreenOff.setEnabled(state);
        boolean exp = false;
        if (isPro) {
            exp = true;
        } else if (sharedPrefs.getBoolean("pref_disable_shutdown", false)) {
            prefDisableShutdown.setChecked(false);
            putPref("pref_disable_shutdown", (Boolean) false);
        }
        disablePrefs(cPrefs, exp);
    }

    private void disablePrefs(CheckBoxPreference[] cPrefs, boolean state) {
        for (CheckBoxPreference i : cPrefs) {
            i.setEnabled(state);
            i.setSelectable(state);
        }
    }

    private void showStartupDialogs() {
        if (!startupDialogsShown) {
            startupDialogsShown = true;
            if (sharedPrefs.getString("first_run", (String) null) != null) {
                new Date();
                new Date();
            }
            if (hookFailed()) {
                new AlertDialog.Builder(getActivity(), R.style.AppCompatAlertDialogStyle).setTitle((int) R.string.d_no_xposed).setMessage((int) R.string.d_no_xposed_description).setCancelable(false).setPositiveButton((int) R.string.d_more_info, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        Intent i = new Intent("android.intent.action.VIEW");
                        i.setData(Uri.parse("http://forum.xda-developers.com/showthread.php?t=3105014"));
                        SettingsFragment.this.startActivity(i);
                    }
                }).setNeutralButton(17039360, (DialogInterface.OnClickListener) null).setIcon((int) R.drawable.ic_alert).show();
            }
            if (sharedPrefs.getString("first_run", (String) null) == null) {
                putPref("first_run", this.formatter.format(new Date()));
                new AlertDialog.Builder(getActivity(), R.style.AppCompatAlertDialogStyle).setTitle((int) R.string.d_first_run).setMessage((int) R.string.d_first_run_description).setCancelable(true).setPositiveButton(17039370, (DialogInterface.OnClickListener) null).setNeutralButton((int) R.string.d_rate_me, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        try {
                            SettingsFragment.this.getActivity().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=" + SettingsFragment.this.getActivity().getPackageName())));
                        } catch (ActivityNotFoundException e) {
                        }
                    }
                }).show();
            } else if (!isInstallerPresent()) {
                new AlertDialog.Builder(getActivity(), R.style.AppCompatAlertDialogStyle).setTitle((int) R.string.d_no_xposed).setMessage((int) R.string.d_no_xposed_description).setCancelable(false).setPositiveButton((int) R.string.d_more_info, (DialogInterface.OnClickListener) new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int which) {
                        Intent i = new Intent("android.intent.action.VIEW");
                        i.setData(Uri.parse("http://forum.xda-developers.com/showthread.php?t=3034811"));
                        SettingsFragment.this.startActivity(i);
                    }
                }).setNeutralButton(17039360, (DialogInterface.OnClickListener) null).setIcon((int) R.drawable.ic_alert).show();
            }
        }
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        debugLog("SettingsFragment onActivityResult: requestCode=" + requestCode + " resultCode=" + resultCode + " data=" + data.toString());
        if (!this.bp.handleActivityResult(requestCode, resultCode, data)) {
            debugLog("ok: " + this.bp.toString());
            super.onActivityResult(requestCode, resultCode, data);
        }
    }

    public void onDestroy() {
        if (this.bp != null) {
            this.bp.release();
        }
        super.onDestroy();
    }

    /* access modifiers changed from: private */
    @SuppressLint({"CommitPrefEdits"})
    public void putPref(String pref, Boolean value) {
        sharedPrefs.edit().putBoolean(pref, value.booleanValue()).commit();
    }

    @SuppressLint({"CommitPrefEdits"})
    private void putPref(String pref, String value) {
        sharedPrefs.edit().putString(pref, value).commit();
    }

    private boolean hookFailed() {
        return false;
    }

    private int xposedVersionCheck() {
        return 0;
    }

    public boolean isInstallerPresent() {
        return Utils.isPackageInstalled("de.robv.android.xposed.installer", getActivity()) || Utils.isPackageInstalled("pro.burgerz.wsm.manager", getActivity());
    }

    private boolean isModuleActive() {
        return xposedVersionCheck() == 12;
    }

    private boolean isModuleActiveButOutdated() {
        return xposedVersionCheck() > 0 && xposedVersionCheck() != 12;
    }
}
