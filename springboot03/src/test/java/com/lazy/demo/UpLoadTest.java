package com.lazy.demo;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.lazy.util.ReadAndWriteTool;

@SpringBootTest
public class UpLoadTest {
	@Test
	public void testRead(){
		ReadAndWriteTool.readFile();
	}
}
