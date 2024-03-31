package com.example.fox_iot

import com.example.fox_iot.native_method.ChannelMethodRecognizer
import com.example.fox_iot.native_method.CreateHomeMethod
import com.example.fox_iot.native_method.GetHomesMethod
import com.example.fox_iot.native_method.VerifyUserMethod
import com.example.fox_iot.native_method.toCreateHomeMap
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
        channel.setMethodCallHandler { call, result ->
            when (val method = ChannelMethodRecognizer.getMethod(call.method)) {
                CreateHomeMethod -> method.methodInvoke(call.toCreateHomeMap()) {
                    result.success(it)
                }

                VerifyUserMethod -> method.methodInvoke(emptyMap()) {
                    result.success(it)
                }

                GetHomesMethod -> method.methodInvoke(emptyMap()) {
                    result.success(it)
                }

                null -> result.notImplemented()
            }
        }
    }

    companion object {
        const val channelName = "fox_iot"
    }

}
