package com.example.fox_iot.native_method

import android.util.Log
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.sdk.api.IThingActivatorGetToken
import io.flutter.plugin.common.MethodCall

class GetTokenMethod {

    private val activator = ThingHomeSdk.getActivatorInstance()

    fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val homeId =
            args[HOME_ID]?.toLong() ?: throw Exception("Home cant be null")
        activator.getActivatorToken(homeId,
            object : IThingActivatorGetToken {
                override fun onSuccess(token: String?) {
                    if (token != null) callback(token)
                    else Log.e("!!!", "Token is null")
                }

                override fun onFailure(errorCode: String?, errorMsg: String?) {
                    Log.e("!!!", errorCode + errorMsg)
                }
            })
    }

    companion object:IFoxIoTNativeMethod{
        override val methodName: String = "get_token"
        const val HOME_ID = "home_id"

        fun MethodCall.toGetTokenMap() = mapOf(
                HOME_ID to argument<String>(HOME_ID),
        )

    }

}