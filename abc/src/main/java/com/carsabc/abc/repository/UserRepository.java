package com.carsabc.abc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.carsabc.abc.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

	User findByUserName(String name);
	
}

