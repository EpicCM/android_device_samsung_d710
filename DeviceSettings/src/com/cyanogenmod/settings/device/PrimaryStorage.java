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

import android.util.Log;

import java.io.IOException;
import android.content.Context;
import android.util.AttributeSet;
import android.content.SharedPreferences;
import android.preference.Preference;
import android.preference.ListPreference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceManager;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;

public class PrimaryStorage extends ListPreference implements OnPreferenceChangeListener {

    public PrimaryStorage(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.setOnPreferenceChangeListener(this);
    }

    private static final String FILE = "/data/system/storage.rc";
    private static final String TAG = "GalaxyS2Settings_Storage";
    
    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    /**
     * Restore vibrator intensity setting from SharedPreferences. (Write to kernel.)
     * @param context       The context to read the SharedPreferences from
     */
    public static void restore(Context context) {
        if (!isSupported()) {
            Log.v(TAG, "No storage.rc file found, creating.");
            Utils.writeValue(FILE,"export EXTERNAL_STORAGE /storage/sdcard0" + System.getProperty( "line.separator" ), false);
            Utils.writeValue(FILE,"export SECONDARY_STORAGE /storage/sdcard1" + System.getProperty( "line.separator" ), true);
        } else { 
            SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
            Log.v(TAG, "Loading preference file, Primary storage is " + sharedPrefs.getString(DeviceSettings.KEY_PRIMARY_STORAGE, "sdcard0"));
            Utils.writeValue(FILE,"export EXTERNAL_STORAGE " + sharedPrefs.getString(DeviceSettings.KEY_PRIMARY_STORAGE, "sdcard0") + System.getProperty( "line.separator" ), false);
            if (sharedPrefs.getString(DeviceSettings.KEY_PRIMARY_STORAGE, "sdcard0").equals("sdcard1")) {
                Utils.writeValue(FILE,"export SECONDARY_STORAGE /storage/sdcard0" + System.getProperty( "line.separator" ), true);
            } else if (sharedPrefs.getString(DeviceSettings.KEY_PRIMARY_STORAGE, "sdcard0").equals("sdcard0")) {
                Utils.writeValue(FILE,"export SECONDARY_STORAGE /storage/sdcard1" + System.getProperty( "line.separator" ), true);       
            }
        }
        }

    public boolean onPreferenceChange(Preference preference, Object newValue) {
        Log.v(TAG, "Setting Primary Storage to " + (String) newValue );
        if (newValue.equals("sdcard1")) {
            Utils.writeValue(FILE,"export EXTERNAL_STORAGE /storage/sdcard1" + System.getProperty( "line.separator" ), false);
            Utils.writeValue(FILE,"export SECONDARY_STORAGE /storage/sdcard0" + System.getProperty( "line.separator" ), true);
        } else if (newValue.equals("sdcard0")) {
            Utils.writeValue(FILE,"export EXTERNAL_STORAGE /storage/sdcard0" + System.getProperty( "line.separator" ), false);
            Utils.writeValue(FILE,"export SECONDARY_STORAGE /storage/sdcard1" + System.getProperty( "line.separator" ), true);       
        }
          /**  Utils.showDialog((Context)this, "Reboot Required!", "Reboot required before changes will take effect!"); **/
            return true;
        }

}
