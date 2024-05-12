package com.example.fox_iot.native_method

import android.util.Log
import com.thingclips.smart.android.user.api.ILoginCallback
import com.thingclips.smart.android.user.bean.User
import com.thingclips.smart.home.sdk.ThingHomeSdk

object VerifyUserMethod: IFoxIoTNativeMethod {

    override val methodName: String = "verify_user"
    private val userManager = ThingHomeSdk.getUserInstance()

    fun methodInvoke(args: Map<String, String?>, callback: (String) -> Unit) {
        val name = "mmaks02@yandex.ru"
        val countryCode = "643"
        val passw = "m040502m"
        userManager.loginWithEmail(
                countryCode,
                name,
                passw,
                object : ILoginCallback {
                    override fun onSuccess(user: User?) {
                        callback.invoke(true.toString())
                    }

                    override fun onError(code: String?, error: String?) {
                        Log.e("UserLogin", error.toString() + code.toString())
                    }

                }
        )
    }

}