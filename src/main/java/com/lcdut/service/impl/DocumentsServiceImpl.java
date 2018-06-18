package com.lcdut.service.impl;

import com.lcdut.model.DocumentsModel;
import com.lcdut.repository.DocumentsRepository;
import com.lcdut.service.DocumentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DocumentsServiceImpl implements DocumentsService {

    @Autowired
    DocumentsRepository repository;

    @Override
    public DocumentsModel addDocument(DocumentsModel m) {
        return repository.save(m);
    }

    @Override
    public DocumentsModel editDocument(DocumentsModel m) {
        return repository.save(m);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public List<DocumentsModel> getAll() {
        return repository.findAll();
    }
}
