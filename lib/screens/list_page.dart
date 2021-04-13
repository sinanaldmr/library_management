import 'package:flutter/material.dart';
import 'package:library_management/BookServices/BookService.dart';
import 'package:library_management/components/PopupMenu.dart';
import 'package:library_management/model/book.dart';
import 'package:library_management/screens/search_page.dart';
import 'item_detail_page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future<List<Book>> books;
  List<Book> sendBooks;
  bool isSearching = false;
  String searchString = "";

  @override
  void initState() {
    BookService().getAllWithoutFuture().then((data) {
      sendBooks = data;
    });
    super.initState();
    books = BookService().getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 5.0,
        title: !isSearching
            ? Text("Library Management", style: TextStyle(color: Colors.black))
            : TextField(
                onChanged: (value) {
                  searchString = value;
                },
                onSubmitted: (books) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                books: sendBooks,
                                searchString: searchString,
                              )));
                },
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.black)),
              ),
        leading: Icon(
          Icons.book_outlined,
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel_outlined),
                  onPressed: () {
                    setState(() {
                      this.isSearching = !isSearching;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = !isSearching;
                    });
                  }),
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: PopupMenu(),
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: FutureBuilder(
          future: books,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 130,
                      child: Wrap(
                        children: <Widget>[
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetailsScreen(
                                            book: snapshot.data[index])));
                              },
                              child:
                                  Image(image: AssetImage("images/book1.jpg"))),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ItemDetailsScreen(
                                          book: snapshot.data[index])));
                            },
                            title: Text(
                              snapshot.data[index].bookName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              snapshot.data[index].bookSubName,
                              style: TextStyle(fontSize: 12.0),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: snapshot.data.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
