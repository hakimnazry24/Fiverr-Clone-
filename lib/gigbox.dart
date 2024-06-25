import 'package:flutter/material.dart';

class MyGig extends StatefulWidget {
  final String child;

  MyGig({required this.child});

  @override
  _MyGigState createState() => _MyGigState();
}

class _MyGigState extends State<MyGig> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("BMI Status", textAlign: TextAlign.center),
          content: const TextField(
            decoration: InputDecoration(
              hintText: "PutcContract ID",
              labelText: "Contract ID",
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Container(
        height: 200,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Text(widget.child),
            ElevatedButton(
              onPressed: () {
                _showDialog();
              },
              child: const Text('Offer'),
            ),
          ],
        ),
      ),
    );
  }
}
