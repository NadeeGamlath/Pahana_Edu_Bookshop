package com.insert.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.ItemDao;
import com.insert.model.ItemBean;


@WebServlet("/viewItemServlet")
public class viewItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public viewItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ItemDao dao = new ItemDao();
        List<ItemBean> itemList = dao.getAllItems();

        request.setAttribute("itemList", itemList);
        RequestDispatcher rd = request.getRequestDispatcher("View/view_item.jsp");
        rd.forward(request, response);
    }

}
