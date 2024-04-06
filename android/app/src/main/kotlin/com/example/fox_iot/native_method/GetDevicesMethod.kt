package com.example.fox_iot.native_method

import android.util.Log
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.bean.HomeBean
import com.thingclips.smart.home.sdk.callback.IThingHomeResultCallback

object GetDevicesMethod : IFoxIoTNativeMethod {
    override val methodName: String = "get_devices"
    const val HOME_ID = "home_id"

    override fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val homeId = args[HOME_ID]?.toLong()!!
        ThingHomeSdk.newHomeInstance(homeId).getHomeDetail(object : IThingHomeResultCallback {
            override fun onSuccess(bean: HomeBean?) {
                callback.invoke(bean?.deviceList.toString())
            }

            override fun onError(errorCode: String?, errorMsg: String?) {
                Log.e("?!", errorMsg + errorCode)
            }

        })
    }

}