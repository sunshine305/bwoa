package com.bwjf.serviceImpl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bwjf.entity.PerformanceInfo;
import com.bwjf.entity.PerformanceInfoVo;
import com.bwjf.entity.ServiceCharge;
import com.bwjf.mapper.EquipmentMapper;
import com.bwjf.mapper.PerformanceInfoMapper;
import com.bwjf.mapper.ServiceChargeMapper;
import com.bwjf.service.PerformanceInfoService;

/**
 * @author 张恭雨
 * 创建时间：2017年11月15日 上午8:26:56
 * 类描述：绩效信息service实现
 * 版本：v1.0 
 */
@Service
@Transactional
public class PerformanceInfoServiceImpl implements PerformanceInfoService {
	private PerformanceInfoMapper infoMapper;
	private EquipmentMapper equipmentMapper;
	private ServiceChargeMapper chargeMapper;
	public PerformanceInfoMapper getInfoMapper() {
		return infoMapper;
	}
	@Resource
	public void setInfoMapper(PerformanceInfoMapper infoMapper) {
		this.infoMapper = infoMapper;
	}
	public EquipmentMapper getEquipmentMapper() {
		return equipmentMapper;
	}
	@Resource
	public void setEquipmentMapper(EquipmentMapper equipmentMapper) {
		this.equipmentMapper = equipmentMapper;
	}
	public ServiceChargeMapper getChargeMapper() {
		return chargeMapper;
	}
	@Resource
	public void setChargeMapper(ServiceChargeMapper chargeMapper) {
		this.chargeMapper = chargeMapper;
	}
	/*
	 * 获取所有设备的名称，ajax获取
	 */
	@Override
	public JSONArray getAllEquipmentName() throws Exception {
		// TODO Auto-generated method stub
		List<String> names=equipmentMapper.getAllName();
		//创建jsonarray对象
		JSONArray array=new JSONArray();
		//数据类型转换
		array=JSONArray.fromObject(names);
		return array;
	}
	@Override
	public void saveEquipmentInfo(PerformanceInfo info, String name)
			throws Exception {
		//获取设备ID
		int equipmentId=equipmentMapper.getIdByName(name);		
		//设置属性
		info.setEquipmentId(equipmentId);
		info.setCreateDate(new Date());
		//保存信息
		infoMapper.saveEquipmentInfo(info);;
		
	}
	@Override
	public void saveServiceChargeInfo(PerformanceInfo info, String familyType,
			String plateType) throws Exception {
		// TODO Auto-generated method stub
		//获取服务费类型ID
		int serviceChargeId=chargeMapper.
				getIdByCondition(familyType, plateType);
		//设置属性
		info.setServiceChargeId(serviceChargeId);
		info.setCreateDate(new Date());
		//保存信息
		infoMapper.saveServiceChargeInfo(info);
	}
	@Override
	public List<PerformanceInfoVo> getInfoByCondition(int employeeId,
			Date createDate) throws Exception {
		//格式化时间
		String date[]=createDate.toLocaleString().split("\\ ");
		//返回查询结果信息		
		List<PerformanceInfoVo> infoVos=
				infoMapper.getInfoByCondition(employeeId, date[0]);
		
		//遍历集合
		for(PerformanceInfoVo infoVo:infoVos){
			//判断是设备还是服务费的记录
			if(infoVo.getEquipmentId()==0){
				ServiceCharge serviceCharge=chargeMapper.
						getServiceChargeById(infoVo.getServiceChargeId());
				infoVo.setType(serviceCharge.getFamilyType()+"/"+serviceCharge.getPlateType());
			}				
			else
				infoVo.setType(equipmentMapper.getNameById(infoVo.getEquipmentId()));
		}
		return infoVos;
	}
}
