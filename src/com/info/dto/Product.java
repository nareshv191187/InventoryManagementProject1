package com.info.dto;

public class Product {

	private String productId;
	private String ProductName;
	private String productDescription;
	private String relatedProductInfo;
	private String productPrice;
	private String productImageLocation;

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getRelatedProductInfo() {
		return relatedProductInfo;
	}

	public void setRelatedProductInfo(String relatedProductInfo) {
		this.relatedProductInfo = relatedProductInfo;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductImageLocation() {
		return productImageLocation;
	}

	public void setProductImageLocation(String productImageLocation) {
		this.productImageLocation = productImageLocation;
	}

}
