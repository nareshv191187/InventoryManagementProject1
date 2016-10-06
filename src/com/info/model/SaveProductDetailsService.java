package com.info.model;

import java.util.HashMap;

import com.info.dto.Product;

public class SaveProductDetailsService {

	HashMap<String, Product> mapProductDetails;

	public HashMap<String, Product> deleteProductInfo(String key,
			HashMap<String, Product> mapDetails) {
		// TODO Auto-generated method stub
		mapDetails.remove(key);
		return mapDetails;
	}

	public HashMap<String, Product> updateProductInfo(
			HashMap<String, Product> mapDetails, Product productDetails) {
		String key    = productDetails.getProductId();
		Product productDtl    = mapDetails.get(key);
		productDtl.setProductId(key);
		productDtl.setProductDescription(productDetails.getProductDescription());
		productDtl.setProductName(productDtl.getProductName());
		productDtl.setProductPrice(productDetails.getProductPrice());
		productDtl.setRelatedProductInfo(productDtl.getRelatedProductInfo());
		
		mapDetails.put(key, productDtl);
		return mapDetails;

	}

	// TODO Auto-generated method stub

	public HashMap<String, Product> addProductInfo(Product productDetails,
			HashMap<String, Product> map) {
		// TODO Auto-generated method stub
		if (map != null && !map.isEmpty()) {
			map.put(productDetails.getProductId(), productDetails);
			return map;
		} else {
			HashMap<String, Product> mapDetails = new HashMap<String, Product>();
			mapDetails.put(productDetails.getProductId(), productDetails);
			return mapDetails;
		}

	}
}
