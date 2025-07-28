import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api/model/new_model.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({super.key, required this.newsModel});
  final NewsModel newsModel;

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text(
            widget.newsModel.title!,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox()
              ),
              Expanded(
                child: Text(
                  "${widget.newsModel.author}",
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                ),
                ), 
            ]
          ),
           SizedBox(height: 10),
           ClipRRect(
             borderRadius: BorderRadius.circular(10),
             child: CachedNetworkImage(
              imageUrl: widget.newsModel.urlToImage ?? '',
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
                       ),
           ),
           SizedBox(height: 10),
           Text(
            "${widget.newsModel.content}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 15),
          Text(
            "${widget.newsModel.description}",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          ]
        
        ),
      ),
    );
  }
}