package com.example.fox_iot.native_method.models

enum class DeviceInfoDTOType(val dpKeys: List<String>, val externalName: String) {
    hub(emptyList(), "hub"),
    bulb(emptyList(), "bulb"),
    thermal(listOf("va_temperature", "va_humidity"), "thermal"),
    motion(emptyList(), "motion")
}
