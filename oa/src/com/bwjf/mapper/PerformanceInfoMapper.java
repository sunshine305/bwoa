package com.bwjf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bwjf.entity.PerformanceInfo;
import com.bwjf.entity.PerformanceInfoVo;

/**
 * @author 张恭雨
 * 创建时间：2017年11月15日 上午8:19:36
 * 类描述：绩效信息实体
 * 版本：v1.0 
 */
public interface PerformanceInfoMapper {
	public void saveEquipmentInfo(PerformanceInfo info) throws Exception;	//保存设备信息
	public void saveServiceChargeInfo(PerformanceInfo info) throws Exception;	//保存服务费信息
	public List<PerformanceInfoVo> getInfoByCondition(@Param("employeeId")int employeeId,
			@Param("createDate")String createDate) throws Exception;		//获取需要绑定的信息
	
}
