package com.lazy.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ReadAndWriteTool {
	private static List<HashMap<String, Object>> MAP = new ArrayList<HashMap<String,Object>>();
	
	public static void readFile(){
		InputStream ois=null;
		OutputStream oos =null;
		try {
			
			ois = new FileInputStream("src/main/resources/static/images/test.txt");
			oos = new FileOutputStream("src/main/resources/static/images/write.txt");
			int num=0;
			byte[] bt = new byte[1024];
			while((num=ois.read(bt))!=-1){
				//System.out.println(new String(bt, 1, num, "UTF-8"));
				oos.write(bt, 1, num);
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				ois.close();
				oos.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
//	public static void writeFile(){
//		ObjectOutputStream oos = new ObjectOutputStream();
//	}
//	
	
}
