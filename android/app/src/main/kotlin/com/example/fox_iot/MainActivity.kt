package com.example.fox_iot

import com.example.fox_iot.native_method.ConnectAPDeviceMethod
import com.example.fox_iot.native_method.ConnectAPDeviceMethod.toConnectAPDeviceMap
import com.example.fox_iot.native_method.ConnectZigbeeDevice
import com.example.fox_iot.native_method.ConnectZigbeeDevice.Companion.toConnectZigbee
import com.example.fox_iot.native_method.CreateHomeMethod
import com.example.fox_iot.native_method.CreateHomeMethod.Companion.toCreateHomeMap
import com.example.fox_iot.native_method.GetDeviceData
import com.example.fox_iot.native_method.GetDevicesMethod
import com.example.fox_iot.native_method.GetDevicesMethod.Companion.toGetDevicesMap
import com.example.fox_iot.native_method.GetHomesMethod
import com.example.fox_iot.native_method.GetTokenMethod
import com.example.fox_iot.native_method.GetTokenMethod.Companion.toGetTokenMap
import com.example.fox_iot.native_method.BulbStateChange
import com.example.fox_iot.native_method.BulbStateChange.Companion.toOnOffBulbMap
import com.example.fox_iot.native_method.VerifyUserMethod
import com.example.fox_iot.native_method.models.DeviceInfoDTOType
import com.example.fox_iot.native_method.recognizeChannelMethod
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.flow.collectLatest
import kotlinx.coroutines.launch

class MainActivity : FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
        channel.setMethodCallHandler { call, result ->
            when (recognizeChannelMethod(call.method)) {
                CreateHomeMethod -> CreateHomeMethod().methodInvoke(call.toCreateHomeMap()) {
                    result.success(it)
                }

                VerifyUserMethod -> VerifyUserMethod.methodInvoke(emptyMap()) {
                    result.success(it)
                }

                GetHomesMethod -> GetHomesMethod().methodInvoke(emptyMap()) {
                    result.success(it)
                }

                ConnectAPDeviceMethod -> ConnectAPDeviceMethod.methodInvokeWithContext(
                        call.toConnectAPDeviceMap(),
                    {
                        result.success(it)
                    },
                    this
                )

                null -> result.notImplemented()

                GetTokenMethod -> GetTokenMethod().methodInvoke(call.toGetTokenMap()) {
                    result.success(it)
                }

                GetDevicesMethod -> GetDevicesMethod().methodInvoke(call.toGetDevicesMap()) {
                    result.success(it)
                }

                ConnectZigbeeDevice -> ConnectZigbeeDevice().methodInvoke(call.toConnectZigbee()) {
                    result.success(it)
                }

                GetDeviceData -> {
                    val getDevice = GetDeviceData()
                    EventChannel(
                            flutterEngine.dartExecutor.binaryMessenger,
                            eventChannelDeviceInfo
                    ).setStreamHandler(
                            object : EventChannel.StreamHandler {
                                override fun onListen(args: Any?, events: EventChannel.EventSink?) {
                                    val argsMap = args as Map<String, String>
                                    val deviceId = argsMap[GetDeviceData.DEVICE_ID]
                                    val deviceType =
                                            DeviceInfoDTOType.values()
                                                    .firstOrNull { it.externalName == args[GetDeviceData.DEVICE_TYPE] }
                                    val homeId = argsMap[GetDeviceData.HOME_ID]!!.toLong()
                                    getDevice.startFlow(deviceId!!, deviceType!!, homeId)
                                    CoroutineScope(Dispatchers.Main).launch {
                                        getDevice.infoFlow.collectLatest {
                                            events?.success(it)
                                        }
                                    }
                                }

                                override fun onCancel(args: Any?) {

                                }

                            }
                    )
                }

                BulbStateChange -> BulbStateChange().changeBulbState(call.toOnOffBulbMap()){
                    result.success(it)
                }

            }
        }
        
    }

    companion object {
        const val channelName = "fox_iot"
        const val eventChannelDeviceInfo = "get_device_info"
    }

}
