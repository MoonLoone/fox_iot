package com.example.fox_iot.native_method

import android.content.Context
import android.util.Log
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.builder.ActivatorBuilder
import com.thingclips.smart.sdk.api.IThingActivatorGetToken
import com.thingclips.smart.sdk.api.IThingSmartActivatorListener
import com.thingclips.smart.sdk.bean.DeviceBean
import com.thingclips.smart.sdk.enums.ActivatorModelEnum

object ConnectAPDeviceMethod : IFoxIoTNativeMethod {

    const val HOME_ID = "home_id"
    const val WIFI_NAME = "wifi_name"
    const val PASSWORD = "wifi_password"
    const val TOKEN = "token"

    override val methodName: String = "connect_using_ap"
    private val activator = ThingHomeSdk.getActivatorInstance()
    override fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val ssid = args[WIFI_NAME]
        val password = args[PASSWORD]
        val token = args[TOKEN]
        val builder = ActivatorBuilder()
            .setSsid(ssid)
            .setPassword(password)
            .setActivatorModel(ActivatorModelEnum.THING_AP)
            //.setTimeOut(10000)
            .setToken(token)
            .setListener(object : IThingSmartActivatorListener {
                override fun onError(errorCode: String?, errorMsg: String?) {
                    Log.e("?!", "Error $errorCode $errorMsg")
                }

                override fun onActiveSuccess(devResp: DeviceBean?) {
                    Log.e("?!", "Success $devResp")
                }

                override fun onStep(step: String?, data: Any?) {
                    Log.e("?!", "Step $step $data")
                }

            })


    }

    fun methodInvokeWithContext(
        args: Map<String, String?>,
        callback: (String) -> Unit,
        context: Context
    ) {
        val homeId = args[HOME_ID]?.toLong()
        val ssid = args[WIFI_NAME]
        val password = args[PASSWORD]
        val token = args[TOKEN]
        Log.d("?!", "Info $ssid $password $token")
        Log.d("?!", "Connecting...")
        val builder = ActivatorBuilder()
            .setSsid(ssid)
            .setPassword(password)
            .setContext(context)
            .setActivatorModel(ActivatorModelEnum.THING_AP)
            //.setTimeOut(10000)
            .setToken(token)
            .setListener(object : IThingSmartActivatorListener {
                override fun onError(errorCode: String?, errorMsg: String?) {
                    Log.e("?!", "Error $errorCode $errorMsg")
                }

                override fun onActiveSuccess(devResp: DeviceBean?) {
                    Log.e("?!", "Success $devResp")
                }

                override fun onStep(step: String?, data: Any?) {
                    Log.e("?!", "Step $step $data")
                }

            })
        activator.newActivator(builder).start()
    }

}
