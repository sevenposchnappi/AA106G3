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

import org.apache.catalina.Session;

import com.adoptani_message.model.AdoptaniMessageService;
import com.adoptani_message.model.AdoptaniMessageVO;




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
				String str = req.getParameter("ado_Ani_Mes_No");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�e�i�ʪ��d���s��ex.42000001");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_message/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				String ado_Ani_Mes_No = null;
				try {
					ado_Ani_Mes_No = new String(str);
				} catch (Exception e) {
					errorMsgs.add("�e�i�ʪ��d���s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_message/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				AdoptaniMessageService adoptaniMessageSvc = new AdoptaniMessageService();
				AdoptaniMessageVO adoptaniMessageVO = adoptaniMessageSvc.getOneAdoptaniMessage(ado_Ani_Mes_No);
				if (adoptaniMessageVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_message/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("adoptaniMessageVO", adoptaniMessageVO); // ��Ʈw���X��adoptaniVO����,�s�Jreq
				if("getOne_For_Display".equals(action)){
					String url = "/adoptani_message/listOneAdoptaniMessage.jsp";
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
						.getRequestDispatcher("/adoptani_message/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		 if ("insert".equals(action)) { // �Ӧ�addAdoptani.jsp���ШD�C insert�g�b�e������n�ݡC
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to send the ErrorPage view.
				
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
					String mem_Id = null;
					try {
						System.out.println(req.getParameter("mem_Id"));
						int mem_Id2 = Integer.parseInt(req.getParameter("mem_Id"));
						mem_Id = req.getParameter("mem_Id");	
					} catch (Exception e) {
						errorMsgs.add("�п�J���T�|���s��");
					}
					
					String adopt_Ani_Id = null;
					try {
						System.out.println(req.getParameter("adopt_Ani_Id"));
						int adopt_Ani_Id2 = Integer.parseInt(req.getParameter("adopt_Ani_Id"));
						adopt_Ani_Id = req.getParameter("adopt_Ani_Id");	
					} catch (Exception e) {
						errorMsgs.add("�п�J���T�e�i�ʪ��s��");
					}
					
					String ado_Ani_Mes = req.getParameter("ado_Ani_Mes");
					
					
					
					
					
					

					AdoptaniMessageVO adoptaniMessageVO = new AdoptaniMessageVO();
						adoptaniMessageVO.setMem_Id(mem_Id);
						adoptaniMessageVO.setAdopt_Ani_Id(adopt_Ani_Id);
						adoptaniMessageVO.setAdo_Ani_Mes(ado_Ani_Mes);
					
					
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("adoptaniMessageVO", adoptaniMessageVO); // �t����J�榡���~��empVO����,�]�s�Jreq
						RequestDispatcher failureView = req
								.getRequestDispatcher("/adoptani_message/addAdoptaniMessage.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.�}�l�s�W���***************************************/
					AdoptaniMessageService adoptaniMessageSvc = new AdoptaniMessageService();
					adoptaniMessageVO = adoptaniMessageSvc.addAdoptaniMessage(adopt_Ani_Id, mem_Id, ado_Ani_Mes);
					//Service��add��k�|�^��VO�C
					/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
					String url = "/adoptani_message/listAllAdoptaniMessage.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllAdoptani.jsp
					successView.forward(req, res);				
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_message/addAdoptaniMessage.jsp");
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
					String ado_Ani_Mes_No = req.getParameter("ado_Ani_Mes_No");
					String ado_Ani_Mes = req.getParameter("ado_Ani_Mes");
					

					AdoptaniMessageVO adoptaniMessageVO = new AdoptaniMessageVO();
						adoptaniMessageVO.setAdo_Ani_Mes_No(ado_Ani_Mes_No);
						adoptaniMessageVO.setAdo_Ani_Mes(ado_Ani_Mes);

						
						// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						
						req.setAttribute("adoptaniMessageVO", adoptaniMessageVO); // �t����J�榡���~��empVO����,�]�s�Jreq
						RequestDispatcher failureView = req
								.getRequestDispatcher("/adoptani_message/update_adoptaniMessage_input.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.�}�l�ק���*****************************************/
					System.out.println("�}�l�ק���:"+ado_Ani_Mes);
					
					req.setAttribute("adoptaniMessageVO", adoptaniMessageVO);
					AdoptaniMessageService adoptaniMessageSvc = new AdoptaniMessageService();
					adoptaniMessageVO = adoptaniMessageSvc.updateAdoptaniMessage(ado_Ani_Mes_No, ado_Ani_Mes);
					
					/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
					System.out.println("�ק粒��,�ǳ����");
					req.setAttribute("adoptaniMessageVO", adoptaniMessageVO); // ��Ʈwupdate���\��,���T����adoptaniMessageVO����,�s�Jrequest scope���C
					String url = requestURL;
					RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���
					successView.forward(req, res);

					/***************************��L�i�઺���~�B�z*************************************/
				} catch (Exception e) {
					System.out.println("�ק��ƥ���");
					errorMsgs.add("�ק��ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_message/update_adoptaniMessage_input.jsp");
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
					String ado_Ani_Mes_No = new String(req.getParameter("ado_Ani_Mes_No").trim());
					
					/***************************2.�}�l�d�߸��****************************************/
					AdoptaniMessageService adoptaniMessageSvc = new AdoptaniMessageService();
					AdoptaniMessageVO adoptaniMessageVO = adoptaniMessageSvc.getOneAdoptaniMessage(ado_Ani_Mes_No);
					
				
					/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
					req.setAttribute("adoptaniMessageVO", adoptaniMessageVO);         // ��Ʈw���X��adoptaniVO����,�s�Jreq
					String url = "/adoptani_message/update_adoptaniMessage_input.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_adoptani_input.jsp
					successView.forward(req, res);

					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_message/listAllAdoptaniMessage.jsp");
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
					String ado_Ani_Mes_No = req.getParameter("ado_Ani_Mes_No");
					
					/***************************2.�}�l�R�����***************************************/
					AdoptaniMessageService adoptaniMessageSvc = new AdoptaniMessageService();
					adoptaniMessageSvc.deleteAdoptaniMessage(ado_Ani_Mes_No);
					
					/***************************3.�R������,�ǳ����(Send the Success view)***********/								
					String url = "/adoptani_message/listAllAdoptaniMessage.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
					successView.forward(req, res);
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add("�R����ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_message/listAllAdoptaniMessage.jsp");
					failureView.forward(req, res);
				}
			}		 
	}

}
