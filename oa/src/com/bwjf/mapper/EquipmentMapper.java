package com.bwjf.mapper;

import java.util.List;

/**
 * @author 张恭雨
 * 创建时间：2017年11月15日 上午8:13:05
 * 类描述：设备mapper接口
 * 版本：v1.0 
 */
public interface EquipmentMapper {
	public List<String> getAllName() throws Exception;			//获取所有设备的名称
	public int getIdByName(String name) throws Exception;		//通过名称获取设备ID
	public String getNameById(int equipmentId) throws Exception;//通过id获取名称
}
