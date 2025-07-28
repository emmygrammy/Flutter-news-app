class CategoryModel{
  String? categoryName;

  CategoryModel({this.categoryName});
}

class NewsModel{
  String? title;
  String? description;
  String? author;
  String? content;
  String? urlToImage;

  NewsModel({
    this.title, 
    this.description, 
    this.author, 
    this.content, 
    this.urlToImage});
}