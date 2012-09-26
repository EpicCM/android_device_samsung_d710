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

import java.io.File;
import java.io.Writer;
import java.io.OutputStreamWriter;
import java.io.FileWriter;
import java.io.Reader;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.SyncFailedException;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Context;

public class Utils {

    private static final String TAG = "GalaxyS2Settings_Utils";
    private static final String TAG_READ = "GalaxyS2Settings_Utils_Read";
    private static final String TAG_WRITE = "GalaxyS2Settings_Utils_Write";

     /**
     * Write a string value to the specified NEW file.
     * 
     * @param filename The filename
     * @param value The value 
     */

    public static String readVar(String filename, String variable) {
        FileReader fdr = null;
        try {
            fdr = new FileReader(filename);
            BufferedReader buffer = null;
            buffer = new BufferedReader(fdr);
            String s;
            String result;
            while((s = buffer.readLine()) != null) { 
            if (s.contains(variable)) {
                result = s.substring(s.indexOf(variable) + variable.length() + 1);
                return result;
            } else {
                return null;
            }
            }      
            buffer.close();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + filename + " not found: " + ex);
            return null;
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + filename + ": " + ex);
            return null;
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
            return null;
        } finally {
            if (fdr != null) {
                try {
                    Log.w(TAG_WRITE, "file " + filename + ": " + variable);
                    fdr.close();
                    return null;
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                    return null;
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                    return null;
                }
            }
        }
    return null;
    }


     /**
     * Write a string value to the specified NEW file.
     * 
     * @param filename The filename
     * @param value The value 
     */

    public static void newFile(String filename, String value) {
        FileWriter fwr = null;
        try {
            fwr = new FileWriter(filename);
            fwr.write(value);
            fwr.flush();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + filename + " not found: " + ex);
        } catch (SyncFailedException ex) {
            Log.w(TAG, "file " + filename + " sync failed: " + ex);
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + filename + ": " + ex);
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
        } finally {
            if (fwr != null) {
                try {
                    Log.w(TAG_WRITE, "file " + filename + ": " + value);
                    fwr.close();
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                }
            }
        }

    }

    /**
     * Append a string value to the specified file.
     * 
     * @param filename The filename
     * @param value The value 
     */

    public static void appendFile(String filename, String value) {
        FileWriter fwr = null;
        try {
            fwr = new FileWriter(filename, true);
            fwr.write(value);
            fwr.flush();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + filename + " not found: " + ex);
        } catch (SyncFailedException ex) {
            Log.w(TAG, "file " + filename + " sync failed: " + ex);
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + filename + ": " + ex);
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
        } finally {
            if (fwr != null) {
                try {
                    Log.w(TAG_WRITE, "file " + filename + ": " + value);
                    fwr.close();
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                }
            }
        }

    }

    /**
     * Write a string value to the specified file.
     * 
     * @param filename The filename
     * @param value The value 
     */
 public static void writeValue(String filename, String value) {
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(new File(filename), false);
            fos.write(value.getBytes());
            fos.flush();
            // fos.getFD().sync();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + filename + " not found: " + ex);
        } catch (SyncFailedException ex) {
            Log.w(TAG, "file " + filename + " sync failed: " + ex);
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + filename + ": " + ex);
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
        } finally {
            if (fos != null) {
                try {
                    Log.w(TAG_WRITE, "file " + filename + ": " + value);
                    fos.close();
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                }
            }
        }

    }

    /**
     * Write a string value to the specified file.
     * 
     * @param filename The filename
     * @param value The value
     */
    public static void writeValue(String filename, Boolean value) {
        FileOutputStream fos = null;
        String sEnvia;
        try {
            fos = new FileOutputStream(new File(filename), false);
            if (value)
                sEnvia = "1";
            else
                sEnvia = "0";
            fos.write(sEnvia.getBytes());
            fos.flush();
            // fos.getFD().sync();
        } catch (FileNotFoundException ex) {
            Log.w(TAG, "file " + filename + " not found: " + ex);
        } catch (SyncFailedException ex) {
            Log.w(TAG, "file " + filename + " sync failed: " + ex);
        } catch (IOException ex) {
            Log.w(TAG, "IOException trying to sync " + filename + ": " + ex);
        } catch (RuntimeException ex) {
            Log.w(TAG, "exception while syncing file: ", ex);
        } finally {
            if (fos != null) {
                try {
                    Log.w(TAG_WRITE, "file " + filename + ": " + value);
                    fos.close();
                } catch (IOException ex) {
                    Log.w(TAG, "IOException while closing synced file: ", ex);
                } catch (RuntimeException ex) {
                    Log.w(TAG, "exception while closing file: ", ex);
                }
            }
        }
    }

    /**
     * Write the "color value" to the specified file. The value is scaled from
     * an integer to an unsigned integer by multiplying by 2.
     * @param filename      The filename
     * @param value         The value of max value Integer.MAX
     */
    public static void writeColor(String filename, int value) {
        writeValue(filename, String.valueOf((long) value * 2));
    }

    /**
     * Check if the specified file exists.
     * @param filename      The filename
     * @return              Whether the file exists or not
     */
    public static boolean fileExists(String filename) {
        return new File(filename).exists();
    }


    public static void showDialog(Context ctx, String title, String message) {
        final AlertDialog alertDialog = new AlertDialog.Builder(ctx).create();
        alertDialog.setTitle(title);
        alertDialog.setMessage(message);
        alertDialog.setButton("OK", new DialogInterface.OnClickListener() {
           public void onClick(DialogInterface dialog, int which) {
              alertDialog.dismiss();
           }
        });
        alertDialog.show();
    }
}
