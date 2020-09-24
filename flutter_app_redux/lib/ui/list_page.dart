import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/models/form_model_example.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController;
  List<FormModelExample> _list = [
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
    FormModelExample(email: "abc@abc.it", name: "Abc"),
  ];


  _listenerScroll() {
    if (_scrollController.offset >= _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("Reach Limit");
    }
    if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      print("Reach Start");
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(_listenerScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: _list.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int index) {
            return createCard(index);
          }
      )
    );
  }

  Widget createCard(int index) {
    return GestureDetector(
      onTap: () {
        print(_list[index].name);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Colors.amber,
                width: 2.0
            )
        ),
        color: Colors.white,
        child: Container(
            height: 50.0,
            child: Row(
              children: [
                Text(_list[index].name),
                Text(_list[index].email)
              ],
            )
        ),
      ),
    );
  }
}
