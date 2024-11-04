package vn.hoidanit.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleUploadFile(MultipartFile file, String tagetFolder) throws IOException {
        byte[] bytes = file.getBytes();
        String rootPath = this.servletContext.getRealPath("/resources/images");
        String fileName = "";

        File dir = new File(rootPath + File.separator + tagetFolder);
        if (!dir.exists())
            dir.mkdirs();
        // Create the file on server
        fileName = +System.currentTimeMillis() + "-" + file.getOriginalFilename();
        File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
        BufferedOutputStream stream = new BufferedOutputStream(
                new FileOutputStream(serverFile));
        stream.write(bytes);
        stream.close();
        return fileName;
    }
}
