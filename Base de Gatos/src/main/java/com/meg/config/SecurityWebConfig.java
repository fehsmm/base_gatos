package com.meg.config;

import jakarta.servlet.DispatcherType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityWebConfig {

    @Autowired
    UserAuthenticationProvider userAuthenticationProvider;

    @Bean
    protected SecurityFilterChain filterChain(HttpSecurity httpSecurity) {
        httpSecurity.csrf(AbstractHttpConfigurer::disable);
        httpSecurity.authorizeHttpRequests(auth -> {
            auth.dispatcherTypeMatchers(DispatcherType.FORWARD);
            auth.requestMatchers("/auth/**", "/styles/**", "/WEB-INF/**").permitAll();
            auth.requestMatchers("/styles/**", "/scripts/**", "/images/**","/icons/**").permitAll();
            auth.requestMatchers("/volunteer/**").authenticated();
            auth.requestMatchers("/**").denyAll();
        });
        httpSecurity.formLogin(login -> {
            login.loginPage("/auth/login");
            login.loginProcessingUrl("/login");
            login.defaultSuccessUrl("/volunteer/view-schedule", true);
            login.permitAll();
        });
        httpSecurity.authenticationProvider(userAuthenticationProvider);
        return httpSecurity.build();
    }
}
