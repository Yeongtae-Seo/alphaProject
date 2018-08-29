package com.model;

public class ActorVo {

	String actorname;  //배우 이름
	String imgurl;   //배우 이미지
	int parent;
	
	
	
	@Override
	public String toString() {
		return "ActorVo [actorname=" + actorname + ", imgurl=" + imgurl + ", parent=" + parent + "]";
	}
	
	
	public String getActorname() {
		return actorname;
	}
	public void setActorname(String actorname) {
		this.actorname = actorname;
	}
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}  
	
	
}
