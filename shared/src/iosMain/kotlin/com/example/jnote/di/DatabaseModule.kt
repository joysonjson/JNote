//package com.plcoding.noteappkmm.di
//
//import com.plcoding.noteappkmm.data.local.DatabaseDriverFactory
//import com.plcoding.noteappkmm.data.note.SqlDelightNoteDataSource
//import com.plcoding.noteappkmm.database.NoteDatabase
//import com.plcoding.noteappkmm.domain.note.NoteDataSource
package  com.example.jnote.di
import  com.example.jnote.data.local.DatabaseDriverFactory
import  com.example.jnote.data.note.SqlDelightNoteDataSource
import com.example.jnote.database.NoteDatabase
import  com.example.jnote.domain.note.NoteDataSource
class DatabaseModule {

    private val factory by lazy { DatabaseDriverFactory() }
    val noteDataSource: NoteDataSource by lazy {
        SqlDelightNoteDataSource(NoteDatabase(factory.createDriver()))
    }
}