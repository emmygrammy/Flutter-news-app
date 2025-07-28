import 'package:flutter/material.dart';
import 'package:news_api/model/new_model.dart';
import 'package:news_api/services/services.dart';
import 'package:news_api/views/news_detail.dart';

class SelectedCategoryNews extends StatefulWidget {
  const SelectedCategoryNews({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<SelectedCategoryNews> createState() => _SelectedCategoryNewsState();
}

class _SelectedCategoryNewsState extends State<SelectedCategoryNews> {
  List<NewsModel> articles = [];
  bool isLoading = true;

  getNews() async {
    CategoryNews categoryNews = CategoryNews();
    await categoryNews.getNews(widget.categoryName);
    articles = categoryNews.dataStore;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
        title: Text(
          widget.categoryName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () {
                     Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetail(
                                newsModel: article,
                              ),
                            ),
                          );
                    // Handle article tap
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (article.urlToImage != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              article.urlToImage!,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                        SizedBox(height: 10),
                        Text(
                          article.title ?? 'No Title',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(thickness: 2),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
