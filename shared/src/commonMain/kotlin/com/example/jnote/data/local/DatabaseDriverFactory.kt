package com.example.jnote.data.local////package com.plcoding.noteappkmm.data.local
//package  com.example.jnote.data.local
import com.squareup.sqldelight.db.SqlDriver
//
expect class DatabaseDriverFactory {
    fun createDriver(): SqlDriver
}