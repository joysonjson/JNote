package com.example.jnote

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform