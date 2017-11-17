package com.bwjf.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bwjf.entity.Account;
import com.bwjf.entity.PerformanceInfo;
import com.bwjf.entity.PerformanceInfoVo;
import com.bwjf.service.PerformanceInfoService;

/**
 * @author 张恭雨
 * 创建时间：2017年11月15日 上午8:09:14
 * 类描述：绩效信息操作控制
 * 版本：v1.0 
 */
@Controller
@RequestMapping("/performanceInfo")
public class PerformanceInfoController {
	

	private PerformanceInfoService infoService;
	
	public PerformanceInfoService getInfoService() {
		return infoService;
	}
	@Resource
	public void setInfoService(PerformanceInfoService infoService) {
		this.infoService = infoService;
	}

	/*
	 * 跳转信息录入页面
	 */
	@RequestMapping("/toAdd")
	public String toAdd(){
		return "PerformanceInfo/add";
	}
	
	/*
	 * 异步加载设备名称信息
	 */
	@RequestMapping("/getEquipmentName.do")
	@ResponseBody
	public String getEquipmentName(){
		try {
			return	infoService.getAllEquipmentName().toString();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/*
	 * 添加设备信息
	 */
	@RequestMapping("/addEquipment.do")
	@ResponseBody
	public String addEquipment(PerformanceInfo info,
			String name,HttpServletRequest request){
		//获取帐户信息
		Account account=(Account) request.getSession().getAttribute("account");
		//设置员工Id
		info.setEmployeeId(account.getEmployeeId());
		//保存信息
		try {
			infoService.saveEquipmentInfo(info, name);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}		
		return "success";		
	}
	
	/*
	 * 添加服务费信息
	 */
	@RequestMapping("/addServiceCharge.do")
	@ResponseBody
	public String addServiceCharge(String familyType,String plateType
			,PerformanceInfo info,HttpServletRequest request){		
		//获取帐户信息
		Account account=(Account) request.getSession().getAttribute("account");
		//设置员工Id
		info.setEmployeeId(account.getEmployeeId());		
		try {
			infoService.saveServiceChargeInfo(info, familyType, plateType);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		return "success";
	}
	
	/*
	 * 展示更新列表
	 */
	@RequestMapping("/showUpdate.do")
	@ResponseBody
	public String showUpdate(HttpServletRequest request){
		//获取帐户信息
		Account account=(Account) request.getSession().getAttribute("account");
		try {
			List<PerformanceInfoVo> infoVos=infoService.
					getInfoByCondition(account.getEmployeeId(), new Date());
			//添加到session中
			request.getSession().setAttribute("infoVos", infoVos);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
		return "success";
	}

	@RequestMapping("/totalIndex")
	public String total() {
		
		return "PerformanceInfo/total";		

	}
}
