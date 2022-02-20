package com.github.hyeyoom.moimserver.mock

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping("/users/authentication")
class UserAuthenticationController(
    private val repository: MockUserRepository
) {

    @PostMapping
    fun requestAuthentication(@RequestBody body: UserAuthenticationRequest): ResponseEntity<UserAuthenticationResponse> {
        val foundMember = repository.findMockUserByEmail(body.email)
        println("body = $body")
        println("foundMember = $foundMember")
        return if (foundMember.isEmpty) {
            ResponseEntity.notFound().build()
        } else {
            ResponseEntity.ok(UserAuthenticationResponse("아무말"))
        }
    }

    data class UserAuthenticationRequest(val email: String, val password: String)
    data class UserAuthenticationResponse(val refreshToken: String)

}