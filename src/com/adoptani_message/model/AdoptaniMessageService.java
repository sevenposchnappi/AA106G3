package com.adoptani_message.model;

import java.util.List;

/**負責調派DAO**/

public class AdoptaniMessageService {
	
	private AdoptaniMessageDAO_interface dao;
	
	public AdoptaniMessageService(){
		dao = new AdoptaniMessageJNDIDAO();
	}
	
	public AdoptaniMessageVO adoptaniMessageVO(String Adopt_Ani_Id, String Mem_Id, String Ado_Ani_Mes){
		
		AdoptaniMessageVO adoptaniMessageVO = new AdoptaniMessageVO();
		
//		adoptaniVO.setAdopt_Ani_Id(Adopt_Ani_Id);
		
		adoptaniMessageVO.setAdopt_Ani_Id(Adopt_Ani_Id);
		adoptaniMessageVO.setMem_Id(Mem_Id);
		adoptaniMessageVO.setAdo_Ani_Mes(Ado_Ani_Mes);

		
		dao.insert(adoptaniMessageVO);
		
		return adoptaniMessageVO;
	}
	
	/**修改
	 * @param Ado_Ani_Mes_No:傳入訊息編號，辨識要更改哪一筆留言。
	 * @param Ado_Ani_Mes:欲更改留言內容
	 * @return adoptaniMessageVO 物件
	 * **/
	
	public AdoptaniMessageVO updateAdoptani(String Ado_Ani_Mes_No, String Ado_Ani_Mes){
		
		AdoptaniMessageVO adoptaniMessageVO = new AdoptaniMessageVO();
		adoptaniMessageVO.setAdo_Ani_Mes(Ado_Ani_Mes);
		adoptaniMessageVO.setAdo_Ani_Mes_No(Ado_Ani_Mes_No);
		
		dao.update(adoptaniMessageVO);
		
		return adoptaniMessageVO;
	}
	
	public void deleteAdoptani(String Ado_Ani_Mes_No){
		dao.delete(Ado_Ani_Mes_No);
		
	}
	public AdoptaniMessageVO getOneAdoptani(String Ado_Ani_Mes_No){
		return dao.findByPrimaryKey(Ado_Ani_Mes_No);
	}
	
	public List<AdoptaniMessageVO> getAll() {
		return dao.getAll();
	}
	
}
