package com.jason.comicbookcollection.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jason.comicbookcollection.models.Comic;
import com.jason.comicbookcollection.repositories.ComicRepository;

@Service
public class ComicService {
	@Autowired
	private ComicRepository comicRepository;
	
	public List<Comic> getAll(){
		return comicRepository.findAll();
	}
	
	public Comic create(Comic newComic) {
		return comicRepository.save(newComic);
	}
	
	public Comic getById(Long id) {
		
		
		
		
		return comicRepository.findById(id).orElse(null);
	}
	public Comic update(Comic editComic) {
		return comicRepository.save(editComic);
	}
	public void deleteById(Long id) {
		comicRepository.deleteById(id);
	}

}