import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:library_management/model/book.dart';

class BookService{

  var api=http.Client();
  Uri urlGetAll = new Uri.http("192.168.1.37:8080", "/bookApi/book/getAll");
  Uri urlSaveBook = new Uri.http("192.168.1.37:8080", "/bookApi/book/save");
  Uri urlDeleteBook = new Uri.http("192.168.1.37:8080", "/bookApi/book/delete");
  Uri urlUpdateBook = new Uri.http("192.168.1.37:8080", "/bookApi/book/update");


  //var url="http://localhost:8080/bookApi/author/";
  var response;

  Future<List<Book>> getAll() async {
    var response = await http.get(urlGetAll, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => Book.fromJson(e))
          .toList();
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  }

  getAllWithoutFuture() async {
    var response = await http.get(urlGetAll, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => Book.fromJson(e))
          .toList();
    } else {
      throw Exception("Error ${response.statusCode}");
    }
  }


  Future<bool> saveBook(Book book) async{
    try{
      response = await api.post(
          urlSaveBook,
          headers: {'Content-type': 'application/json', 'Accept': '*/*'},
          body: bookToJson(book)
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

  Future<bool> deleteBook(String id) async{
    try{
      response = await api.post(
          urlDeleteBook,
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

  Future<bool> updateBook(Book book) async{
    try{
      response = await api.post(
          urlUpdateBook,
          headers: {'Content-type': 'application/json', 'Accept': '*/*'},
          body: bookToJson(book),
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
