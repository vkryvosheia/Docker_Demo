package com.dockerwear.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

//	@Autowired
//	@Qualifier("userDetailsService")
//    UserDetailsService userDetailsService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
//		System.out.println("configureglobal");
//		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

//		http.authorizeRequests().antMatchers("/index.jsp", "/marks.jsp", "/students.jsp", "/groups.jsp", "/subjects.jsp", "/stud_info.jsp", "/add_student.jsp")
//			.access(
//			.loginPage("/login").failureUrl("/login_err.jsp")
//				.usernameParameter("username")
//				.passwordParameter("password")
//				.and().logout().logoutSuccessUrl("/login?logout")
//				.and().csrf()
//				.and().exceptionHandling().accessDeniedPage("/403");
//
				http.csrf().disable();
	}

	@Bean
	public PasswordEncoder passwordEncoder(){
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}

}