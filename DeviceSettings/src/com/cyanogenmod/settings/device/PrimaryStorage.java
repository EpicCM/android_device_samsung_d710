/*
 * Copyright (C) 2012 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import java.io.IOException;
import android.content.Context;
import android.util.AttributeSet;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.ListPreference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;

public class PrimaryStorage extends ListPreference implements OnPreferenceChangeListener {

    public PrimaryStorage(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.setOnPreferenceChangeListener(this);
    }

    private static final String FILE = "/data/system/storage.rc";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    /**
     * Restore vibrator intensity setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
        Utils.NewFile(FILE, "export PHONE_STORAGE /mnt/sdcard");
        Utils.AppendFile(FILE,"export EXTERNAL_STORAGE /mnt/external_sd");
        }
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        Utils.NewFile(FILE, "export PHONE_STORAGE /mnt/sdcard");
        Utils.AppendFile(FILE,"export EXTERNAL_STORAGE " + sharedPrefs.getString(DeviceSettings.KEY_PRIMARY_STORAGE, "/mnt/external_sd"));
        }

    public boolean onPreferenceChange(Preference preference, Object newValue) {
        if ((String) newValue == "/mnt/sdcard") {
        Utils.NewFile(FILE, "export PHONE_STORAGE /mnt/external_sd");
        Utils.AppendFile(FILE,"export EXTERNAL_STORAGE /mnt/sdcard"); 
        } else {
        Utils.NewFile(FILE, "export PHONE_STORAGE /mnt/sdcard");
        Utils.AppendFile(FILE,"export EXTERNAL_STORAGE /mnt/external_sd");
        }
        return true;
    }

}
