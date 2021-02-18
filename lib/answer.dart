import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        child: RaisedButton(
        color:Colors.blue,
      child: Text(
        'Option 1',
        style: TextStyle(fontSize: 15, color: Colors.white),

      ),
      onPressed: ()=>print('pressed'),
    ));
  }
}
