package com.example.fox_iot.native_method

import android.util.Log
import com.example.fox_iot.native_method.models.NativeHome
import com.example.fox_iot.native_method.models.NativeRoom
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.bean.HomeBean
import com.thingclips.smart.home.sdk.callback.IThingHomeResultCallback
import io.flutter.plugin.common.MethodCall

class CreateHomeMethod {

    private val homeManager = ThingHomeSdk.getHomeManagerInstance()

    fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val name = args[HOME_NAME]
        val location = args[LOCATION]
        homeManager.createHome(name, .0, .0, location, emptyList(), object :
                IThingHomeResultCallback {

            override fun onSuccess(bean: HomeBean?) {
                callback(bean?.toDomain()?.toJson() ?: "")
            }

            override fun onError(code: String?, error: String?) {
                Log.d("HomeCreation", error.toString() + code.toString())
            }

        });
    }

    companion object : IFoxIoTNativeMethod {
        override val methodName: String = "createHome"

        const val HOME_NAME = "homeName"
        const val LOCATION = "location"

        fun MethodCall.toCreateHomeMap() = mapOf(
                HOME_NAME to argument<String>(HOME_NAME),
                LOCATION to argument<String>(LOCATION),
        )

    }

}
