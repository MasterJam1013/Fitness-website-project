package com.techelevator.controller;


import com.techelevator.dao.ExerciseDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.model.User;
import com.techelevator.model.UserWithId;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@RestController
@CrossOrigin


public class UserController {

	private UserDAO userDAO;

	public UserController(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
//
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@RequestMapping(path = "/allUsers", method = RequestMethod.GET)
	public List<UserWithId> getAllUsers(Principal principal) {
		List<User> users = userDAO.findAll();

		List<UserWithId> usernames = new ArrayList<>();
		for (User user : users) {
			Object e = user.getAuthorities();
			if (!user.getAuthorities().toString().contains("ROLE_ADMIN")) {
				UserWithId u = new UserWithId();
				u.setUsername(user.getUsername());
				u.setId(user.getId());
				usernames.add(u);
			}
		}
		return usernames;
	}
}
