package com.smbtv.util;

import android.util.Log;

/**
 * Logging utility class
 */
public class Logger {

    private static final boolean DEBUG = true;

    public static void d(String tag, String message) {
        if (DEBUG) {
            Log.d(tag, message);
        }
    }

    public static void e(String tag, String message, Throwable tr) {
        Log.e(tag, message, tr);
    }

    public static void i(String tag, String message) {
        if (DEBUG) {
            Log.i(tag, message);
        }
    }

    public static void w(String tag, String message) {
        Log.w(tag, message);
    }
}