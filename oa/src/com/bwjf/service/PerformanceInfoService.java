package com.bwjf.service;

import java.util.Date;
import java.util.List;

import com.bwjf.entity.PerformanceInfo;
import com.bwjf.entity.PerformanceInfoVo;

import net.sf.json.JSONArray;

/**
 * @author 张恭雨
 * 创建时间：2017年11月15日 上午8:25:15
 * 类描述：绩效信息service接口，
 * 版本：v1.0 
 */
public interface PerformanceInfoService {
	public JSONArray getAllEquipmentName() throws Exception;			//获取所有设备的名称
	public void saveEquipmentInfo(PerformanceInfo info,String name) throws Exception;	//保绩效信息中的设备信息部分
	public void saveServiceChargeInfo(PerformanceInfo info,
			String familyType,String plateType) throws Exception;		//添加服务费信息
	public List<PerformanceInfoVo> getInfoByCondition(int employeeId,
			Date createDate) throws Exception;							//获取需要绑定记录的信息
}
