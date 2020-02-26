package com.wpx.moive.service;

import java.util.List;

import com.wpx.moive.domain.Movie;
import com.wpx.moive.ov.MovieOV;

public interface MovieService {

	List<Movie> selects(MovieOV movieOV);

	boolean delete(Integer[] ids);

}
