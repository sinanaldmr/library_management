import 'package:flutter/material.dart';
import 'package:library_management/BookServices/PublisherService.dart';
import 'package:library_management/model/publisher.dart';

import 'list_page.dart';

class AddPublisher extends StatefulWidget {
  @override
  _AddPublisherState createState() => _AddPublisherState();
}

class _AddPublisherState extends State<AddPublisher> {
  final formkey = GlobalKey<FormState>();
  Publisher sPublisher=new Publisher();

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

            // Publisher Text Section
            Container(
              margin: EdgeInsets.only(top: 20.0, left: 30.0),
              child: Text(
                "Add Publisher",
                style: TextStyle(fontSize: 30.0),
              ),
            ),

            // Publisher Edit text
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
                        decoration: InputDecoration(
                            labelText: "Publisher Name",
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
                        onSaved: (input) => sPublisher.publisherName=input,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Publisher Description",
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
                        onSaved: (input) => sPublisher.publisherDescription=input,
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
                              PublisherService().savePublisher(sPublisher);
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
