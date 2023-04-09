package com.di.crud.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDao {

	@Autowired
	private SqlSessionTemplate sst;
	
	
}
