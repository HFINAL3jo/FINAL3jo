package com.aligo.spring.theme.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.aligo.spring.theme.model.service.ThemeService;

@Controller
public class ThemeController {
	
	@Autowired
	private ThemeService tService;
	
}
