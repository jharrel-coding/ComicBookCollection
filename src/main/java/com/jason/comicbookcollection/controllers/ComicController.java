package com.jason.comicbookcollection.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.jason.comicbookcollection.models.Comic;
import com.jason.comicbookcollection.services.ComicService;

@Controller
public class ComicController {
	@Autowired
	private ComicService comicService;
	
	@GetMapping("/")
	public String comics(Model model) {
		model.addAttribute("allComics", comicService.getAll());
		return "comics.jsp";
	}
	@GetMapping("/comics/new")
	public String newComic(@ModelAttribute("newComic") Comic newComic) {
		
		
		return "newComic.jsp";
	}
	@PostMapping("/comics/create")
	public String createComic(@Valid @ModelAttribute("newComic") Comic newComic, BindingResult result) {
		
		if(result.hasErrors()) {
			return "newComic.jsp";
		}
		
		comicService.create(newComic);
		
		
		return "redirect:/";
	}
	@GetMapping("/comics/{id}")
	public String profile(@PathVariable Long id, Model model) {
		model.addAttribute("comic", comicService.getById(id));
		
		return "profile.jsp";
		
	}
	// rendering the update page
	@GetMapping("/comics/{id}/edit")
	public String comicComic(@PathVariable Long id, @ModelAttribute("editComic") Comic editComic, Model model) {
		model.addAttribute("comic", comicService.getById(id));
		
		
		return "editComic.jsp";
	}
	@PutMapping("/comics/{id}/update")
	public String updateComic(@Valid @ModelAttribute("editComic")Comic editComic, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute(editComic);
			return "editComic.jsp";
		}
		comicService.update(editComic);
		return "redirect:/";
		
	}
	
	@DeleteMapping("/comics/{id}/destroy")
	public String descrtoyComic(@PathVariable Long id) {
		
		comicService.deleteById(id);
		
		return "redirect:/";
	}
}