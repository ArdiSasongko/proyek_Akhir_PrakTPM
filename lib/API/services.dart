import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mexican_food/API/model.dart';

class GetData{
  var data = [];
  List<MexicanFood> result = [];
  String getData = "https://the-mexican-food-db.p.rapidapi.com/";
  Future<List<MexicanFood>> getList({String? query}) async{
    var url = Uri.parse(getData);
    var response = await http.get(url, headers: {
      "X-RapidAPI-Key": "0afdbad5bbmshe0e460492a320fcp123473jsn6b0db3765308",
      "X-RapidAPI-Host": "the-mexican-food-db.p.rapidapi.com",
    });
    try {
      if(response.statusCode == 200){
        data = json.decode(response.body);
        result = data.map((e) => MexicanFood.fromJson(e)).toList();
        if(query != null){
          result = result.where((element) => element.title!.toLowerCase().contains(query.toLowerCase())).toList();
        }
      }else{
        print('Api Eror');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return result;
  }
}