package cn.jxufe.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;

import cn.jxufe.service.GameService;

public class FarmServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Autowired
	GameService gameService;
	
	/**
	 * 启动方法入口
	 */
	public void init() throws ServletException {
		super.init();
		WebApplicationContextUtils
		       .getWebApplicationContext(getServletContext())
		       .getAutowireCapableBeanFactory().autowireBean(this);		
		System.out.println("/******************** 后台农场游戏服务开始启动 ***************************/");
		gameService.farmStart();
		System.out.println("/******************** 后台农场游戏服务启动完成 ***************************/");
	}	
}
