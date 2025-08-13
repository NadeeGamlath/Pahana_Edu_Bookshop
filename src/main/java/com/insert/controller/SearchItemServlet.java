package com.insert.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.insert.dao.ItemDao;
import com.insert.model.ItemBean;

@WebServlet("/SearchItemServlet")
public class SearchItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchItemServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String query = request.getParameter("query");
        List<ItemBean> itemList = ItemDao.searchItem(query);

        request.setAttribute("itemList", itemList);
        request.setAttribute("message", "Showing results for: " + query);
        request.getRequestDispatcher("/View/view_item.jsp").forward(request, response);
	}

}
