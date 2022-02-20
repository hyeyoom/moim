package com.github.hyeyoom.moimserver.mock

import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import javax.transaction.Transactional

@RestController
@RequestMapping("/users")
class UserController(
    private val repository: MockUserRepository
) {

    @Transactional
    @PostMapping
    fun join(@RequestBody parameter: PostMockUserRequest): PostMockUserResponse {
        println("parameter = $parameter")
        val user = MockUser(email = parameter.email, password = parameter.password)
        repository.save(user)
        return PostMockUserResponse(id = user.id)
    }

    data class PostMockUserRequest(val email: String, val password: String)
    data class PostMockUserResponse(val id: Long?)
}