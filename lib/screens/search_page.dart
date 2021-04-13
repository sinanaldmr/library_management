import 'package:flutter/material.dart';
import 'package:library_management/model/book.dart';
import 'item_detail_page.dart';

// ignore: must_be_immutable
class SearchPage extends StatefulWidget {
  List<Book> books=[];
  String searchString;
  SearchPage({this.books,this.searchString});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Book> filteredBook=[];


  @override
  void initState() {
    filteredBook=widget.books;
    super.initState();
  }

  void filteredBooks(value){
    setState(() {
      var nonIdBookList=new List<Book>();
      for(Book book in widget.books){
        book.bookId = null;
        book.author.authorId = null;
        book.publisher.publisherId = null;
        nonIdBookList.add(book);
      }
      filteredBook= nonIdBookList.where((book) => book.toJson().toString().contains(widget.searchString)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    filteredBooks(widget.searchString);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 5.0,
        title: Text("Results",style: TextStyle(color: Colors.black)),
        leading: Icon(
          Icons.book_outlined,
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: filteredBook.length>0 ? GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: 130,
                child: Wrap(
                  children: <Widget>[
                    Image(image: AssetImage("images/book1.jpg")),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ItemDetailsScreen(
                                    book: filteredBook[index])));
                      },
                      title: Text(
                        filteredBook[index].bookName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        filteredBook[index].bookSubName,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: filteredBook.length,
        ):Center(child: Text("Book not found."),),
      ),
    );
  }
}
