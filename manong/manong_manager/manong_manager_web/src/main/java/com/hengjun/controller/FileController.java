package com.hengjun.controller;

import com.hengjun.fastdfs.FastDFSClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: hengjun
 * Date: 2019/6/13
 */
@Controller
public class FileController {
    @RequestMapping(value = "uploadfile", method = RequestMethod.POST)
    @ResponseBody
    public String fileupload(@RequestParam MultipartFile uploadfile) throws IOException {
        String fileID = FastDFSClient.uploadFile(uploadfile.getInputStream(),uploadfile.getOriginalFilename());
        if(fileID != null)
        System.out.println("上传文件成功");
        //若需得到文件名该这样写
        //return fileID + "---" + uploadfile.getOriginalFilename();
        //为实现主主图预览, 不该在FID后加文件名, 否则无法访问图片资源实现预览
        return fileID;
    }
}
