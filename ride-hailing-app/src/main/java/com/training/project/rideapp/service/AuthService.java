package com.training.project.rideapp.service;

import com.training.project.rideapp.model.User;
import com.training.project.rideapp.repo.UserRepo;
import com.training.project.rideapp.util.PasswordUtil;

public class AuthService {

    private final UserRepo userRepository = new UserRepo();

    public void register(User user) {
        // Check if email already exists
        User existing = userRepository.findByEmail(user.getEmail());
        if (existing != null) {
            throw new RuntimeException("Email already registered");
        }

        // Hash password before saving
        user.setPassword(PasswordUtil.hashPassword(user.getPassword()));
        userRepository.save(user);
    }

    public User login(String email, String rawPassword) {
        User user = userRepository.findByEmail(email);

        if (user == null) {
            throw new RuntimeException("Invalid email or password");
        }

        if (!PasswordUtil.verifyPassword(rawPassword, user.getPassword())) {
            throw new RuntimeException("Invalid email or password");
        }

        return user;
    }
}
