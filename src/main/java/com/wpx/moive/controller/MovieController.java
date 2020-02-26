package com.wpx.moive.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wpx.moive.domain.Movie;
import com.wpx.moive.ov.MovieOV;
import com.wpx.moive.service.MovieService;



@Controller
public class MovieController {
	
	@Resource
	private MovieService movieService;
	
	@RequestMapping("selects")
	public String list(MovieOV movieOV,Model model){
		if (movieOV.getPageNum()==null) {
			movieOV.setPageNum(1);
		}
		PageHelper.startPage(movieOV.getPageNum(), 3);
		
		
		List<Movie> movies= movieService.selects(movieOV);
		PageInfo<Movie> page = new PageInfo<>(movies);
		model.addAttribute("movies", movies);
		model.addAttribute("page", page);
		model.addAttribute("movieOV", movieOV);
		return "movies";
	}
	
	
	@RequestMapping("delete")
	@ResponseBody
	public boolean delete(@RequestParam("ids[]")Integer[] ids){
		
		
	
	
		//剩下的代码你自己补全
		boolean flag= movieService.delete(ids);
		
		return flag;
	}
	
}
