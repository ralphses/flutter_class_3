package com.example.authserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin("*")
@RestController
@SpringBootApplication
public class AuthServerApplication {

    private static List<Student> students = new ArrayList<>();

    public static void main(String[] args) {
        SpringApplication.run(AuthServerApplication.class, args);
    }

    @PostMapping("/register")
    public StudentDto register(@RequestBody StudentDto studentDto) {
        Student student = new Student(
                studentDto.username(),
                studentDto.email(),
                studentDto.fullName(),
                studentDto.password(),
                studentDto.phone());

        students.add(student);

        System.out.println("students = " + students);
        return studentDto;
    }

    @PostMapping("/login")
    public StudentDto login(@RequestBody LoginRequestDto loginRequestDto) {

        String password = loginRequestDto.password();
        String username = loginRequestDto.username();

        return students.stream()
                .filter(student ->
                        student.getUsername().equals(username) &&
                                student.getPassword().equals(password))
                .findFirst().map(student -> new StudentDto(
                        student.getPhone(),
                        student.getPassword(),
                        student.getFullname(),
                        student.getEmail(),
                        student.getUsername()))
                .stream().findFirst().orElseThrow();
    }

}
