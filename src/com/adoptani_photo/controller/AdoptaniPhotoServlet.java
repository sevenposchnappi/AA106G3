package com.adoptani_photo.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.jsp.PageContext;

import com.adoptani.model.AdoptaniService;
import com.adoptani.model.AdoptaniVO;
import com.adoptani_photo.model.*;


@WebServlet("/adoptani_photo.do")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 10 * 1024 * 1024, maxRequestSize = 100 * 1024 * 1024)

public class AdoptaniPhotoServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
       
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		System.out.println("into AdoptaniPhotoServlet.java");
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		System.out.println(action);
		if ("getOne_For_Display".equals(action) || "getOne_For_Display_From_listOneAdoptani.jsp".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			AdoptaniVO adoptaniVO = (AdoptaniVO) req.getAttribute("adoptaniVO"); //AdoptaniVOServlet.java(Concroller), �s�Jreq��adoptaniVO����
			System.out.println("action:"+action);
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("adopt_Ani_Id");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�e�i�ʪ��s��");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_photo/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer adopt_Ani_Id = null;
				try {
					adopt_Ani_Id = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�e�i�ʪ��s���榡�����T");
				}
				System.out.println("adopt_Ani_Id:"+adopt_Ani_Id);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_photo/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				AdoptaniPhotoService adoptaniPhotoSvc = new AdoptaniPhotoService();
				List<AdoptaniPhotoVO> oneAdoptAniPhotoList = adoptaniPhotoSvc.getOneAdoptaniPhoto(str);
				if (oneAdoptAniPhotoList == null) {
					errorMsgs.add("�d�L���");
				}
System.out.println("�d�߸��");
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_photo/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("oneAdoptAniPhotoList", oneAdoptAniPhotoList); 
				if("getOne_For_Display".equals(action)){
					String url = "/adoptani_photo/listOneAdoptaniPhoto.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, res);
				}
				else if("getOne_For_Display_From_listOneAdoptani.jsp".equals(action)){
					System.out.println("�d�߸�Ƨ���");
					String url = "/adoptani/listOneAdoptaniAllPhoto.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, res);
				}

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/adoptani_photo/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
		 if ("insert".equals(action)) { // �Ӧ�addAdoptani.jsp���ШD�C insert�g�b�e������n�ݡC
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to send the ErrorPage view.
				System.out.println("here is \"insert\" in Controller (1)");
				req.setAttribute("errorMsgs", errorMsgs);
				
				List<byte[]> picList = new ArrayList();	//�ΨӸ˷Ӥ�
				List<String> picTypeList = new ArrayList();	//�ΨӸ˷Ӥ�����(�j�Y�K(0)�Bor��ï�Ӥ�(1))
				

				
				
				
				try {
					/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
					System.out.println("here is \"insert\" in Controller (2)");
					String mem_Id = req.getParameter("mem_Id");
					String adopt_Ani_Id = req.getParameter("adopt_Ani_Id");
					String ado_Pic_name = req.getParameter("ado_Pic_name");
					if (ado_Pic_name == null || (ado_Pic_name.trim()).length() == 0) {
						errorMsgs.add("�п�J�e�i�ʪ��W�r");
					}
					String ado_Pic_nameEX = req.getParameter("ado_Pic_nameEX");
//					String ado_Pic_type = req.getParameter("ado_Pic_type");
					
					
					Collection<Part> parts = req.getParts();
					
					System.out.println("Total parts : " + parts.size() );

/*�Ϥ�*/				byte[] ado_Ani_Pic = null;
					
					for (Part part : parts) {	//parts�̭��]�t�D�Ϥ���ơC
						String picType = part.getContentType();
						System.out.println("part's name : " + part.getName() );
						if("image/jpeg".equals(picType)  || "image/png".equals(picType)){	//�Ϥ����~�ΤG�줸���Ū�i��
							InputStream in = part.getInputStream();
							ado_Ani_Pic = new byte[in.available()];
							in.read(ado_Ani_Pic);
							picList.add(ado_Ani_Pic);
							in.close();
							if("ado_Ani_Pic_head".equals(part.getName())){
								String ado_Pic_type = "0"; 
								picTypeList.add(ado_Pic_type);
							}else{
								String ado_Pic_type = "1";
								picTypeList.add(ado_Pic_type);
							}
					
							}
						}
					
					System.out.println("picList.size(): "+ picList.size());

					AdoptaniPhotoVO adoptaniPhotoVO = new AdoptaniPhotoVO();
					
					adoptaniPhotoVO.setMem_Id(mem_Id);
					adoptaniPhotoVO.setAdopt_Ani_Id(adopt_Ani_Id);
					adoptaniPhotoVO.setAdo_Pic_name(ado_Pic_name);
					adoptaniPhotoVO.setAdo_Pic_nameEX(ado_Pic_nameEX);
//					adoptaniPhotoVO.setAdo_Pic_type(ado_Pic_type);
										
/*�Ϥ�*/				adoptaniPhotoVO.setAdo_Ani_Pic(ado_Ani_Pic);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						
						req.setAttribute("adoptaniPhotoVO", adoptaniPhotoVO); // �t����J�榡���~��adoptaniPhotoVO����,�]�s�Jreq
						RequestDispatcher failureView = req
								.getRequestDispatcher("/adoptani_photo/addAdoptaniPhoto.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.�}�l�s�W���***************************************/
					AdoptaniPhotoService adoptaniPhotoService = new AdoptaniPhotoService();
					for(int i=0 ; i<picList.size() ; i++){
						String ado_Pic_name_insert = ado_Pic_name + i;
					adoptaniPhotoVO = adoptaniPhotoService.addAdoptaniPhoto(adopt_Ani_Id, mem_Id, picList.get(i), ado_Pic_name_insert, ado_Pic_nameEX, picTypeList.get(i));
					}
					/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
					String url = "/adoptani_photo/listAllAdoptaniPhoto.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllAdoptani.jsp
					successView.forward(req, res);				
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add(e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_photo/addAdoptaniPhoto.jsp");
					failureView.forward(req, res);
				}
			}

			
			if ("update".equals(action)) { // �Ӧ�update_adoptani_input.jsp���ШD
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
						
				
				
				try {
					/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
					String ado_Ani_Pic_No = req.getParameter("ado_Ani_Pic_No");
					AdoptaniPhotoService adoptaniPhotoSvc = new AdoptaniPhotoService();
					AdoptaniPhotoVO adoptaniPhotoVO = adoptaniPhotoSvc.findByPrimaryKey(ado_Ani_Pic_No);
					String ado_Pic_type = req.getParameter("ado_Pic_type");
					
					
					adoptaniPhotoVO.setAdo_Pic_type(ado_Pic_type);
					
					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						
						req.setAttribute("adoptaniPhotoVO", adoptaniPhotoVO); // �t����J�榡���~��empVO����,�]�s�Jreq
						RequestDispatcher failureView = req
								.getRequestDispatcher("/adoptani_photo/update_adoptaniPhoto_input.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.�}�l�ק���*****************************************/
					adoptaniPhotoSvc.upadaeAdoptaniPhoto(adoptaniPhotoVO);
					/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
					req.setAttribute("adoptaniPhotoVO", adoptaniPhotoVO); // ��Ʈwupdate���\��,���T����empVO����,�s�Jreq
					String url = "/adoptani_photo/listAllAdoptaniPhoto.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
					successView.forward(req, res);
					/***************************��L�i�઺���~�B�z*************************************/
				} catch (Exception e) {
					errorMsgs.add("�ק��ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_photo/update_adoptaniPhoto_input.jsp");
					failureView.forward(req, res);
				}
			}

			if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllAdoptani.jsp���ШD

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					/***************************1.�����ШD�Ѽ�****************************************/
					String ado_Ani_Pic_No = new String(req.getParameter("ado_Ani_Pic_No").trim());
					
					/***************************2.�}�l�d�߸��****************************************/
					AdoptaniPhotoService adoptaniPhotoSvc = new AdoptaniPhotoService();
					AdoptaniPhotoVO adoptaniPhotoVO = adoptaniPhotoSvc.findByPrimaryKey(ado_Ani_Pic_No);
					
				
					/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
					req.setAttribute("adoptaniPhotoVO", adoptaniPhotoVO);         // ��Ʈw���X��adoptaniVO����,�s�Jreq
					String url = "/adoptani_photo/update_adoptaniPhoto_input.jsp";
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
					String str = req.getParameter("ado_Ani_Pic_No");
					
					/***************************2.�}�l�R�����***************************************/
					AdoptaniPhotoService adoptaniPhoto = new AdoptaniPhotoService();
					adoptaniPhoto.deleteAdoptaniPhoto(str);
					
					/***************************3.�R������,�ǳ����(Send the Success view)***********/								
					String url = "/adoptani_photo/listAllAdoptaniPhoto.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
					successView.forward(req, res);
					
					/***************************��L�i�઺���~�B�z**********************************/
				} catch (Exception e) {
					errorMsgs.add("�R����ƥ���:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/adoptani_photo/listAllAdoptaniPhoto.jsp");
					failureView.forward(req, res);
				}
			}			 
	}

}
