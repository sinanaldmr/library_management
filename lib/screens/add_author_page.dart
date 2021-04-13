import 'package:flutter/material.dart';
import 'package:library_management/BookServices/AuthorService.dart';
import 'package:library_management/model/author.dart';

import 'list_page.dart';

class AddAuthor extends StatefulWidget {
  @override
  _AddAuthorState createState() => _AddAuthorState();
}

class _AddAuthorState extends State<AddAuthor> {
  final formkey = GlobalKey<FormState>();
  Author sAuthor=new Author();

  @override
  Widget build(BuildContext context) {
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

            // Author Text Section
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 30.0),
              child: Text(
                "Add Author",
                style: TextStyle(fontSize: 30.0),
              ),
            ),

            // Author Edit text
            Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: formkey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin:
                      EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Author Name",
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
                        onSaved: (input) => sAuthor.authorName=input,
                      ),
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Author Description",
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
                        onSaved: (input) => sAuthor.authorDescription=input,
                      ),
                    ),

                    // Save Button
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50.0),
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () {
                            if(formkey.currentState.validate()){
                              formkey.currentState.save();
                              AuthorService().saveAuthor(sAuthor);
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                  ListPage()), (Route<dynamic> route) => false);
                            }
                          },
                          // When Click on Button goto List Screen
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