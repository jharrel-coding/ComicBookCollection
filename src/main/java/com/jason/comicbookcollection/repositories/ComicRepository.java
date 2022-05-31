package com.jason.comicbookcollection.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jason.comicbookcollection.models.Comic;

@Repository
public interface ComicRepository extends CrudRepository<Comic, Long> {
	List<Comic> findAll();
}
