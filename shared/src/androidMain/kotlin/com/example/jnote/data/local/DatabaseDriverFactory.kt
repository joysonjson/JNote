//package com.exa.noteappkmm.data.local
package com.example.jnote.data.local
import android.content.Context
//import com.plcoding.noteappkmm.database.NoteDatabase
import  com.example.jnote.database.NoteDatabase
import com.squareup.sqldelight.android.AndroidSqliteDriver
import com.squareup.sqldelight.db.SqlDriver

actual class DatabaseDriverFactory(private val context: Context) {
    actual fun createDriver(): SqlDriver {
        return AndroidSqliteDriver(NoteDatabase.Schema, context, "note.db")
    }
}