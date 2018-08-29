package com.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.model.QuestionFileVo;

@Service
public class UploadService {
	@Autowired
	ServletContext ctx;
	
	public QuestionFileVo execute(MultipartFile file, int parent) throws Exception {
		
		File dir = new File(ctx.getRealPath("/attach"),String.valueOf(parent));
		
		if(!dir.exists()) { //파일 객체가 존재하지 않으면
			dir.mkdirs();  //파일 객체 이름의 디렉토리 생성
		}
		
		File dest = new File(dir,file.getOriginalFilename());  //파일 객체 생성(디렉토리명, 파일 원래 이름)
		
		file.transferTo(dest);  //transferTo는 원하는 위치에 저장할 수 있는 기능
		
		QuestionFileVo vo = new QuestionFileVo();
		vo.setFname(file.getOriginalFilename());
		vo.setFsize(file.getSize());
		vo.setFurl("/attach/"+parent+"/"+file.getOriginalFilename());
		vo.setParent(parent);
		System.out.println(vo.toString());
		return vo;
	}
}
