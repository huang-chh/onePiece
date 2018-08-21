package com.lazy.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

public class TestSocket {

	public static void main(String[] args) throws Exception {
		//1������ָ���Ľӿ�
		int port =55533;
		ServerSocket server = new ServerSocket(port);
		//2���ȴ�server������
		System.out.println("server�Ѿ��������ȴ����ӵĵ�������������������������");
		Socket socket = server.accept();
		//3����socket�л�ȡ�����������ӻ��������ж�ȡ
		InputStream iStream =socket.getInputStream();
		byte[] bt = new byte[1024];
		int len ;
		StringBuffer buffer = new StringBuffer();
		//ֻ�е��ͻ��˹ر������������ʱ�򣬷���˲���ȡ�ý�β��-1
		while((len = iStream.read(bt))!=-1){
			buffer.append(new String(bt, 0, len, "UTF-8"));
		}
		System.out.println("get message from client:"+buffer.toString());
		//4������һ�������
		OutputStream outputStream = socket.getOutputStream();
		outputStream.write("Hello client ,This is ServerOne".getBytes());
		//5���ر�����
		iStream.close();
		outputStream.close();
		socket.close();
		server.close();
	}

}
