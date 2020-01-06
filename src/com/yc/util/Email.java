package com.yc.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	public static void sendcode(String email){
		Random r=new Random();
		//公式： random.nextInt（最大值-最小值）+最小值
		int num=r.nextInt(899999)+100000;
		Data.code=num;
		Properties properties = new Properties();
	    properties.put("mail.transport.protocol", "smtp");// 连接协议
	    properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
//	    properties.put("mail.smtp.port", 465);// 端口号
		properties.put("mail.smtp.auth", "true");
	    properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
	    properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
		try {
			// 得到回话对象
			Session session = Session.getInstance(properties);
			// 获取邮件对象
		    Message message = new MimeMessage(session);
			// 设置发件人邮箱地址
			message.setFrom(new InternetAddress("1141006423@qq.com"));
			// 设置收件人邮箱地址 
//			message.setRecipients(Message.RecipientType.TO,
//			new InternetAddress[]{
//					new InternetAddress("xxx@qq.com"),
//					new InternetAddress("xxx@qq.com"),
//					new InternetAddress("xxx@qq.com")
//			});
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));//一个收件人
				 // 设置邮件标题
			message.setSubject("心灵旅行");
				 // 设置邮件内容
		    message.setText("欢迎加入心灵旅行,您的注册码为："+num+",我们将为您提供最优质的服务,祝您旅程愉快！");
				 // 得到邮差对象
			Transport transport = session.getTransport();
				 // 连接自己的邮箱账户
			transport.connect("1141006423@qq.com", "xegvdwwuhbwwibbj");// 密码为QQ邮箱开通的stmp服务后得到的客户端授权码
				 // 发送邮件
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
