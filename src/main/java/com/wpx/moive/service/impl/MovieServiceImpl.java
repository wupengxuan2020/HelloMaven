package com.wpx.moive.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.wpx.moive.dao.MovieMapper;
import com.wpx.moive.domain.Movie;
import com.wpx.moive.ov.MovieOV;
import com.wpx.moive.service.MovieService;
@Service
public class MovieServiceImpl implements MovieService {
	
	@Resource
	private MovieMapper movieMapper;

	@Override
	public List<Movie> selects(MovieOV movieOV) {
		// TODO Auto-generated method stub
		return movieMapper.selects(movieOV);
	}

	@Override
	public boolean delete(Integer[] ids) {
		// TODO Auto-generated method stub
		return movieMapper.delete(ids);
	}
	
	
}
