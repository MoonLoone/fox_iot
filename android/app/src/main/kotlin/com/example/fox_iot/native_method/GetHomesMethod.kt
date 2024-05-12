package com.example.fox_iot.native_method

import android.util.Log
import com.example.fox_iot.native_method.models.NativeHome
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.thingclips.smart.home.sdk.ThingHomeSdk
import com.thingclips.smart.home.sdk.bean.HomeBean
import com.thingclips.smart.home.sdk.callback.IThingGetHomeListCallback

class GetHomesMethod {

    private val homeManager = ThingHomeSdk.getHomeManagerInstance()

    fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        homeManager.queryHomeList(object : IThingGetHomeListCallback{
            override fun onSuccess(homeBeans: MutableList<HomeBean>?) {
                val domainList = homeBeans?.map { it.toDomain() }
                val type = object : TypeToken<List<NativeHome>>() {}.type
                callback(Gson().toJson(domainList, type) )
            }

            override fun onError(errorCode: String?, error: String?) {
                Log.d("Native", "Error: $errorCode $error")
            }

        })
    }

    companion object:IFoxIoTNativeMethod{
        override val methodName: String = "get_homes"
    }

}