import 'package:flutter/material.dart';
import 'package:library_management/BookServices/AuthorService.dart';
import 'package:library_management/BookServices/PublisherService.dart';
import 'package:library_management/model/author.dart';
import 'package:library_management/model/publisher.dart';
import 'package:library_management/screens/add_author_page.dart';
import 'package:library_management/screens/add_book_page.dart';
import 'package:library_management/screens/add_publisher_page.dart';


class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text(
            "Add Book",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        PopupMenuItem(
          value: 2,
          child: Text(
            "Add Author",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        PopupMenuItem(
          value: 3,
          child: Text(
            "Add Publisher",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
      ],
      onSelected: (result)async{
        if (result==1){
          List<Author> author=await AuthorService().getAuthors();
          List<Publisher> publisher=await PublisherService().getPublishers();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddBook(author,publisher)),
          );
        }else if (result==2){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> AddAuthor()),
          );
        }else if(result==3){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> AddPublisher()),
          );
        }
      },
    );
  }
}