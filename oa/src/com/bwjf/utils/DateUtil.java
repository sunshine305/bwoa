package com.bwjf.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;



/**
 * @author 张恭雨
 * 创建时间：2017年10月27日 下午3:34:43
 * 类描述：日期转换工具
 * 版本：v1.0 
 */
public class DateUtil {
	
	public static Date getDate(String s){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		try {		
			return format.parse(s);
		} catch (ParseException e) {
			// TODO Auto-generated catch block			
			return null;
		}
		
	}

}
