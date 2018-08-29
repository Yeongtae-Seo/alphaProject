package com.model;

public class MovieImageVo {

	String fileurl;  //이미지 파일 경로
	String filename;  //이미지 파일 이름
	int parent;
	
	
	@Override
	public String toString() {
		return "MovieImageVo [fileurl=" + fileurl + ", filename=" + filename + ", parent=" + parent + "]";
	}
	
	
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	
	
}
