package com.example.fox_iot.native_method

import android.util.Log
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.builder.ThingGwActivatorBuilder
import com.thingclips.smart.home.sdk.builder.ThingGwSubDevActivatorBuilder
import com.thingclips.smart.sdk.api.IThingSmartActivatorListener
import com.thingclips.smart.sdk.bean.DeviceBean

object ConnectZigbeeDevice : IFoxIoTNativeMethod {

    const val HUB_ID = "hub_id"

    override val methodName: String = "connect_zigbee"

    override fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
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
}