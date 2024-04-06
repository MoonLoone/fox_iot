package com.example.fox_iot.native_method

import android.util.Log
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.sdk.api.IThingActivatorGetToken

object GetTokenMethod : IFoxIoTNativeMethod {
    override val methodName: String = "get_token"
    const val HOME_ID = "home_id"
    private val activator = ThingHomeSdk.getActivatorInstance()

    override fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val homeId =
            args[ConnectAPDeviceMethod.HOME_ID]?.toLong() ?: throw Exception("Home cant be null")
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

}