package com.example.fox_iot.native_method

import android.util.Log
import com.example.fox_iot.native_method.models.DeviceInfoDTOType
import com.google.gson.Gson
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.bean.HomeBean
import com.thingclips.smart.home.sdk.callback.IThingHomeResultCallback
import com.thingclips.smart.sdk.api.IDeviceListener
import io.flutter.plugin.common.MethodCall
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.launch

class GetDeviceData {

    private val _infoFlow: MutableStateFlow<String> = MutableStateFlow("")
    val infoFlow: StateFlow<String> = _infoFlow

    fun startFlow(deviceId: String, deviceType: DeviceInfoDTOType, homeId: Long) {

        ThingHomeSdk.newHomeInstance(homeId).getHomeDetail(object : IThingHomeResultCallback {
            override fun onSuccess(bean: HomeBean?) {
                val dps = bean?.deviceList?.firstOrNull { it.devId == deviceId }?.getDps().toString()
                Log.d("?!", "Succes dps for device $deviceId: $dps")
            }

            override fun onError(errorCode: String?, errorMsg: String?) {
                Log.d("?!", "Error dps for device $deviceId: $errorCode $errorMsg")
            }

        })

        ThingHomeSdk.newDeviceInstance(deviceId).registerDeviceListener(object : IDeviceListener {

            override fun onDpUpdate(devId: String?, dpStr: MutableMap<String, Any>?) {
                val dataMap = dpStr?.filterKeys { deviceType.dpKeys.contains(it) }
                val jsonData = Gson().toJson(dataMap)
                Log.d("?!", jsonData)
                if (dataMap?.isNotEmpty() == true) _infoFlow.value = jsonData
            }

            override fun onRemoved(devId: String?) {}

            override fun onStatusChanged(devId: String?, online: Boolean) {
            }

            override fun onNetworkStatusChanged(devId: String?, status: Boolean) {}

            override fun onDevInfoUpdate(devId: String?) {}

        })
    }

    companion object : IFoxIoTNativeMethod {

        override val methodName: String = "get_device_data"

        const val DEVICE_ID = "devId"
        const val DEVICE_TYPE = "device_type"
        const val HOME_ID = "home_id"

        fun MethodCall.toGetDeviceData() = mapOf(
                DEVICE_ID to argument<String>(DEVICE_ID),
                DEVICE_TYPE to argument<String>(DEVICE_TYPE),
                HOME_ID to argument<String>(HOME_ID),
        )

    }

}