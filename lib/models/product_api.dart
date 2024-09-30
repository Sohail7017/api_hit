class MetaModel{
  String? barcode;
  String? createdAt;
  String?  qrCode;
  String? updatedAt;

  MetaModel({this.barcode,this.createdAt,this.qrCode,this.updatedAt});

  factory MetaModel.fromJson(Map<String, dynamic> json){
    return MetaModel(
      barcode: json['barcode'],
        createdAt: json['createdAt'],
        qrCode: json['qrCode'],
        updatedAt: json['updatedAt'],

    );
  }
}

  class ReviewsModel{
  num? rating;
  String? comment;
  String? date;
  String? reviewerEmail;
  String? reviewerName;

   ReviewsModel({this.rating,this.comment,this.date,this.reviewerEmail,this.reviewerName});

   factory ReviewsModel.fromJson(Map<String,dynamic> json){
     return ReviewsModel(
       rating: json['rating'],
       comment: json['comment'],
       date: json['date'],
       reviewerEmail: json['reviewerEmail'],
       reviewerName: json['reviewerName'],
     );
   }

  }

  class DimensionsModel{
  num? depth;
  num? height;
  num? width;

  DimensionsModel({this.depth,this.height,this.width});

  factory DimensionsModel.fromJson(Map<String,dynamic> json){
    return DimensionsModel(
      depth: json['depth'],
      height: json['height'],
      width: json['width']
    );
  }

  }

  class ProductModel{
  String? availabilityStatus;
  String? brand;
  String? category;
  String? description;
  DimensionsModel? dimensions;
  num? discountPercentage;
  int? id;
  List<dynamic>? images;
  MetaModel? meta;
  int? minimumOrderQuantity;
  num? price;
  num? rating;
  String? returnPolicy;
  List<ReviewsModel>? reviews;
  String? shippingInformation;
  String?  sku;
  int? stock;
  List<dynamic>? tags;
  String? thumbnail;
  String? title;
  String? warrantyInformation;
  num? weight;

  ProductModel({
      this.availabilityStatus,
      this.brand,
      this.category,
      this.description,
      this.dimensions,
      this.discountPercentage,
      this.id,
      this.images,
      this.meta,
      this.minimumOrderQuantity,
      this.price,
      this.rating,
      this.returnPolicy,
      this.reviews,
      this.shippingInformation,
      this.sku,
      this.stock,
      this.tags,
      this.thumbnail,
      this.title,
      this.warrantyInformation,
      this.weight});


  factory ProductModel.fromJson(Map<String,dynamic> json){



    List<ReviewsModel> mReviews = [];
    for(Map<String,dynamic> eachReview in json['reviews']){
      var reviewsModel =  ReviewsModel.fromJson(eachReview);
      mReviews.add(reviewsModel);
    }

    return ProductModel(
      availabilityStatus: json['availabilityStatus'],
      brand: json['brand'] ,
      category: json['category'],
      description: json['description'],
      dimensions: DimensionsModel.fromJson(json['dimensions']),
      discountPercentage: json['discountPercentage'],
      id: json['id'],
      images: json['images'],
      meta: MetaModel.fromJson(json['meta']),
      minimumOrderQuantity: json['minimumOrderQuantity'],
      price: json['price'],
      rating: json['rating'],
      returnPolicy: json['returnPolicy'],
      reviews: mReviews,
      shippingInformation: json['shippingInformation'],
      sku: json['sku'],
      stock: json['stock'],
      tags: json['tags'],
      thumbnail: json['thumbnail'],
      title: json['title'],
      warrantyInformation: json['warrantyInformation'],
      weight: json['weight'],
    );
  }

}

  class ProductDataModel{
  int? limit;
  List<ProductModel>? products;
  int? skip;
  int? total;

  ProductDataModel({this.total,this.products,this.skip,this.limit});


  factory ProductDataModel.fromJson(Map<String,dynamic> json){

    List<ProductModel> mProducts = [];
    for(Map<String,dynamic> eachProducts in json['products']){
      var productModel = ProductModel.fromJson(eachProducts);
      mProducts.add(productModel);
    }


    return ProductDataModel(
      limit: json['limit'],
      skip: json['skip'],
      total: json['total'],
      products: mProducts
    );
  }


  }