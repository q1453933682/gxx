package com.yc.dao;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class DBHelper {
	//封装     jdbc的写法太麻烦，每次都需要写好多行，因此我们把他封装一下
	//1、driver只需要整个程序运行过程中注册一次即可.  而且整个程序中都会用到，而且只有一次，所以可以用静态块处理
	static{
		try {
			Class.forName(MyProperties.getInstance().getProperty("driverClass"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	//2、获取连接
	public Connection getCon(){
		Connection con = null;
		try {
			con = DriverManager.getConnection(MyProperties.getInstance()
					.getProperty("url"), MyProperties.getInstance());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	//3、关闭资源，也可以封装
	//			我们总共有三个东西要关闭
	public void closeAll( ResultSet rs,  Statement stmt,  Connection con ){
		try {
			if( rs!=null){
				rs.close();
			}
			if(    stmt!=null){
				stmt.close();
			}
			if(   con!=null ){
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//开始封装功能
	//第一个，增删改都是一样的，返回值都一样，所以我们先来封装增删改的功能
	/**
	 * 
	 * @param sql           sql语句
	 * @param params		为了防注入，我们使用预处理方式，所以里面是有?的，我们需要注入值
	 * @return
	 * @throws IOException 
	 * @throws SQLException 
	 */
	public int doUpdate(String sql,List<Object> params){
		//定义返回值
		int result=-1;
		//获取连接
		Connection con=getCon();
		//预处理
		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(sql);
			//设置参数
			doParams(pstm,params);
			//执行sql语句
			result=pstm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeAll(null, pstm, con);
		return result;
	}

	//设置参数
	public void doParams(PreparedStatement pstm, List<Object> params){
		//首先，如果参数为null，则不需要设置参数
		try {
			if(pstm!=null && params!=null && params.size()>0){
				//将params中的参数循环取出，一个一个的设置到pstm里面去，但是注意一下数据类型
				for(int i=0;i<params.size();i++){
					Object o=params.get(i);
					//判断类型
					if(o instanceof Integer){
						Integer t=Integer.parseInt( o.toString() );
						pstm.setInt(i+1, t);
					}else if(o instanceof String){
						pstm.setString(i+1, o.toString());
					}else if(o instanceof Double){
						Double d=Double.parseDouble(o.toString());
						pstm.setDouble(i+1, d);
					}else{
						pstm.setBytes(i+1, (byte[]) o);
					}
					//long    boolean     blob     clob   xxxxx
				} 
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//查询
	/**
	 * 
	 * @param sql
	 * @param params
	 * @return   因为查询出来的是一个键值对形式的，列明为键，值为值，所以我们
	 * @throws IOException 
	 * @throws SQLException 
	 */
	public List<Map<String,String>> findAll(String sql , List<Object> params){
		List<Map<String,String>> list=new ArrayList<Map<String,String>>();
		Connection con=getCon();
		PreparedStatement pstm = null;
		//查询得到结果集
		ResultSet rs = null;
		try {
			pstm = con.prepareStatement(sql);
			doParams(pstm, params);
			rs = pstm.executeQuery();
			//拿到元数据，取出每一个列名
			ResultSetMetaData rsmd=rs.getMetaData();
			//存到一个数组里面去
			String[] columnName=new String[rsmd.getColumnCount()];
			for(int i=0;i<columnName.length;i++){
				//取值存值，注意，+1
				columnName[i]=rsmd.getColumnName(i+1);
			}
			
			//开始处理数据   循环rs，取出每一列的数据，存到Map中，再把Map存到List中
			String ctypename="";
			while(rs.next()){
				Map<String,String> map=new HashMap<String,String>();
				//根据列名取值
				for(int i=0;i<columnName.length;i++){
					String cn=columnName[i];	//得到列名
					//根据列名取值
					
						String value=rs.getString(cn);
						//有了键和值，开始存Map
						map.put(cn.toLowerCase(), value);
					
					
				}
				//循环完毕，存list
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			closeAll(rs, pstm, con);
		}
		
		//返回数据
		return list;
	}
	
	
	
	public List<Map<String,Object>> findAllByBytes(String sql,List<Object> params){
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		try {
			//里面的东西，前面一部分，和之前一样
			//加载驱动上面已经做过了，所以现在只需要直接获取连接就行了
			Connection con=getCon();
			//开始创建预处理，sql语句是参数，我们不需要管
			PreparedStatement ps=con.prepareStatement(sql);
			//要不要设置参数？    难度：1，参数的数量   可以用集合    2，参数的数据类型
			doParams(ps,params);
			ResultSet rs=ps.executeQuery();
			//到此，查询，就开始不一样了
			
			//首先，我们的返回类型   表的一个字段，对应一个值
			ResultSetMetaData rsmd=rs.getMetaData();
			//这个数组，是用来存放，表里面的列名
			String[] columnName=new String[ rsmd.getColumnCount() ];
			for(int i=0;i<columnName.length;i++){
				//为什么要加1？   因为我们的i是从0开始的，而这里，是从1开始的
				//System.out.println(  rsmd.getColumnName(1)  );
				columnName[i]=rsmd.getColumnName(i+1).toLowerCase();	//转为小写
				//System.out.println(  columnName[i]  );
			}
			//至此，我们的键，就已经有了，现在呢，我们就取值了
			while( rs.next() ){
				//类似于  List 和  ArrayList    你怎么理解这个，就怎么理解Map和HashMap
				Map<String,Object> map=new HashMap<String,Object>();
				//循环取值
				for( int i=0;i<columnName.length;i++ ){
					//System.out.println(  rs.getString(columnName[i])  );
//					String cn=columnName[i];
//					String value=rs.getString(cn);
//					map.put(cn, value);
					//map存值     键值对
					if( rs.getString(columnName[i])==null || "".equals(rs.getString(columnName[i]))   ){
						map.put(columnName[i], rs.getBytes(columnName[i]));
					}else{
						map.put(columnName[i], rs.getString(columnName[i]));
					}
					
				}
				//一定要记得，map要加到集合中
				list.add(map);
			}
			
			
			closeAll(rs, ps, con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	/**
	 * 根据你传过来的对象，返回一个List对象给你，这个对象里面，是包括我们查出来的数据
	 * @param sql        sql语句
	 * @param params	参数
	 * @param c			是一个对象，我们这里，是一个对象的反射，到时候，是需要将我们的值，sql查出来的值，放到这个对象里面去
	 * @return
	 */
			//T 在这里，指泛型
	public <T> List<T> find(String sql,List<Object> params,Class<T> c){
		List<T> list=new ArrayList<T>();
		Connection con=getCon();
		PreparedStatement pstm = null;
		//查询得到结果集
		ResultSet rs = null;
		try {
			pstm = con.prepareStatement(sql);
			doParams(pstm, params);
			rs = pstm.executeQuery();
			//拿到元数据，取出每一个列名
			ResultSetMetaData rsmd=rs.getMetaData();
			//存到一个数组里面去
			String[] columnName=new String[rsmd.getColumnCount()];
			for(int i=0;i<columnName.length;i++){
				//取值存值，注意，+1
				columnName[i]=rsmd.getColumnName(i+1);
			}
			//得到方法，因为这个对象里面的属性，都是私有化的，只能通过set方法，去设值
			Method[] ms=c.getMethods();
			
			
			T t;		//指泛型对象
			String mname;		//方法名
			String cname;		//列名
			String ctypename;	//这个字段的类别

			while( rs.next() ){
				//首先，通过反射，来得到一个对象
				t=c.newInstance();
				//循环我们的字段先
				for(int i=0;i<columnName.length;i++){
					//我们的方法是setEmail   但是，我们的字段是 email
					cname=columnName[i];
					//开始拼接    email ->  setemail  -> setE               ->   setEmail
					cname="set" + cname.substring(0,1).toUpperCase() + cname.substring(1).toLowerCase();
					//循环判断方法
					for(int j=0;j<ms.length;j++){
						//得到方法名
						Method m=ms[j];
						mname=m.getName();
						//开始判断 
						if(  cname.equals(mname)  && rs.getObject(columnName[i])!=null  ){
							//得到类型
							ctypename=rs.getObject(columnName[i]).getClass().getName();
							//System.out.println( ctypename );
							if( "java.lang.String".equals(ctypename)  ){
								m.invoke(t, rs.getString( columnName[i]   ));
							}else if("java.lang.Integer".equals(ctypename)){
								m.invoke(t, rs.getInt( columnName[i]   ));
							}
						}
					}
				}
				//最后，不要忘了，我们的list里面加值
				list.add(t);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} finally{
			closeAll(rs, pstm, con);
		}
		
		//返回数据
		return list;
	}
	
	
	
	
	
	
	
}
