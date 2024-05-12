package com.example.fox_iot.native_method.models

import com.google.gson.Gson
import java.util.Locale

data class BulbHSVColor(
        val h: Int,
        val s: Int,
        val v: Int
) {
    companion object {
        fun fromMap(colorJson: String?): String? {
            if (colorJson == null) return null
            val mapped = Gson().fromJson(colorJson, BulbHSVColor::class.java)
            return mapped.h.decimalToHex() + mapped.s.decimalToHex() + mapped.v.decimalToHex()
        }

    }
}

private const val COLOR_LENGTH = 4

private fun Int.decimalToHex(): String {
    val converted = toString(16).toUpperCase(Locale.ROOT)
    return converted.padStart(COLOR_LENGTH, '0')
}
