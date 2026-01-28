package com.smbtv.util;

import android.content.Context;
import android.content.SharedPreferences;

import androidx.annotation.NonNull;

/**
 * Utility class for managing application preferences
 */
public class PreferencesManager {

    private static final String PREFS_NAME = "smbtv_prefs";
    private final SharedPreferences preferences;

    public PreferencesManager(@NonNull Context context) {
        this.preferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    public void saveString(@NonNull String key, String value) {
        preferences.edit().putString(key, value).apply();
    }

    public String getString(@NonNull String key, String defaultValue) {
        return preferences.getString(key, defaultValue);
    }

    public void saveBoolean(@NonNull String key, boolean value) {
        preferences.edit().putBoolean(key, value).apply();
    }

    public boolean getBoolean(@NonNull String key, boolean defaultValue) {
        return preferences.getBoolean(key, defaultValue);
    }

    public void saveInt(@NonNull String key, int value) {
        preferences.edit().putInt(key, value).apply();
    }

    public int getInt(@NonNull String key, int defaultValue) {
        return preferences.getInt(key, defaultValue);
    }

    public void clear() {
        preferences.edit().clear().apply();
    }

    public void remove(@NonNull String key) {
        preferences.edit().remove(key).apply();
    }
}