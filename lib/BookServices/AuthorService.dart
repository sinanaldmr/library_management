import 'package:http/http.dart' as http;
import 'package:library_management/model/author.dart';
import 'dart:convert';

class AuthorService{

  var api=http.Client();
  Uri urlGetAll = new Uri.http("192.168.1.37:8080", "/bookApi/author/getAll");
  Uri urlSaveAuthor = new Uri.http("192.168.1.37:8080", "/bookApi/author/save");
  Uri urlDeleteAuthor = new Uri.http("192.168.1.37:8080", "/bookApi/author/delete");
  Uri urlUpdateAuthor = new Uri.http("192.168.1.37:8080", "/bookApi/author/update");
  var response;

  Future<List<Author>> getAuthors() async{
    try{
      response = await api.get(urlGetAll, headers: {'Content-type': 'application/json', 'Accept': '*/*'});
      if(response.statusCode == 200){
        return (json.decode(response.body) as List).map((e) => Author.fromJson(e)).toList();
      }else{
        return null;
    }
    }catch(e){
      print(e.toString);
      return null;
    }
  }

  Future<bool> saveAuthor(Author author) async{
    try{
      response = await api.post(
          urlSaveAuthor,
          headers: {'Content-type': 'application/json', 'Accept': '*/*'},
          body: authorToJson(author)
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

  Future<bool> deleteAuthor(String id) async{
    try{
      response = await api.post(
          urlDeleteAuthor,
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

  Future<bool> updateAuthor(String id,Author author) async{
    try{
      response = await api.post(
        urlUpdateAuthor,
        headers: {'Content-type': 'application/json', 'Accept': '*/*'},
        body: author.toJson(),
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
