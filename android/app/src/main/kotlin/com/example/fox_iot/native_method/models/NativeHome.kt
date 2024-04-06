package com.example.fox_iot.native_method.models

import com.google.gson.Gson

data class NativeHome(
    val id: Long,
    val name: String,
    val rooms: List<NativeRoom>
){

    fun toJson() = Gson().toJson(this)

}
