package com.lcdut.service;

import com.lcdut.model.DocumentsModel;
import java.util.List;

public interface DocumentsService {

    DocumentsModel addDocument(DocumentsModel m);
    DocumentsModel editDocument(DocumentsModel m);
    void delete(int id);
    List<DocumentsModel> getAll();
}
