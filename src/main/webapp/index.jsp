package com.example.portal.service;

import com.example.portal.model.User;
import com.example.portal.repository.UserRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(
            UserRepository userRepository,
            PasswordEncoder passwordEncoder) {

        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public boolean register(String username, String password) {

        if (userRepository.existsByUsername(username)) {
            return false;
        }

        String encryptedPassword =
                passwordEncoder.encode(password);

        User user = new User(username, encryptedPassword);

        userRepository.save(user);

        return true;
    }

    public boolean validateLogin(String username, String password) {

        return userRepository.findByUsername(username)
                .map(user ->
                        passwordEncoder.matches(
                                password,
                                user.getPassword()))
                .orElse(false);
    }
}
