package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;


import dao.ProductDAO;
import dto.ProductBean;

public class StoreCategoryShowMoreService {

	public ArrayList<ProductBean> categoryShowMoreList(String category) throws Exception {
		System.out.println("위치: StoreCategoryShowMoreService categoryShowMoreList 메소드 들어옴.");
	   
		Connection con = getConnection();
		ProductDAO productDAO = ProductDAO.getInstance();
		productDAO.setConnection(con);
	   
	    ArrayList<ProductBean> categoryShowMoreList = productDAO.categoryShowMoreList(category);
	    System.out.println("위치: StoreCategoryShowMoreService.java 상태: ProductDAO에서 반환받아온 categoryShowMoreList: "+ categoryShowMoreList);
	    
	    
	    
	    return categoryShowMoreList;
	}
}
