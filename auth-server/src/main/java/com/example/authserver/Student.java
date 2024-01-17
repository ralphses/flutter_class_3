package com.example.authserver;

public class Student {
    private String username;
    private String email;
    private String fullname;
    private String password;
    private String phone;

    public Student(String username, String email, String fullname, String password, String phone) {
        this.username = username;
        this.email = email;
        this.fullname = fullname;
        this.password = password;
        this.phone = phone;
    }

    public Student() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Student{" +
                "username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", fullname='" + fullname + '\'' +
                ", password='" + password + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
