package pt.upskill.base_gatos_demo.configuration;

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
            auth.requestMatchers("/auth/**", "/styles/**", "/WEB-INF/**", "/error").permitAll();
            auth.requestMatchers("/styles/**", "/scripts/**", "/images/**","/icons/**").permitAll();
            auth.requestMatchers("/volunteer/**").hasRole("VOLUNTEER");
            auth.requestMatchers("/admin/**").hasRole("ADMIN");
            auth.requestMatchers("/adopter/**").hasRole("ADOPTER");
            auth.requestMatchers("/private/**").hasRole("PRIVATE");
            auth.requestMatchers( "/public/**").permitAll();
            auth.requestMatchers("/**").denyAll();
        });
        httpSecurity.formLogin(login -> {
            login.loginPage("/auth/login");
            login.loginProcessingUrl("/auth/login");
            login.defaultSuccessUrl("/auth/dashboard", true);
        });
        httpSecurity.authenticationProvider(userAuthenticationProvider);
        return httpSecurity.build();
    }
}
