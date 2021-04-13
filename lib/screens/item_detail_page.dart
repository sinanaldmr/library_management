import 'package:flutter/material.dart';
import 'package:library_management/BookServices/AuthorService.dart';
import 'package:library_management/BookServices/BookService.dart';
import 'package:library_management/BookServices/PublisherService.dart';
import 'package:library_management/model/author.dart';
import 'package:library_management/model/book.dart';
import 'package:library_management/model/publisher.dart';
import 'package:library_management/screens/edit_book_page.dart';

import 'list_page.dart';

// ignore: must_be_immutable
class ItemDetailsScreen extends StatelessWidget {

  Book book;
  ItemDetailsScreen({this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Item Details",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 5.0,
      ),
      body: Container(
        child: ListView(children: <Widget>[
          Card(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            elevation: 5.0,
            child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: Image(
                    image: itemImage(),
                    fit: BoxFit.cover,
                  ),
                )),
          ), // Image Card Widget

          Container(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(
              book.bookName,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ), // Book Name Container Widgets

          Container(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(
              book.author.authorName,
              style: TextStyle(
                  color: Color(0xff7990DD),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ), // Author Name Container Widgets
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(
              book.publisher.publisherName,
              style: TextStyle(
                  color: Color(0xff7990DD),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ), // Publisher Name Container Widget

          Container(
            padding: EdgeInsets.only(left: 25.0, top: 20.0),
            child: Text(
              "Description",
              style: TextStyle(fontSize: 17.0),
            ),
          ), // Description Container

          Container(
            padding: EdgeInsets.only(left: 25.0, top: 10.0),
            child: Text(
              book.bookDescription,
              style: TextStyle(fontSize: 15.0),
            ),
          ), // Description
          SizedBox(
            height: 30.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: MaterialButton(
                    onPressed: () {
                      _toEditPage(context);
                    },
                    color: Color(0xffEEEEEE),
                    child: Text(
                      "EDIT",
                      style: TextStyle(color: Colors.black),
                    ),
                    height: 45.0,
                    minWidth: 150.0,
                  ),
                ),
                Align(
                  alignment: FractionalOffset.bottomRight,
                  child: MaterialButton(
                    onPressed: () {
                      //DELETE
                      BookService().deleteBook(book.bookId.toString());
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                          ListPage()), (Route<dynamic> route) => false);
                    },
                    color: Colors.red.shade700,
                    child: Text(
                      "DELETE",
                      style: TextStyle(color: Colors.white),
                    ),
                    height: 45.0,
                    minWidth: 150.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ]),
      ),
    );
  }

  ImageProvider itemImage() {
    AssetImage image = AssetImage("images/book1.jpg");
    return image;
  }

  _toEditPage(BuildContext context) async{
    List<Author> author=await AuthorService().getAuthors();
    List<Publisher> publisher=await PublisherService().getPublishers();
    // EDIT PAGE
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditBook(book,author,publisher)));
  }
}
