package com.wpx.moive.dao;

import java.util.List;

import com.wpx.moive.domain.Movie;
import com.wpx.moive.ov.MovieOV;

public interface MovieMapper {

	List<Movie> selects(MovieOV movieOV);

	boolean delete(Integer[] ids);

}
