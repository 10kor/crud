package com.di.crud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.di.crud.dao.HomeDao;

@Service
public class HomeService {

	@Autowired
	private HomeDao dao;
	
	
	
}
