package com.example.fox_iot.native_method

import android.util.Log
import com.example.fox_iot.native_method.models.NativeDevice
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.bean.HomeBean
import com.thingclips.smart.home.sdk.callback.IThingHomeResultCallback
import io.flutter.plugin.common.MethodCall

class GetDevicesMethod {

    fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val homeId = args[HOME_ID]?.toLong()!!
        ThingHomeSdk.newHomeInstance(homeId).getHomeDetail(object : IThingHomeResultCallback {

            override fun onSuccess(bean: HomeBean?) {
                Log.d("?!", bean?.deviceList?.map { "${it.name}:  ${it.getDps()}, Access: ${it.accessType}" }.toString())
                val domainList = bean?.deviceList?.map { it.toDomain() }
                val type = object : TypeToken<List<NativeDevice>>() {}.type
                callback(Gson().toJson(domainList, type))
            }

            override fun onError(errorCode: String?, errorMsg: String?) {
                Log.e("?!", errorMsg + errorCode)
            }

        })
    }

    companion object : IFoxIoTNativeMethod {
        override val methodName: String = "get_devices"
        const val HOME_ID = "home_id"

        fun MethodCall.toGetDevicesMap() = mapOf(
                HOME_ID to argument<String>(HOME_ID),
        )

    }

}