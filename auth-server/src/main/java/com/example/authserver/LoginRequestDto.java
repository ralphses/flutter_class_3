package com.example.authserver;

public record LoginRequestDto(
        String username,
        String password
) {
}
