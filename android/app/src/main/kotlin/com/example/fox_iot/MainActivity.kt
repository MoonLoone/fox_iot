package com.example.fox_iot

import android.util.Log
import android.widget.Toast
import com.thingclips.smart.android.user.api.IWhiteListCallback
import com.thingclips.smart.android.user.bean.WhiteList
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import com.thingclips.smart.home.sdk.ThingHomeSdk

class MainActivity : FlutterActivity() {

    private val channelName = "fox_iot"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
        channel.setMethodCallHandler { call, result ->

            when (call.method) {
                "send_event" -> {
                    ThingHomeSdk.getUserInstance().getWhiteListWhoCanSendMobileCodeSuccess(object : IWhiteListCallback{
                        override fun onSuccess(whiteList: WhiteList?) {
                            Log.d("!!!", "Success")
                        }

                        override fun onError(code: String?, error: String?) {
                            Log.d("!!!", "Error")
                        }

                    })
                }

                else -> {
                    Toast.makeText(context, "Error while call channek method", Toast.LENGTH_SHORT)
                        .show()
                }
            }

        }
    }

}
