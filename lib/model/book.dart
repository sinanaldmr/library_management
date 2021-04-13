import 'dart:convert';
import 'package:library_management/model/author.dart';
import 'package:library_management/model/publisher.dart';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));
String bookToJson(Book data) => json.encode(data.toJson());

class Book {

  int bookId;
  String isbn;
  String bookName;
  String bookSubName;
  String bookSeriesName;
  Author author;
  Publisher publisher;
  String bookDescription;

	Book();

	Book.withParam(this.bookId, this.isbn, this.bookName, this.bookSubName,
      this.bookSeriesName, this.author, this.publisher, this.bookDescription);

  Book.fromJson(Map<String, dynamic> map):
		bookId = map["bookId"],
		isbn = map["isbn"],
		bookName = map["bookName"],
		bookSubName = map["bookSubName"],
		bookSeriesName = map["bookSeriesName"],
		author = Author.fromJson(map["author"]),
		publisher = Publisher.fromJson(map["publisher"]),
		bookDescription = map["bookDescription"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['bookId'] = bookId;
		data['isbn'] = isbn;
		data['bookName'] = bookName;
		data['bookSubName'] = bookSubName;
		data['bookSeriesName'] = bookSeriesName;
		data['author'] = author == null ? null : author.toJson();
		data['publisher'] = publisher == null ? null : publisher.toJson();
		data['bookDescription'] = bookDescription;
		return data;
	}

}
