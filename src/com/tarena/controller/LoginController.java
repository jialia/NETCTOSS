package com.tarena.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tarena.dao.AdminDao;
import com.tarena.entity.Admin;
import com.tarena.entity.Module;
import com.tarena.util.ImageUtil;

/**
 * 登陆模块的业务控制器
 * 
 * @author Jsong
 */
@Controller
@RequestMapping("/login")
public class LoginController extends BaseController {
	
	@Resource
	private AdminDao adminDao;
	
	private final static int SUCCESS = 0;
	
	private final static int ADMIN_CODE_ERROR = 1;
	
	private final static int PASSWORD_ERROR = 2;
	
	private final static int IMAGE_CODE_ERROR = 3;
	
	@RequestMapping("toLogin.do")
	public String toLogin() {
		return "main/login";
	}
	
	@ResponseBody
	@RequestMapping("/checkLogin.do")
	public Map<String, Object> checkLogin(
			@RequestParam("adminCode")String adminCode ,
			@RequestParam("password")String password,
			@RequestParam("code")String code,
			HttpSession session ) {
		Map<String, Object> result = new HashMap<String, Object>();
		String imageCode = (String) session.getAttribute("imageCode");
		if (!code.equalsIgnoreCase(imageCode)) {
			result.put("flag", IMAGE_CODE_ERROR);
			return result;
		}
		Admin admin = adminDao.findByCode(adminCode);
		if (admin == null) {
			result.put("flag", ADMIN_CODE_ERROR);
		} else if(!admin.getPassword().equals(password)) {
			result.put("flag", PASSWORD_ERROR);
		} else {
			result.put("flag", SUCCESS);
			//将管理员信息存入Session，用于后续检查
			session.setAttribute("admin", admin);
			List<Module> list = adminDao.findModulesByAdmin(admin.getAdmin_id());
			session.setAttribute("allModules", list);
		}
		return result;
	}
	
	@RequestMapping("/toIndex.do")
	public String toIndex(){
		return "main/index";
	}
	
	@RequestMapping("/createImage.do")
	public void createImage(HttpServletResponse response , HttpSession session)
			throws IOException {
		// 创建图片
		Map<String, BufferedImage> map = ImageUtil.createImage();
		// 获取图片
		String code = map.keySet().iterator().next();
		session.setAttribute("imageCode", code);
		BufferedImage image = map.get(code);
		// 输出图片
		response.setContentType("image/jpeg");
		OutputStream out = response.getOutputStream();
		ImageIO.write(image, "jpeg", out);
		out.close();
	}

}
