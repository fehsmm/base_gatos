package com.meg.service;

import com.meg.entity.User;
import com.meg.models.SignUpModel;
import com.meg.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;


@Service
public class AuthService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    public User register(SignUpModel signUpModel) {
        User user = new User();
        user.setUsername(signUpModel.getUsername());

        String encodedPassword = passwordEncoder.encode(signUpModel.getPassword());
        user.setPassword(encodedPassword);

        return userRepository.save(user);
    }

    public User getUser(String username) {
        return userRepository.getUserByUsername(username);
    }

    public User validateLogin(String username, String password) {
        User user = getUser(username);
        if (user == null || user.getId() == null) {
            return null;
        }

        if (!passwordEncoder.matches(password, user.getPassword())) {
            return null;
        }

        return user;
    }

    public User getAuthenticatedUser() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || auth.getPrincipal() == null) {
            return null;
        }
        String username = auth.getPrincipal().toString();
        return getUser(username);
    }
}
