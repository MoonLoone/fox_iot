package com.example.fox_iot.native_method

import com.example.fox_iot.native_method.models.NativeHome
import com.example.fox_iot.native_method.models.NativeRoom
import com.thingclips.smart.home.sdk.bean.HomeBean
import io.flutter.plugin.common.MethodCall

fun MethodCall.toCreateHomeMap() = mapOf(
    CreateHomeMethod.HOME_NAME to argument<String>(CreateHomeMethod.HOME_NAME),
    CreateHomeMethod.LOCATION to argument<String>(CreateHomeMethod.LOCATION),
)

fun HomeBean.toDomain() =
    NativeHome(name = this.name, rooms = rooms.map { NativeRoom(name = it.name) })
