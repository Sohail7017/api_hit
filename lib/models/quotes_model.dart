class QuotesModel{
 int id;
 String quote;
 String author;

 QuotesModel({required this.id, required this.quote, required this.author});

 /// From Map
/// JSON

    factory QuotesModel.fromJson(Map<String, dynamic> json){
      return QuotesModel(
          id: json['id'],
          quote: json['quote'],
          author: json['author']);
    }

}

class QuotesDataModel{
  int limit;
  int skip;
  int total;
  List<QuotesModel> quotes;

  QuotesDataModel({required this.limit,required this.skip,required this.total,required this.quotes});

  factory QuotesDataModel.fromJson(Map<String,dynamic> json){

    List<QuotesModel> mQuotes = [];

    for(Map<String,dynamic> eachQuotes in json['quotes']){
      var eachQuotesModel = QuotesModel.fromJson(eachQuotes);
      mQuotes.add(eachQuotesModel);
    }
    return QuotesDataModel(
        limit: json['limit'],
        skip: json['skip'],
        total: json['total'],
        quotes: mQuotes);
  }
}
