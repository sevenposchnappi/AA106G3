package com.adoptani_message.model;

import java.util.List;



public interface AdoptaniMessageDAO_interface {
	public void insert(AdoptaniMessageVO adoptaniMessageVO);
    public void update(AdoptaniMessageVO adoptaniMessageVO);
    public void delete(String ado_Ani_Mes_No);
    public AdoptaniMessageVO findByPrimaryKey(String ado_Ani_Mes_No);
    public List<AdoptaniMessageVO> getAll();
    public List<AdoptaniMessageVO> getOneAllMessage(String Adopt_Ani_Id);
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
    //public List<EmpVO> getAll(Map<String, String[]> map); 

}
