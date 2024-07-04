import 'package:dio/dio.dart';
import 'package:news_app/Models/Article_card_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<ArticleCardModel>> getnews(
      {required String categoryserach}) async {
    final response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=847532ba32ea48c587fd5395fe2e9bfe&category=$categoryserach');

    Map<String, dynamic> JsonData = response.data;
    List<dynamic> articles = JsonData['articles'];
    List<ArticleCardModel> articlelist = [];

    for (var article in articles) {
      ArticleCardModel articleModel = ArticleCardModel(
          title: article['title'],
          description: article['description'],
          image: article['urlToImage']);
      articlelist.add(articleModel);
    }

    return articlelist;
  }
}



    //  ArticleModel articleModel = ArticleModel(
    //         title: article['title'],
    //         description: article['description'],
    //         image: article['urlToImage']);
    //     articlelist.add(articleModel);
