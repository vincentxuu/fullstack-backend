package com.javapractice.fullstackbackend.repository;

import com.javapractice.fullstackbackend.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository <User,Long>{

}
