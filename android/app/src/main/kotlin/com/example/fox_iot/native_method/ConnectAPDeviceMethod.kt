package com.example.fox_iot.native_method

import android.content.Context
import android.util.Log
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.builder.ActivatorBuilder
import com.thingclips.smart.sdk.api.IThingActivatorGetToken
import com.thingclips.smart.sdk.api.IThingSmartActivatorListener
import com.thingclips.smart.sdk.bean.DeviceBean
import com.thingclips.smart.sdk.enums.ActivatorModelEnum
import io.flutter.plugin.common.MethodCall

object ConnectAPDeviceMethod: IFoxIoTNativeMethod {

    private val activator = ThingHomeSdk.getActivatorInstance()

    override val methodName: String = "connect_using_ap"

    const val WIFI_NAME = "wifi_name"
    const val PASSWORD = "wifi_password"
    const val TOKEN = "token"

    fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
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
        val ssid = args[WIFI_NAME]
        val password = args[PASSWORD]
        val token = args[TOKEN]
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

    fun MethodCall.toConnectAPDeviceMap() = mapOf(
            WIFI_NAME to argument<String>(WIFI_NAME),
            PASSWORD to argument<String>(PASSWORD),
            TOKEN to argument<String>(TOKEN)
    )

}
