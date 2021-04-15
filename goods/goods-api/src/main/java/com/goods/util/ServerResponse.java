package com.goods.util;
//封装服务器响应的类
public class ServerResponse {
	//常用响应码
	public static final Integer SUCCESS=200;
	public static final Integer ERROR=500;

	private Integer code;//响应编码
	private String msg;//响应消息
	private Integer count;//分页用
	private Object data;//响应对象

	public ServerResponse() {

	}

	public ServerResponse(Integer code, Integer count, Object data) {
		this.code = code;
		this.count = count;
		this.data = data;
	}

	public ServerResponse(Integer code, String msg, Integer count, Object data) {
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}

	public ServerResponse(Integer code, String msg, Object data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public ServerResponse(Integer code, String msg) {
		this.code = code;
		this.msg = msg;
	}

	public ServerResponse(Integer code, Object data) {
		this.code = code;
		this.data = data;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
}
