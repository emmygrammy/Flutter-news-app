import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/model/new_model.dart';

class NewsApi{
  List<NewsModel> dataStore = [];
  Future<void>getNews() async{
    Uri url = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=0391a0fe5fbc484e8f03b0d32c0a81b8');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element) { 
       if(element['urlToImage'] != null && 
       element['description'] != null &&
       element['author'] != null &&
       element['content'] != null ){
        NewsModel newsModel = NewsModel(
          title: element['title'],
          description: element['description'],
          author: element['author'],
          content: element['content'],
          urlToImage: element['urlToImage'],
        );
        dataStore.add(newsModel);
       }
      });
      
    }
  }
}


class CategoryNews{
  List<NewsModel> dataStore = [];
  Future<void>getNews(String category) async{
    Uri url = Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=0391a0fe5fbc484e8f03b0d32c0a81b8');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element) { 
       if(element['urlToImage'] != null && 
       element['description'] != null &&
       element['author'] != null &&
       element['content'] != null ){
        NewsModel newsModel = NewsModel(
          title: element['title'],
          description: element['description'],
          author: element['author'],
          content: element['content'],
          urlToImage: element['urlToImage'],
        );
        dataStore.add(newsModel);
       }
      });
      
    }
  }
}