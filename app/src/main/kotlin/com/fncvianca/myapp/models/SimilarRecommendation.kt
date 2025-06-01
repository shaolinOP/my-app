package com.fncvianca.myapp.models

import com.metrolist.innertube.models.YTItem
import com.fncvianca.myapp.db.entities.LocalItem

data class SimilarRecommendation(
    val title: LocalItem,
    val items: List<YTItem>,
)
