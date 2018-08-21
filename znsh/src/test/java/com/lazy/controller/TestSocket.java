package com.lazy.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class TestSocket {

	public static void main(String[] args) throws Exception {
		//1、监听指定的接口
		int port =55533;
		ServerSocket server = new ServerSocket(port);
		//2、等待server的连接
		System.out.println("server已经建立，等待连接的到来。。。。。。。。。。。");
		Socket socket = server.accept();
		//3、从socket中获取输入流，并从缓冲区进行读取
		InputStream iStream =socket.getInputStream();
		byte[] bt = new byte[1024];
		int len ;
		StringBuffer buffer = new StringBuffer();
		//只有当客户端关闭它的输出流的时候，服务端才能取得结尾的-1
		while((len = iStream.read(bt))!=-1){
			buffer.append(new String(bt, 0, len, "UTF-8"));
		}
		System.out.println("get message from client:"+buffer.toString());
		//4、建立一个输出流
		OutputStream outputStream = socket.getOutputStream();
		outputStream.write("Hello client ,This is ServerOne".getBytes());
		//5、关闭连接
		iStream.close();
		outputStream.close();
		socket.close();
		server.close();
	}

}
