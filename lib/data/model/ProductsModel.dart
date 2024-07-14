import 'package:flutter/cupertino.dart';

class ProductsModel{
  int? id ;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? category;
  double? price;
  dynamic? discountPercentage;
  double? rating;
  String? brand;
  List<String>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  List<String>? images;
  String? thumbnail;

  ProductsModel({
    this.id,
    this.date,
    this.title,
    this.brand,
    this.category,
    this.comment,
    this.createdAt,
    this.description,
    this.discountPercentage,
    this.images,
    this.minimumOrderQuantity,
    this.price,
    this.rating,
    this.returnPolicy,
    this.reviewerEmail,
    this.reviewerName,
    this.reviews,
    this.thumbnail,
    this.updatedAt
      });
  factory ProductsModel.fromjson(Map<String , dynamic> json){
    return  ProductsModel(
        id :  json["id"],
        title:  json["title"],
        brand: json["description"],
        category: json["category"],
        comment: json["comment"],
        createdAt: json["createdAt"],
        date: json["date"],
        description: json["description"] ,
        images: [],
        minimumOrderQuantity: json["minimumOrderQuantity"],
        price: json["price"],
        discountPercentage: json["price"] * (1-(json["discountPercentage"]~/100)) ,
        rating: json["rating"],
        returnPolicy: json["returnPolicy"],
        reviewerEmail: json["reviewerEmail"],
        reviewerName: json["reviewerName"],
        thumbnail: json["thumbnail"],
        updatedAt: json["updatedAt"]);
  }


  }







