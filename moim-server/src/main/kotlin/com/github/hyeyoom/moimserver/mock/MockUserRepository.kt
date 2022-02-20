package com.github.hyeyoom.moimserver.mock

import org.springframework.data.jpa.repository.JpaRepository
import java.util.*

interface MockUserRepository : JpaRepository<MockUser, Long> {

    fun findMockUserByEmail(email: String): Optional<MockUser>
}