package com.example.fox_iot.native_method

import android.util.Log
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.builder.ThingGwActivatorBuilder
import com.thingclips.smart.home.sdk.builder.ThingGwSubDevActivatorBuilder
import com.thingclips.smart.sdk.api.IThingSmartActivatorListener
import com.thingclips.smart.sdk.bean.DeviceBean
import io.flutter.plugin.common.MethodCall

class ConnectZigbeeDevice {

    fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val hubId = args[HUB_ID]
        val activatorBuilder = ThingGwSubDevActivatorBuilder()
            .setDevId(hubId)
            .setTimeOut(100)
            .setListener(object : IThingSmartActivatorListener {
                override fun onError(errorCode: String?, errorMsg: String?) {
                    Log.e("?!", errorCode + errorMsg)
                }

                override fun onActiveSuccess(devResp: DeviceBean?) {
                    callback.invoke(devResp?.uiName.toString())
                }

                override fun onStep(step: String?, data: Any?) {
                    Log.d("?!", "Step $step $data")
                }

            })
        ThingHomeSdk.getActivatorInstance().newGwSubDevActivator(activatorBuilder).start()
    }

    companion object: IFoxIoTNativeMethod{
        override val methodName: String = "connect_zigbee"

        const val HUB_ID = "hub_id"

        fun MethodCall.toConnectZigbee() = mapOf(
                HUB_ID to argument<String>(HUB_ID),
        )

    }

}