//package sof3021.luongddph27553.configuration;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.http.HttpMethod;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.authentication.ProviderManager;
//import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.crypto.password.NoOpPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.SecurityFilterChain;
//
//import java.util.Arrays;
//import java.util.Collections;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig {
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//                .csrf().disable()
//                .authorizeHttpRequests()
//                .anyRequest().authenticated()
//                .and()
//                .formLogin()
//                .loginPage("/login")
//                .permitAll();
//        return http.build();
//    }
//
//    @Bean
//    public UserDetailsService userDetailsService() {
//        return new CustomUserDetailsService();
//    }
//
//    @Bean
//    public AuthenticationManager authenticationManager() {
//        return new ProviderManager(Collections.singletonList(authenticationProvider()));
//    }
//
//    @Bean
//    public AuthenticationProvider authenticationProvider() {
//        return new CustomAuthenticationProvider();
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return NoOpPasswordEncoder.getInstance();
//    }
//
//    private static class CustomUserDetailsService implements UserDetailsService {
//
//        @Override
//        public org.springframework.security.core.userdetails.UserDetails loadUserByUsername(String username) {
//            if ("admin".equals(username)) {
//                return User.builder()
//                        .username(username)
//                        .password("admin")
//                        .roles("ADMIN")
//                        .build();
//            } else {
//                return User.builder()
//                        .username(username)
//                        .password("user")
//                        .roles("USER")
//                        .build();
//            }
//        }
//    }
//
//    private static class CustomAuthenticationProvider implements AuthenticationProvider {
//
//        @Autowired
//        private UserDetailsService userDetailsService;
//
//        @Autowired
//        private PasswordEncoder passwordEncoder;
//
//        @Override
//        public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//            String username = authentication.getName();
//            String password = authentication.getCredentials().toString();
//
//            UserDetails user = userDetailsService.loadUserByUsername(username);
//
//            if (passwordEncoder.matches(password, user.getPassword())) {
//                return new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
//            } else {
//                throw new AuthenticationException("Authentication failed") {
//                };
//            }
//        }
//
//        @Override
//        public boolean supports(Class<?> authentication) {
//            return authentication.equals(UsernamePasswordAuthenticationToken.class);
//        }
//    }
//
//}
