import 'dart:convert';

class ApiService{

  final endPoint = "https://newsapi.org/v2/everything?q=tesla&from=2022-07-26&sortBy=publishedAt&apiKey=faefa93a6d4841a7b14e27950f21237d";
  Future<List<Article>> getArticle() async{
      Response response = await (Uri.parse(endPoint));
      if(response.statusCode == 200){

        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['articles'];
        List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
        return articles;

      } else {
        throw 'Data not fount';
      }
  }
}