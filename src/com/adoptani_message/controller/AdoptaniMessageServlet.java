package com.adoptani_message.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.adoptani.model.AdoptaniService;
import com.adoptani.model.AdoptaniVO;




public class AdoptaniMessageServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
       

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)	|| "getOne_For_Display_FromView".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("adopt_Ani_Id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�e�i�ʪ��s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				String adopt_Ani_Id = null;
				try {
					adopt_Ani_Id = new String(str);
				} catch (Exception e) {
					errorMsgs.add("�e�i�ʪ��s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				AdoptaniService adoptaniSvc = new AdoptaniService();
				AdoptaniVO adoptaniVO = adoptaniSvc.getOneAdoptani(adopt_Ani_Id);
				if (adoptaniVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("adoptaniVO", adoptaniVO); // ��Ʈw���X��adoptaniVO����,�s�Jreq
				if("getOne_For_Display".equals(action)){
					String url = "/adoptani/listOneAdoptaniView.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneAdoptani.jsp
					successView.forward(req, res);
				}else if("getOne_For_Display_FromView".equals(action)){
					String url = "/adoptani/listOneAdoptani.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneAdoptani.jsp
					successView.forward(req, res);
				}
				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/adoptani/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		 if ("insert".equals(action)) { // �Ӧ�addAdoptani.jsp���ШD�C insert�g�b�e������n�ݡC
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to send the ErrorPage view.
				
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
					String Mem_Id = req.getParameter("Mem_Id");
					String Adopt_Ani_name = req.getParameter("Adopt_Ani_name");
					String Adopt_Ani_type = req.getParameter("Adopt_Ani_type");
					String Adopt_Ani_gender = req.getParameter("Adopt_Ani_gender");
					String Adopt_Ani_heal = req.getParameter("Adopt_Ani_heal");
					String Adopt_Ani_Vac = req.getParameter("Adopt_Ani_Vac");
					String Adopt_Ani_color = req.getParameter("Adopt_Ani_color");
					String Adopt_Ani_body = req.getParameter("Adopt_Ani_body");
					String Adopt_Ani_age = req.getParameter("Adopt_Ani_age");
					String Adopt_Ani_Neu = req.getParameter("Adopt_Ani_Neu");
					String Adopt_Ani_chip = req.getParameter("Adopt_Ani_chip");
//					String Adopt_Ani_date = req.getParameter("Adopt_Ani_date");
					String Adopt_Ani_status = req.getParameter("Adopt_Ani_status");
//					String Adopt_Ani_CreDate = req.getParameter("Adopt_Ani_CreDate");
//					String Adopt_Ani_FinLat = req.getParameter("Adopt_Ani_FinLat");
//					String Adopt_Ani_FinLon = req.getParameter("Adopt_Ani_FinLon");
					String Adopt_Ani_city = req.getParameter("Adopt_Ani_city");
					String Adopt_Ani_town = req.getParameter("Adopt_Ani_town");
					String Adopt_Ani_road = req.getParameter("Adopt_Ani_road");
					
					Integer Adopt_Ani_like = null;
					try {
						Adopt_Ani_like = Integer.parseInt(req.getParameter("Adopt_Ani_like"));
					} catch (Exception e) {
						errorMsgs.add("like�ƽп�J�Ʀr");
					}
					
					
					
					java.sql.Timestamp Adopt_Ani_date = null;
					try {
						System.out.println(req.getParameter("Adopt_Ani_date").trim());
						String Adopt_Ani_date_from_jsp = req.getParameter("Adopt_Ani_date").trim();
						Adopt_Ani_date = java.sql.Timestamp.valueOf(Adopt_Ani_date_from_jsp);
					} catch (Exception e) {
						Adopt_Ani_date=new java.sql.Timestamp(System.currentTimeMillis());
						errorMsgs.add("�п�J���!");
					}
					Double Adopt_Ani_FinLat = null;
					try {
						
						Adopt_Ani_FinLat = new Double(req.getParameter("Adopt_Ani_FinLat").trim());
					} catch (NumberFormatException e) {
						Adopt_Ani_FinLat = 0.0;
						errorMsgs.add("�ж�gGoogle map �g�� xxx.xxxxxx");
						System.out.println("�ж�gGoogle map �g�� xxx.xxxxxx");
					}
					Double Adopt_Ani_FinLon = null;
					try {
						Adopt_Ani_FinLon = new Double(req.getParameter("Adopt_Ani_FinLon").trim());
					} catch (NumberFormatException e) {
						Adopt_Ani_FinLon = 0.0;
						errorMsgs.add("�ж�gGoogle map �n�� xxx.xxxxxx");
					}
					

					AdoptaniVO adoptaniVO = new AdoptaniVO();
						adoptaniVO.setMem_Id(Mem_Id);
						adoptaniVO.setAdopt_Ani_name(Adopt_Ani_name);
						adoptaniVO.setAdopt_Ani_type(Adopt_Ani_type);
						adoptaniVO.setAdopt_Ani_gender(Adopt_Ani_gender);
						adoptaniVO.setAdopt_Ani_heal(Adopt_Ani_heal);
						adoptaniVO.setAdopt_Ani_Vac(Adopt_Ani_Vac);
						adoptaniVO.setAdopt_Ani_color(Adopt_Ani_color);
						adoptaniVO.setAdopt_Ani_body(Adopt_Ani_body);
						adoptaniVO.setAdopt_Ani_age(Adopt_Ani_age);
						adoptaniVO.setAdopt_Ani_Neu(Adopt_Ani_Neu);
						adoptaniVO.setAdopt_Ani_chip(Adopt_Ani_chip);
						adoptaniVO.setAdopt_Ani_date(Adopt_Ani_date);
						adoptaniVO.setAdopt_Ani_status(Adopt_Ani_status);
						adoptaniVO.setAdopt_Ani_FinLat(Adopt_Ani_FinLat);
						adoptaniVO.setAdopt_Ani_FinLon(Adopt_Ani_FinLon);
						adoptaniVO.setAdopt_Ani_city(Adopt_Ani_city);
						adoptaniVO.setAdopt_Ani_town(Adopt_Ani_town);
						adoptaniVO.setAdopt_Ani_road(Adopt_Ani_road);
						adoptaniVO.setAdopt_Ani_like(Adopt_Ani_like);
						System.out.println("test");
						System.out.println(errorMsgs.isEmpty());
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("adoptaniVO", adoptaniVO); // �t����J�榡���~��empVO����,�]�s�Jreq
						RequestDispatcher failureView = req
								.getRequestDispatcher("/adoptani/addAdoptani.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.�}�l�s�W���***************************************/
					AdoptaniService adoptaniSvc = new AdoptaniService();
					adoptaniVO = adoptaniSvc.addAdoptani(Mem_Id, Adopt_Ani_name, Adopt_Ani_type, Adopt_Ani_gender, Adopt_Ani_heal, Adopt_Ani_Vac, Adopt_Ani_color, Adopt_Ani_body, Adopt_Ani_age, Adopt_Ani_Neu, Adopt_Ani_chip, Adopt_Ani_date, Adopt_Ani_status, Adopt_Ani_date,Adopt_Ani_FinLat, Adopt_Ani_FinLon, Adopt_Ani_city, Adopt_Ani_town, Adopt_Ani_road ,Adopt_Ani_like);
					//����إ߮ɶ�(Adopt_Ani_Credate)���ѼơA�Ȯɥ���Adopt_Ani_date�N���A���Τ���A�]��sql�O��sysdate�ءC
					
					/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
					String url = "/adoptani/listAllAdoptani.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllAdoptani.jsp
					successView.forward(req, res);				
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani/addAdoptani.jsp");
					failureView.forward(req, res);
				}
			}

			
			if ("update".equals(action) ) { // �Ӧ�update_adoptani_input.jsp���ШD
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				String requestURL = req.getParameter("requestURL");
				try {
					/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
					String adopt_Ani_Id = req.getParameter("adopt_Ani_Id");
					String Mem_Id = req.getParameter("Mem_Id");
					String Adopt_Ani_name = req.getParameter("Adopt_Ani_name");
					String Adopt_Ani_type = req.getParameter("Adopt_Ani_type");
					String Adopt_Ani_gender = req.getParameter("Adopt_Ani_gender");
					String Adopt_Ani_heal = req.getParameter("Adopt_Ani_heal");
					String Adopt_Ani_Vac = req.getParameter("Adopt_Ani_Vac");
					String Adopt_Ani_color = req.getParameter("Adopt_Ani_color");
					String Adopt_Ani_body = req.getParameter("Adopt_Ani_body");
					String Adopt_Ani_age = req.getParameter("Adopt_Ani_age");
					String Adopt_Ani_Neu = req.getParameter("Adopt_Ani_Neu");
					String Adopt_Ani_chip = req.getParameter("Adopt_Ani_chip");
//					String Adopt_Ani_date = req.getParameter("Adopt_Ani_date");
					String Adopt_Ani_status = req.getParameter("Adopt_Ani_status");
//					String Adopt_Ani_CreDate = req.getParameter("Adopt_Ani_CreDate");
//					String Adopt_Ani_FinLat = req.getParameter("Adopt_Ani_FinLat");
//					String Adopt_Ani_FinLon = req.getParameter("Adopt_Ani_FinLon");
					String Adopt_Ani_city = req.getParameter("Adopt_Ani_city");
					String Adopt_Ani_town = req.getParameter("Adopt_Ani_town");
					String Adopt_Ani_road = req.getParameter("Adopt_Ani_road");
					
					Integer Adopt_Ani_like = null;
					try {
						Adopt_Ani_like = Integer.parseInt(req.getParameter("Adopt_Ani_like"));
					} catch (Exception e) {
						errorMsgs.add("like�ƽп�J�Ʀr");
					}
					
					System.out.println("here is \"update\" in Controller (1)");
					
					
					
					java.sql.Timestamp Adopt_Ani_date = null;
					try {
						
						Adopt_Ani_date = java.sql.Timestamp.valueOf(req.getParameter("Adopt_Ani_date").trim());
					} catch (Exception e) {
						Adopt_Ani_date=new java.sql.Timestamp(System.currentTimeMillis());
						errorMsgs.add("�п�J���!");
					}
					System.out.println("here is \"update\" in Controller (2)");
					Double Adopt_Ani_FinLat = null;
					try {
						
						Adopt_Ani_FinLat = new Double(req.getParameter("Adopt_Ani_FinLat").trim());
					} catch (NumberFormatException e) {
						Adopt_Ani_FinLat = 0.0;
						errorMsgs.add("�ж�gGoogle map �g�� xxx.xxxxxx");
						System.out.println("�ж�gGoogle map �g�� xxx.xxxxxx");
					}
					System.out.println("here is \"update\" in Controller (3)");
					Double Adopt_Ani_FinLon = null;
					try {
						Adopt_Ani_FinLon = new Double(req.getParameter("Adopt_Ani_FinLon").trim());
					} catch (NumberFormatException e) {
						Adopt_Ani_FinLon = 0.0;
						errorMsgs.add("�ж�gGoogle map �g�� xxx.xxxxxx");
					}
					
					

					AdoptaniVO adoptaniVO = new AdoptaniVO();
						adoptaniVO.setAdopt_Ani_Id(adopt_Ani_Id);
						adoptaniVO.setMem_Id(Mem_Id);
						adoptaniVO.setAdopt_Ani_name(Adopt_Ani_name);
						adoptaniVO.setAdopt_Ani_type(Adopt_Ani_type);
						adoptaniVO.setAdopt_Ani_gender(Adopt_Ani_gender);
						adoptaniVO.setAdopt_Ani_heal(Adopt_Ani_heal);
						adoptaniVO.setAdopt_Ani_Vac(Adopt_Ani_Vac);
						adoptaniVO.setAdopt_Ani_color(Adopt_Ani_color);
						adoptaniVO.setAdopt_Ani_body(Adopt_Ani_body);
						adoptaniVO.setAdopt_Ani_age(Adopt_Ani_age);
						adoptaniVO.setAdopt_Ani_Neu(Adopt_Ani_Neu);
						adoptaniVO.setAdopt_Ani_chip(Adopt_Ani_chip);
						adoptaniVO.setAdopt_Ani_date(Adopt_Ani_date);
						adoptaniVO.setAdopt_Ani_status(Adopt_Ani_status);
						adoptaniVO.setAdopt_Ani_FinLat(Adopt_Ani_FinLat);
						adoptaniVO.setAdopt_Ani_FinLon(Adopt_Ani_FinLon);
						adoptaniVO.setAdopt_Ani_city(Adopt_Ani_city);
						adoptaniVO.setAdopt_Ani_town(Adopt_Ani_town);
						adoptaniVO.setAdopt_Ani_road(Adopt_Ani_road);
						adoptaniVO.setAdopt_Ani_like(Adopt_Ani_like);
						
						System.out.println(errorMsgs.isEmpty());
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						
						req.setAttribute("adoptaniVO", adoptaniVO); // �t����J�榡���~��empVO����,�]�s�Jreq
						RequestDispatcher failureView = req
								.getRequestDispatcher("/adoptani/update_adoptani_input.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.�}�l�ק���*****************************************/
					System.out.println("�}�l�ק���"+"adopt_Ani_Id"+adopt_Ani_Id+"Mem_Id"+Mem_Id+"Adopt_Ani_name"+Adopt_Ani_name+"Adopt_Ani_type"+Adopt_Ani_type +"Adopt_Ani_gender"+Adopt_Ani_gender +"Adopt_Ani_heal"+Adopt_Ani_heal +"Adopt_Ani_Vac"+Adopt_Ani_Vac +"Adopt_Ani_color"+Adopt_Ani_color +"Adopt_Ani_body"+Adopt_Ani_body +"Adopt_Ani_age"+Adopt_Ani_age +"Adopt_Ani_Neu"+Adopt_Ani_Neu +"Adopt_Ani_chip"+Adopt_Ani_chip +"Adopt_Ani_date"+Adopt_Ani_date +"Adopt_Ani_status"+Adopt_Ani_status +"Adopt_Ani_date"+Adopt_Ani_date +"Adopt_Ani_FinLat"+Adopt_Ani_FinLat +"Adopt_Ani_FinLon"+Adopt_Ani_FinLon +"Adopt_Ani_city"+Adopt_Ani_city +"Adopt_Ani_town"+Adopt_Ani_town +"Adopt_Ani_road"+Adopt_Ani_road  );
					req.setAttribute("adoptaniVO", adoptaniVO);
					AdoptaniService adoptaniSvc = new AdoptaniService();
					adoptaniVO = adoptaniSvc.updateAdoptani(adopt_Ani_Id ,Mem_Id, Adopt_Ani_name, Adopt_Ani_type, Adopt_Ani_gender, Adopt_Ani_heal, Adopt_Ani_Vac, Adopt_Ani_color, Adopt_Ani_body, Adopt_Ani_age, Adopt_Ani_Neu, Adopt_Ani_chip, Adopt_Ani_date, Adopt_Ani_status, Adopt_Ani_date,Adopt_Ani_FinLat, Adopt_Ani_FinLon, Adopt_Ani_city, Adopt_Ani_town, Adopt_Ani_road,Adopt_Ani_like);
					
					/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
					System.out.println("�ק粒��,�ǳ����");
					req.setAttribute("adoptaniVO", adoptaniVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
					String url = requestURL;
					RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
					successView.forward(req, res);

					/***************************��L�i�઺���~�B�z*************************************/
				} catch (Exception e) {
					System.out.println("�ק��ƥ���");
					errorMsgs.add("�ק��ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani/update_adoptani_input.jsp");
					failureView.forward(req, res);
				}
			}

			if ("getOne_For_Update".equals(action) ) { // �Ӧ�listAllAdoptani.jsp���ШD

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				String requestURL = req.getParameter("requestURL");
				
				try {
					/***************************1.�����ШD�Ѽ�****************************************/
					String adopt_Ani_Id = new String(req.getParameter("adopt_Ani_Id").trim());
					
					/***************************2.�}�l�d�߸��****************************************/
					AdoptaniService adoptaniSvc = new AdoptaniService();
					AdoptaniVO adoptaniVO = adoptaniSvc.getOneAdoptani(adopt_Ani_Id);
					
				
					/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
					req.setAttribute("adoptaniVO", adoptaniVO);         // ��Ʈw���X��adoptaniVO����,�s�Jreq
					String url = "/adoptani/update_adoptani_input.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_adoptani_input.jsp
					successView.forward(req, res);

					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani/listAllAdoptani.jsp");
					failureView.forward(req, res);
				}
			}
		 
			if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
		
				try {
					/***************************1.�����ШD�Ѽ�***************************************/
					String str = req.getParameter("adopt_Ani_Id");
					
					/***************************2.�}�l�R�����***************************************/
					AdoptaniService adoptaniSvc = new AdoptaniService();
					adoptaniSvc.deleteAdoptani(str);
					
					/***************************3.�R������,�ǳ����(Send the Success view)***********/								
					String url = "/adoptani/listAllAdoptani.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
					successView.forward(req, res);
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add("�R����ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani/listAllAdoptani.jsp");
					failureView.forward(req, res);
				}
			}		 
	}

}
