package com.example.fox_iot

import android.app.Application
import android.util.Log
import com.thingclips.smart.home.sdk.ThingHomeSdk

class FoxIoTApp: Application() {

    override fun onCreate() {
        super.onCreate()
        ThingHomeSdk.init(this)
    }

    override fun onTerminate() {
        super.onTerminate()
        ThingHomeSdk.onDestroy();
    }
}