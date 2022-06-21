// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) =>
    json.encode(data.toJson(data.productId.toString()));

class ProductModel {
  ProductModel(
      {this.UserId,
      this.productId,
      this.categoryId,
      this.productName,
      this.productImage,
      this.productPrice,
      this.productquantity,
      this.productDesc,
      this.ShopID});

  String? UserId;
  String? productId;
  String? categoryId;
  String? productName;
  String? productImage;
  num? productPrice;
  String? productquantity;
  String? productDesc;
  String? ShopID;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        UserId: json["UserId"],
        productId: json["productID"],
        categoryId: json["categoryID"],
        productName: json["productName"],
        productImage: json["productImage"],
        productPrice: json["productPrice"],
        productquantity: json["productquantity"],
        productDesc: json["productDesc"],
        ShopID: json["ShopID"],
      );

  Map<String, dynamic> toJson(String docID) => {
        "UserId": UserId,
        "productID": docID,
        "categoryID": categoryId,
        "productName": productName,
        "productImage": productImage,
        "productPrice": productPrice,
        "productquantity": productquantity,
        "productDesc": productDesc,
        "ShopID": ShopID,
      };
}
