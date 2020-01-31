package com.thetonyp.batteryshutdownmanager;

import android.app.Activity;
import android.app.FragmentTransaction;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.widget.AppCompatCheckBox;
import android.support.v7.widget.AppCompatCheckedTextView;
import android.support.v7.widget.AppCompatEditText;
import android.support.v7.widget.AppCompatRadioButton;
import android.support.v7.widget.AppCompatSpinner;
import android.support.v7.widget.Toolbar;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;

public class SettingsActivity extends Activity {
    public Context mContext;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mContext = this;
        getFragmentManager().beginTransaction().replace(16908290, new SettingsFragment()).commit();
        PreferenceManager.setDefaultValues(this, R.xml.preferences, false);
    }

    /* access modifiers changed from: protected */
    public void onPostCreate(Bundle savedInstanceState) {
        super.onPostCreate(savedInstanceState);
        LinearLayout root = (LinearLayout) findViewById(16908298).getParent().getParent().getParent();
        Toolbar bar = (Toolbar) LayoutInflater.from(this).inflate(R.layout.settings_toolbar, root, false);
        root.addView(bar, 0);
        bar.setNavigationOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                SettingsActivity.this.finish();
            }
        });
    }

    public View onCreateView(String name, Context context, AttributeSet attrs) {
        View result = super.onCreateView(name, context, attrs);
        if (result != null) {
            return result;
        }
        if (Build.VERSION.SDK_INT < 21) {
            char c = 65535;
            switch (name.hashCode()) {
                case -1455429095:
                    if (name.equals("CheckedTextView")) {
                        c = 4;
                        break;
                    }
                    break;
                case -339785223:
                    if (name.equals("Spinner")) {
                        c = 1;
                        break;
                    }
                    break;
                case 776382189:
                    if (name.equals("RadioButton")) {
                        c = 3;
                        break;
                    }
                    break;
                case 1601505219:
                    if (name.equals("CheckBox")) {
                        c = 2;
                        break;
                    }
                    break;
                case 1666676343:
                    if (name.equals("EditText")) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    return new AppCompatEditText(this, attrs);
                case 1:
                    return new AppCompatSpinner((Context) this, attrs);
                case 2:
                    return new AppCompatCheckBox(this, attrs);
                case 3:
                    return new AppCompatRadioButton(this, attrs);
                case 4:
                    return new AppCompatCheckedTextView(this, attrs);
            }
        }
        return null;
    }

    /* access modifiers changed from: protected */
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        SettingsFragment fragment = (SettingsFragment) getFragmentManager().findFragmentById(16908290);
        if (fragment != null) {
            fragment.onActivityResult(requestCode, resultCode, data);
        }
    }

    public void restartFragment() {
        SettingsFragment fragment = new SettingsFragment();
        FragmentTransaction ft = getFragmentManager().beginTransaction();
        ft.setCustomAnimations(17498112, 17498113).replace(16908290, fragment);
        ft.commit();
    }
}
