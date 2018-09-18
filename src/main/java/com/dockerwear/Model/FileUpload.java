package com.dockerwear.Model;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public class FileUpload {
    private List<MultipartFile> files;
    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files= files;
    }
}