//package com.lcdut.service;
//
//import com.lcdut.repository.UserRepository;
//import com.lcdut.model.UserRole;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//import java.util.ArrayList;
//import java.util.HashSet;
//import java.util.List;
//import java.util.Set;
//
//
//@Service("userDetailsService")
//public class MyUserDetailsService implements UserDetailsService {
//
//	@Autowired
//	private UserRepository userRepository;
//
//	@Transactional
//	@Override
//	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
//
//		com.lcdut.model.User user = userRepository.findByUsername(username);
//		List<GrantedAuthority> authorities = buildUserAuthority(user.getUserRole());
//		System.out.println(user.getUserRole().toString());
//			return buildUserForAuthentication(user, authorities);
//
//	}
//
//
//	private User buildUserForAuthentication(com.lcdut.model.User user, List<GrantedAuthority> authorities) {
//		return new User(user.getUsername(), user.getPassword(), user.isEnabled(), true, true, true, authorities);
//	}
//
//	private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {
//
//		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
//
//		for (UserRole userRole : userRoles) {
//			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
//		}
//		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(setAuths);
//
//		for (int i = 0; i < Result.size(); i++) {
//			System.out.println(Result.get(i));
//		}
//		return Result;
//	}
//
//}