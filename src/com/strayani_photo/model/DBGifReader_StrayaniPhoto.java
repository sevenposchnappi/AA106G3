package com.strayani_photo.model;

import java.io.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class DBGifReader_StrayaniPhoto extends HttpServlet {

	Connection con;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("image/jpeg");
		ServletOutputStream out = res.getOutputStream();
		String str_Ani_Pic_No = req.getParameter("str_Ani_Pic_No");
		String str_Pic_type = req.getParameter("stray_Pic_type");
		System.out.println("1");
		
		try {
			System.out.println("2");
			Statement stmt = con.createStatement();
			ResultSet rs;
				if(str_Pic_type==null){
					System.out.println("3");
					String str_Ani_Pic_No2 =new String(str_Ani_Pic_No.getBytes("ISO-8859-1"),"UTF-8");
					rs= stmt.executeQuery(
						"SELECT stray_Ani_Pic FROM STRAY_ANI_PHOTOS WHERE str_Ani_Pic_No='"+str_Ani_Pic_No2+"'");
				}else{
					String stray_Ani_Id = req.getParameter("stray_Ani_Id");
					String stray_Ani_Id2 =new String(stray_Ani_Id.getBytes("ISO-8859-1"),"UTF-8");
					String str_Pic_type2 =new String(str_Pic_type.getBytes("ISO-8859-1"),"UTF-8");
					System.out.println("4");
					rs= stmt.executeQuery(
							"SELECT stray_Ani_Pic FROM STRAY_ANI_PHOTOS WHERE stray_Ani_Id='"+stray_Ani_Id2+"'"+"AND stray_Pic_type='"+str_Pic_type2+"'");
				}
			
			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("stray_Ani_Pic"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {	//水桶
					out.write(buf, 0, len);
				}
				in.close();
			} else {
				InputStream in = getServletContext().getResourceAsStream("/images/tomcat.gif");
				byte[] buf = new byte[in.available()]; 	//建立水桶
				in.read(buf);							//把資料放進水桶			
				out.write(buf);							//把水桶裡的資料倒出來
				in.close();
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println(e);
			System.out.println("?");
		}
	}

	public void init() throws ServletException {
		try {
			Context ctx = new javax.naming.InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

}
