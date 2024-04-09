package com.example.fox_iot.native_method

import android.util.Log
import com.example.fox_iot.native_method.models.DeviceInfoDTOType
import com.google.gson.Gson
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.sdk.api.IDeviceListener
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.launch

object GetDeviceData {

    const val DEVICE_ID = "devId"
    const val DEVICE_TYPE = "device_type"

    private val _infoFlow: MutableStateFlow<String> = MutableStateFlow("")
    val infoFlow: StateFlow<String> = _infoFlow

    /*override val methodName: String = "get_device_data"

    const val DEVICE_ID = "devId"
    const val DEVICE_TYPE = "device_type"

    override fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val deviceId = args[DEVICE_ID];
        val deviceType = DeviceInfoDTOType.values().first { it.externalName == args[DEVICE_TYPE] }
        ThingHomeSdk.newDeviceInstance(deviceId).registerDeviceListener(object : IDeviceListener {

            override fun onDpUpdate(devId: String?, dpStr: MutableMap<String, Any>?) {
                val dataMap = dpStr?.filterKeys { deviceType.dpKeys.contains(it) }
                val jsonData = Gson().toJson(dataMap)
                if (dataMap?.isNotEmpty() == true) callback(jsonData)
            }

            override fun onRemoved(devId: String?) {}

            override fun onStatusChanged(devId: String?, online: Boolean) {
            }

            override fun onNetworkStatusChanged(devId: String?, status: Boolean) {}

            override fun onDevInfoUpdate(devId: String?) {}

        })
    }*/

    fun startFlow(deviceId: String, deviceType: DeviceInfoDTOType) {
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

}