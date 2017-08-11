package com.hxj.control;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by hxj on 17-8-7.
 */
public class UploadAction {

    private File imgFile;
    private String imgFileContentType;
    private String imgFileFileName;

    public void setImgFile(File imgFile) {
        this.imgFile = imgFile;
    }

    public void setImgFileFileName(String imgFileFileName) {
        this.imgFileFileName = imgFileFileName;
    }

    public void setImgFileContentType(String imgFileContentType) {
        this.imgFileContentType = imgFileContentType;
    }

    public void upload(){

        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        //文件保存目录路径
        String savePath = ServletActionContext.getServletContext().getRealPath("/") + "attached/";

        //文件保存目录URL
        String saveUrl  =  request.getContextPath()+ "/attached/";

        //指定输出内容类型和编码
        ServletActionContext.getResponse().setContentType("text/html;charset=utf-8");
        //获取输出流，然后使用
        PrintWriter out = null;
        try {
            out = ServletActionContext.getResponse().getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }

        System.out.println("upload:"+imgFile);
        System.out.println("uploadContentType:"+imgFileContentType);
        System.out.println("uploadFilename:"+imgFileFileName);

        response.setContentType("text/html; charset=UTF-8");

        //检查目录
        File uploadDir = new File(savePath);
        System.out.println("uploadDir:"+uploadDir);
        if(!uploadDir.isDirectory()){
            uploadDir.mkdirs();
        }

        //检查目录写权限
        if(!uploadDir.canWrite()){
            out.println(getError("上传目录没有写权限。"));
            return;
        }

        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }
        if(!extMap.containsKey(dirName)){
            out.println(getError("目录名不正确。"));
            return;
        }

        //创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }

        //检查扩展名
        String fileExt = imgFileFileName.substring(imgFileFileName.lastIndexOf(".") + 1).toLowerCase();
        if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
            out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
            return;
        }

        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
        try{
            File uploadFile = new File(savePath,newFileName);
            FileUtils.copyFile(imgFile,uploadFile);
        }catch(Exception e){
            out.println(getError("上传文件失败。"));
            return;
        }
        JSONObject obj = new JSONObject();
        obj.put("error",0);
        //ServletActionContext.getRequest().getContextPath()+File.separator+"upload"+File.separator+imgFileFileName
        obj.put("url",saveUrl + newFileName);
        obj.put("message","上传成功");
        out.write(obj.toString());
        return;
    }


    private String getError(String message) {
        JSONObject obj = new JSONObject();
        obj.put("error", 1);
        obj.put("message", message);
        return obj.toString();
    }
}
