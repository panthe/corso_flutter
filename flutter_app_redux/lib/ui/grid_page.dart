import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_redux/models/form_model_example.dart';

class GridPage extends StatefulWidget {

  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
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
  List<FormModelExample> _listBig = [];

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

    _listBig = List.generate(200,
          (index) => FormModelExample(email: "abc@abc.it", name: "Abc"));
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
      child: GridView.builder(
          itemCount: _listBig.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          controller: _scrollController,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2
          ),
          itemBuilder: (BuildContext context, int index) {
            return createCard(index);
          }
      )
    );
  }

  Widget createCard(int index) {
    return GestureDetector(
      onTap: () {
        print(_listBig[index].name);
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
            width: 200.0,
            child: Row(
              children: [
                Text(_listBig[index].name),
                Text(_listBig[index].email)
              ],
            )
        ),
      ),
    );
  }
}
