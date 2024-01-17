package com.example.authserver;

public record StudentDto(
        String phone,
        String password,
        String fullName,
        String email,
        String username
) {
}
