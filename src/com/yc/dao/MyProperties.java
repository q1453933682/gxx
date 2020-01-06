package com.yc.dao;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

//�̳�
public class MyProperties extends Properties{
	private static MyProperties myProperties;
	
	//����
	private MyProperties(){
		try {
			//���캯��˽�л�   -> ����ģʽ
			InputStream iis=MyProperties.class.getClassLoader()
					.getResourceAsStream("db.properties");
			//ͨ��������ø���ķ���
			this.load(iis);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//�����ṩһ�����еķ������Ա���ʵ��������
	//��̬���������Բ�ʵ������ֱ�ӵ���
	public static MyProperties getInstance(){
		//���myPropertiesΪ�գ�����ζ��û��ʵ����
		if( myProperties==null ){
			//ʵ����
			myProperties=new MyProperties();
		}
		//��ζ���Ѿ�ʵ������
		return myProperties;
	}
}
