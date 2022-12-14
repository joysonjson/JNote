//package com.plcoding.noteappkmm.data.note
package  com.example.jnote.data.note

import com.example.jnote.domain.note.Note
import com.example.jnote.domain.time.DateTimeUtil

import database.NoteEntity
import kotlinx.datetime.Instant
import kotlinx.datetime.TimeZone
import kotlinx.datetime.toLocalDateTime

fun NoteEntity.toNote(): Note {
    return Note(
        id = id,
        title = title,
        content = content,
        colorHex = colorHex,
        created = Instant
            .fromEpochMilliseconds(created)
            .toLocalDateTime(TimeZone.currentSystemDefault())
    )
}