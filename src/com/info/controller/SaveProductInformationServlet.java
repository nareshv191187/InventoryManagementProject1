package com.info.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.info.dto.Product;
import com.info.model.SaveProductDetailsService;

public class SaveProductInformationServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -692262309553467319L;
	HashMap<String, Product> mapProductDetails;
	SaveProductDetailsService prodService = new SaveProductDetailsService();

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		Product productDetails = new Product();
		String productId = req.getParameter("prodId");
		String productName = req.getParameter("select1");
		String productDescription = req.getParameter("description");
		String relatedProductInfo = req.getParameter("relatedProductValue");
		String productPrice = req.getParameter("price");
		String productImageLocation = req.getParameter("productImageLocation");
		String forward = "jsp/home.jsp";
		System.out.println("relatedProductInfo:::::::::::::"+relatedProductInfo);
		if (!(action.equalsIgnoreCase("DELETE") || action
				.equalsIgnoreCase("SELECT"))) {

			productDetails.setProductId(productId);
			productDetails.setProductDescription(productDescription);
			productDetails.setProductName(productName);
			productDetails.setRelatedProductInfo(relatedProductInfo);
			productDetails.setProductPrice(productPrice);
			productDetails.setProductImageLocation(productImageLocation);
		}
		@SuppressWarnings("unchecked")
		HashMap<String, Product> mapDetails = (HashMap<String, Product>) req
				.getServletContext().getAttribute("prodMapDetails");
		if (action.equalsIgnoreCase("ADD")) {

			@SuppressWarnings("unchecked")
			HashMap<String, Product> mapAddDetails = prodService
					.addProductInfo(productDetails, mapDetails);
			req.getServletContext().setAttribute("prodMapDetails",
					mapAddDetails);
			req.setAttribute("errorMessage", productDetails.getProductId()
					+ " Product Data has saved successfully");
			forward = "jsp/home.jsp";
		} else if (action.equalsIgnoreCase("UPDATE")) {
			HashMap<String, Product> mapupdateDetails = prodService
					.updateProductInfo( mapDetails, productDetails);
			req.getServletContext().setAttribute("prodMapDetails",
					mapupdateDetails);

			req.setAttribute("errorMessage",
					"Product Data has updated successfully");
			forward = "jsp/home.jsp";
		} else if (action.equalsIgnoreCase("DELETE")) {
			String key = req.getParameter("deleteKey");
			System.out.println("Delete Key ---" + key);
			HashMap<String, Product> mapdeleteDetails = prodService
					.deleteProductInfo(key, mapDetails);
			req.getServletContext().setAttribute("prodMapDetails",
					mapdeleteDetails);

			req.setAttribute("errorMessage",
					key +" Product Data has deleted successfully");
			forward = "jsp/home.jsp";
		}else if (action.equalsIgnoreCase("UPDATERECORD")) {
			String updateKey  = req.getParameter("updateKey");
			Product productDtl = (Product)mapDetails.get(updateKey);
			req.getServletContext().setAttribute("updateRecordDtl", productDtl);
			forward = "jsp/update.jsp";
		}

		req.getRequestDispatcher(forward).forward(req, resp);

	}
}
