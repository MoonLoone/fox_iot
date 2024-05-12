package com.example.fox_iot.native_method

import android.util.Log
import com.example.fox_iot.native_method.models.BulbHSVColor
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.sdk.api.IResultCallback
import com.thingclips.smart.sdk.enums.ThingDevicePublishModeEnum
import io.flutter.plugin.common.MethodCall

enum class DPS_IDS(val value: String) {
    bright_value("23"), //0..1000
    switch_led("20"),   //boolean
    work_mode("21"),
    colour_data_v2("24")
}

class BulbStateChange {

    fun changeBulbState(args: Map<String, String?>, callback: (String) -> Unit) {
        val bulbId = args[BULB_ID]
        val newState = args[TURN_ON_OFF].toBoolean()
        val device = ThingHomeSdk.newDeviceInstance(bulbId)
        val dps = argsToDps(args)
        val typeObject = object : TypeToken<HashMap<String, Any>?>() {}.type
        val jsonString: String = Gson().toJson(dps, typeObject)
        Log.d("?!", jsonString)
        device.publishDps(jsonString, ThingDevicePublishModeEnum.ThingDevicePublishModeMqtt, object : IResultCallback {
            override fun onError(code: String?, error: String?) {
                Log.d("?!", "Error")
            }

            override fun onSuccess() {
                callback("$newState")
            }

        })
    }

    private fun argsToDps(args: Map<String, String?>) = mapOf<String, Any?>(
            DPS_IDS.switch_led.value to args[TURN_ON_OFF]?.toBoolean(),
            DPS_IDS.bright_value.value to args[BRIGHT_LEVEL]?.toInt(),
            DPS_IDS.work_mode.value to "colour",
            DPS_IDS.colour_data_v2.value to BulbHSVColor.fromMap(args[COLOUR_DATA]),
            )

    companion object : IFoxIoTNativeMethod {
        override val methodName: String = "on_off_bulb"

        const val BULB_ID = "bulb_id"
        const val TURN_ON_OFF = "new_bulb_state"
        const val COLOUR_DATA = "color_data"
        const val BRIGHT_LEVEL = "bright_level"
        const val MAIN_COLOR = "main_color"

        fun MethodCall.toOnOffBulbMap() = mapOf(
                BULB_ID to argument<String>(BULB_ID),
                TURN_ON_OFF to argument<String>(TURN_ON_OFF),
                COLOUR_DATA to argument<String>(COLOUR_DATA),
        )

    }

}