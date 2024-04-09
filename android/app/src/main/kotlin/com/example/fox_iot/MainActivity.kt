package com.example.fox_iot

import com.example.fox_iot.native_method.ChannelMethodRecognizer
import com.example.fox_iot.native_method.ConnectAPDeviceMethod
import com.example.fox_iot.native_method.ConnectZigbeeDevice
import com.example.fox_iot.native_method.CreateHomeMethod
import com.example.fox_iot.native_method.GetDeviceData
import com.example.fox_iot.native_method.GetDevicesMethod
import com.example.fox_iot.native_method.GetHomesMethod
import com.example.fox_iot.native_method.GetTokenMethod
import com.example.fox_iot.native_method.VerifyUserMethod
import com.example.fox_iot.native_method.models.DeviceInfoDTOType
import com.example.fox_iot.native_method.toConnectAPDeviceMap
import com.example.fox_iot.native_method.toConnectZigbee
import com.example.fox_iot.native_method.toCreateHomeMap
import com.example.fox_iot.native_method.toGetDevicesMap
import com.example.fox_iot.native_method.toGetTokenMap
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
            when (val method = ChannelMethodRecognizer.getMethod(call.method)) {
                CreateHomeMethod -> method.methodInvoke(call.toCreateHomeMap()) {
                    result.success(it)
                }

                VerifyUserMethod -> method.methodInvoke(emptyMap()) {
                    result.success(it)
                }

                GetHomesMethod -> method.methodInvoke(emptyMap()) {
                    result.success(it)
                }

                ConnectAPDeviceMethod -> (method as ConnectAPDeviceMethod).methodInvokeWithContext(
                    call.toConnectAPDeviceMap(),
                    {
                        result.success(it)
                    },
                    this
                )

                null -> result.notImplemented()

                GetTokenMethod -> method.methodInvoke(call.toGetTokenMap()) {
                    result.success(it)
                }

                GetDevicesMethod -> method.methodInvoke(call.toGetDevicesMap()) {
                    result.success(it)
                }

                ConnectZigbeeDevice -> method.methodInvoke(call.toConnectZigbee()) {
                    result.success(it)
                }

            }
        }
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
                    GetDeviceData.startFlow(deviceId!!, deviceType!!)
                    CoroutineScope(Dispatchers.Main).launch {
                        GetDeviceData.infoFlow.collectLatest {
                            events?.success(it)
                        }
                    }
                }

                override fun onCancel(args: Any?) {

                }

            }
        )
    }

    companion object {
        const val channelName = "fox_iot"
        const val eventChannelDeviceInfo = "get_device_info"
    }

}
