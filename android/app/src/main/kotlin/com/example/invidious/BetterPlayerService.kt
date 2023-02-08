package com.example.invidious;

import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.IBinder
import android.util.Log

class BetterPlayerService : Service() {
    override fun onBind(intent: Intent?): IBinder? {
        return null;
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return START_NOT_STICKY;
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        val notificationManager =
                getSystemService(
                        Context.NOTIFICATION_SERVICE) as NotificationManager
        notificationManager.cancelAll();
        stopSelf();
    }
}