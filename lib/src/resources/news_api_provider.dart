import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

final String _baseDomain = "https://hacker-news.firebaseio.com/v0";

class NewsApiProvider{
  Client client = Client();

  fetchTopIds() async{
    final response = await client.get("$_baseDomain/topstories.json");
    final ids = json.decode(response.body);
    return ids;
  }

  fetchItem(int id) async{
    final response = await client.get("$_baseDomain/item/$id.json");
    final parsedJson = json.decode(response.body);
    final ItemModel item = ItemModel.fromJson(parsedJson);
    return item;
  }
}