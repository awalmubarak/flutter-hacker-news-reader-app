import 'package:hacker_news/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:hacker_news/src/models/item_model.dart';

void main() {
  test("that fetchTopIds return a list of IDs", () async{
    final newsApi = new NewsApiProvider();
    newsApi.client = MockClient((request) async{
      return Response(jsonEncode([1,2,3,4,5]), 200);
    });

    final ids = await newsApi.fetchTopIds();
    expect(ids, [1,2,3,4,5]);
  });

  test("that fetchItem returns an itemModel", () async{
    final newsApi = new NewsApiProvider();
    newsApi.client = MockClient((request) async{
      final itemMap = {'id':34, 'title':'max billi'};
      return Response(jsonEncode(itemMap), 200);
    });

    final ItemModel itemModel = await newsApi.fetchItem(1);
    expect(itemModel.id, 34);
    expect(itemModel.title, 'max pbilli');

  });
}