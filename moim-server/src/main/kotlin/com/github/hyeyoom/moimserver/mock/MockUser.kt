package com.github.hyeyoom.moimserver.mock

import javax.persistence.*

@Entity
@Table(
    name = "mock_user",
    uniqueConstraints = [
        UniqueConstraint(name = "UQ_MOCK_USER_EMAIL", columnNames = ["email"])
    ]
)
class MockUser(
    @Id
    @GeneratedValue
    val id: Long? = null,

    @Column(nullable = false)
    val email: String,

    @Column(nullable = false)
    val password: String,
) {
    override fun toString(): String {
        return "MockUser(id=$id, email='$email', password='$password')"
    }
}
