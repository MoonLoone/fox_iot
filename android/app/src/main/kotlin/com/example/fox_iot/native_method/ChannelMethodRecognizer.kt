package com.example.fox_iot.native_method

import android.util.Log

object ChannelMethodRecognizer {

    fun getMethod(methodName: String): IFoxIoTNativeMethod? = when (methodName) {
        CreateHomeMethod.methodName -> CreateHomeMethod
        VerifyUserMethod.methodName -> VerifyUserMethod
        GetHomesMethod.methodName -> GetHomesMethod
        else -> {
            Log.e(methodName, "Undefined native method")
            null
        }
    }

}
