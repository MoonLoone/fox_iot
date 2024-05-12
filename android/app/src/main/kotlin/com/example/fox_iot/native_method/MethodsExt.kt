package com.example.fox_iot.native_method

import com.example.fox_iot.native_method.models.NativeDevice
import com.example.fox_iot.native_method.models.NativeHome
import com.example.fox_iot.native_method.models.NativeRoom
import com.thingclips.smart.home.sdk.bean.HomeBean
import com.thingclips.smart.sdk.bean.DeviceBean

fun HomeBean.toDomain() =
        NativeHome(name = this.name, rooms = rooms.map { NativeRoom(name = it.name) }, id = this.homeId)

fun DeviceBean.toDomain() = NativeDevice(name = name, id = devId, type = productBean.category.toString())


