package com.fncvianca.myapp.models

import com.metrolist.innertube.models.YTItem

data class ItemsPage(
    val items: List<YTItem>,
    val continuation: String?,
)
