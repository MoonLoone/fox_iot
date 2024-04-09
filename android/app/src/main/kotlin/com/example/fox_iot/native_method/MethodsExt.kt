package com.example.fox_iot.native_method

import com.example.fox_iot.native_method.models.NativeDevice
import com.example.fox_iot.native_method.models.NativeHome
import com.example.fox_iot.native_method.models.NativeRoom
import com.thingclips.smart.home.sdk.bean.HomeBean
import com.thingclips.smart.sdk.bean.DeviceBean
import io.flutter.plugin.common.MethodCall

fun MethodCall.toCreateHomeMap() = mapOf(
    CreateHomeMethod.HOME_NAME to argument<String>(CreateHomeMethod.HOME_NAME),
    CreateHomeMethod.LOCATION to argument<String>(CreateHomeMethod.LOCATION),
)

fun MethodCall.toConnectAPDeviceMap() = mapOf(
    ConnectAPDeviceMethod.HOME_ID to argument<String>(ConnectAPDeviceMethod.HOME_ID),
    ConnectAPDeviceMethod.WIFI_NAME to argument<String>(ConnectAPDeviceMethod.WIFI_NAME),
    ConnectAPDeviceMethod.PASSWORD to argument<String>(ConnectAPDeviceMethod.PASSWORD),
    ConnectAPDeviceMethod.TOKEN to argument<String>(ConnectAPDeviceMethod.TOKEN)
)

fun MethodCall.toGetDevicesMap() = mapOf(
    GetDevicesMethod.HOME_ID to argument<String>(GetDevicesMethod.HOME_ID),
)

fun MethodCall.toConnectZigbee() = mapOf(
    ConnectZigbeeDevice.HUB_ID to argument<String>(ConnectZigbeeDevice.HUB_ID),
)

fun MethodCall.toGetTokenMap() = mapOf(
    GetTokenMethod.HOME_ID to argument<String>(ConnectAPDeviceMethod.HOME_ID),
)

fun MethodCall.toGetDeviceData() = mapOf(
    GetDeviceData.DEVICE_ID to argument<String>(GetDeviceData.DEVICE_ID),
    GetDeviceData.DEVICE_TYPE to argument<String>(GetDeviceData.DEVICE_TYPE),
)

fun HomeBean.toDomain() =
    NativeHome(name = this.name, rooms = rooms.map { NativeRoom(name = it.name) }, id = this.homeId)

fun DeviceBean.toDomain() = NativeDevice(name = name, id = devId, type = productBean.category.toString())


