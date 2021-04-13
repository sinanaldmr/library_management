import 'package:flutter/material.dart';
import 'package:library_management/BookServices/BookService.dart';
import 'package:library_management/model/author.dart';
import 'package:library_management/model/book.dart';
import 'package:library_management/model/publisher.dart';
import 'package:library_management/screens/list_page.dart';

// ignore: must_be_immutable
class EditBook extends StatefulWidget {
  List<Author> author;
  List<Publisher> publisher;
  Book comingBook;

  EditBook(this.comingBook,this.author,this.publisher);

  @override
  _State createState() => _State();
}

class _State extends State<EditBook> {
  final formkey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _returnAuthValue(Author author, List<Author> authorList){
      Author a= new Author();
      for(Author auth in authorList){
        if(author.authorId == auth.authorId ){
          a = auth;
        }
      }
      return a;
    }
    _returnPublishValue(Publisher publisher, List<Publisher> publisherList){
      Publisher p= new Publisher();
      for(Publisher publish in publisherList){
        if(publisher.publisherId == publish.publisherId ){
          p = publish;
        }
      }
      return p;
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Back Button Section
            Container(
                margin: EdgeInsets.only(left: 30.0, top: 50.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.keyboard_backspace,
                    color: Color(0xffc5ccd6),
                    size: 30.0,
                  ),
                )),

            // Book Text Section
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 30.0),
              child: Text(
                "Edit Book",
                style: TextStyle(fontSize: 30.0),
              ),
            ),

            // Book Edit text
            Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                autovalidateMode: AutovalidateMode.always, key: formkey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        initialValue: widget.comingBook.isbn,
                        decoration: InputDecoration(
                            labelText: "ISBN", border: OutlineInputBorder()),
                        minLines: 1,
                        keyboardType: TextInputType.number,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Bu alan boş geçilemez';
                          }
                          return null;
                        },
                        onSaved: (input) => widget.comingBook.isbn=input,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        initialValue: widget.comingBook.bookName,
                        decoration: InputDecoration(
                            labelText: "Book Name",
                            border: OutlineInputBorder()),
                        minLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Bu alan boş geçilemez';
                          }
                          return null;
                        },
                        onSaved: (input) => widget.comingBook.bookName = input,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        initialValue: widget.comingBook.bookSubName,
                        decoration: InputDecoration(
                            labelText: "Book Sub Name",
                            border: OutlineInputBorder()),
                        minLines: 1,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Bu alan boş geçilemez';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        onSaved: (input) => widget.comingBook.bookSubName = input,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        initialValue: widget.comingBook.bookSeriesName,
                        decoration: InputDecoration(
                            labelText: "Book Series Name",
                            border: OutlineInputBorder()),
                        minLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Bu alan boş geçilemez';
                          }
                          return null;
                        },
                        onSaved: (input) => widget.comingBook.bookSeriesName = input,
                      ),
                    ),
                    Container(
                        margin:
                        EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                        child: DropdownButton(
                          value: _returnAuthValue(widget.comingBook.author,widget.author),
                          hint: Text("Select Author"),
                          items: widget.author.map((Author map) {
                            return new DropdownMenuItem<Author>(
                              value: map,
                              child: Text(map.authorName),
                            );
                          }).toList(),
                          onChanged: (selected){
                            widget.comingBook.author=selected;
                          },
                        )
                    ),
                    Container(
                        margin:
                        EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                        child: DropdownButton(
                          value: _returnPublishValue(widget.comingBook.publisher,widget.publisher),
                          hint: Text("Select Publisher"),
                          items: widget.publisher.map((Publisher map) {
                            return new DropdownMenuItem<Publisher>(
                              value: map,
                              child: Text(map.publisherName),
                            );
                          }).toList(),
                          onChanged: (selected){
                            widget.comingBook.publisher=selected;
                          },
                        )
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        initialValue: widget.comingBook.bookDescription,
                        decoration: InputDecoration(
                            labelText: "Book Description",
                            border: OutlineInputBorder()),
                        minLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Bu alan boş geçilemez';
                          }
                          return null;
                        },
                        onSaved: (input) => widget.comingBook.bookDescription = input,
                      ),
                    ),



                    // Save Button
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50.0 ),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                            if(formkey.currentState.validate()){
                              formkey.currentState.save();
                              BookService().updateBook(widget.comingBook);
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  ListPage()), (Route<dynamic> route) => false);
                            }
                          }, // When Click on Button goto List Screen
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0),
                          ),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      new Color(0xff374ABE),
                                      new Color(0xff64B6FF)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: Container(
                              constraints: const BoxConstraints(
                                  maxWidth: 300.0, minHeight: 40.0),
                              // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'Save',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 50.0)
          ],
        ),
      ),
    );
  }
}



