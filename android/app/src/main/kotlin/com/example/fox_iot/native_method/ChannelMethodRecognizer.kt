package com.example.fox_iot.native_method

import android.util.Log

object ChannelMethodRecognizer {

    fun getMethod(methodName: String): IFoxIoTNativeMethod? = when (methodName) {
        CreateHomeMethod.methodName -> CreateHomeMethod
        VerifyUserMethod.methodName -> VerifyUserMethod
        GetHomesMethod.methodName -> GetHomesMethod
        ConnectAPDeviceMethod.methodName -> ConnectAPDeviceMethod
        GetTokenMethod.methodName -> GetTokenMethod
        GetDevicesMethod.methodName -> GetDevicesMethod
        ConnectZigbeeDevice.methodName -> ConnectZigbeeDevice
        else -> {
            Log.e("!!!", "Undefined native method")
            null
        }
    }

}
