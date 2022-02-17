package com.github.hyeyoom.moimserver

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class MoimServerApplication

fun main(args: Array<String>) {
    runApplication<MoimServerApplication>(*args)
}
