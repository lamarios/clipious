package com.github.lamarios.clipious

import io.flutter.embedding.android.FlutterActivity
import cl.puntito.simple_pip_mode.PipCallbackHelper
import com.ryanheise.audioservice.AudioServiceActivity;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.FlutterEngine
import android.content.res.Configuration
class MainActivity : AudioServiceActivity() {
    private var callbackHelper = PipCallbackHelper()

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        callbackHelper.configureFlutterEngine(flutterEngine)
    }

    override fun onPictureInPictureModeChanged(active: Boolean, newConfig: Configuration?) {
        callbackHelper.onPictureInPictureModeChanged(active)
    }
}
