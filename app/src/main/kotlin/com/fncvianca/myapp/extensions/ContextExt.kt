package com.fncvianca.myapp.extensions

import android.content.Context
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import com.fncvianca.myapp.constants.InnerTubeCookieKey
import com.fncvianca.myapp.constants.YtmSyncKey
import com.fncvianca.myapp.utils.dataStore
import com.fncvianca.myapp.utils.get
import com.metrolist.innertube.utils.parseCookieString
import kotlinx.coroutines.runBlocking

fun Context.isSyncEnabled(): Boolean {
    return runBlocking {
        dataStore.get(YtmSyncKey, true) && isUserLoggedIn()
    }
}

fun Context.isUserLoggedIn(): Boolean {
    return runBlocking {
        val cookie = dataStore[InnerTubeCookieKey] ?: ""
        "SAPISID" in parseCookieString(cookie) && isInternetConnected()
    }
}

fun Context.isInternetConnected(): Boolean {
    val connectivityManager = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
    val networkCapabilities = connectivityManager.getNetworkCapabilities(connectivityManager.activeNetwork)
    return networkCapabilities?.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) ?: false
}
