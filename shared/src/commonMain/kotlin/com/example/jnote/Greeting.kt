package com.example.jnote
import database.NoteEntity
class Greeting {
    private val platform: Platform = getPlatform()
    fun greeting(): String {
        return "Hello, ${platform.name}!"
    }
}