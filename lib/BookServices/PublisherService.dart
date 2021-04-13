import 'package:http/http.dart' as http;
import 'package:library_management/model/publisher.dart';
import 'dart:convert';

class PublisherService{

  var api=http.Client();
  Uri urlGetAll = new Uri.http("192.168.1.37:8080", "/bookApi/publisher/getAll");
  Uri urlSavePublisher = new Uri.http("192.168.1.37:8080", "/bookApi/publisher/save");
  Uri urlDeletePublisher = new Uri.http("192.168.1.37:8080", "/bookApi/publisher/delete");
  Uri urlUpdatePublisher = new Uri.http("192.168.1.37:8080", "/bookApi/publisher/update");
  var response;

  Future<List<Publisher>> getPublishers() async{
    try{
      response = await api.get(urlGetAll, headers: {'Content-type': 'application/json', 'Accept': '*/*'});
      if(response.statusCode == 200){
        return (json.decode(response.body) as List).map((e) => Publisher.fromJson(e)).toList();
      }else{
        return null;
      }
    }catch(e){
      print(e.toString);
      return null;
    }
  }
  Future<bool> savePublisher(Publisher publisher) async{
    try{
      response = await api.post(
          urlSavePublisher,
          headers: {'Content-type': 'application/json', 'Accept': '*/*'},
          body: publisherToJson(publisher)
      );
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e.toString);
      return null;
    }
  }

  Future<bool> deletePublisher(String id) async{
    try{
      response = await api.post(
          urlDeletePublisher,
          headers: {'Content-type': 'application/json', 'Accept': '*/*'},
          body: id
      );
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e.toString);
      return null;
    }
  }

  Future<bool> updatePublisher(String id,Publisher publisher) async{
    try{
      response = await api.post(
        urlUpdatePublisher,
        headers: {'Content-type': 'application/json', 'Accept': '*/*'},
        body: publisher.toJson(),
      );
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print(e.toString);
      return null;
    }
  }
}
