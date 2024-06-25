import 'package:flutter/material.dart';

class MyContract extends StatefulWidget {
  final String child;

  MyContract({required this.child});

  @override
  _MyContractState createState() => _MyContractState();
}

class _MyContractState extends State<MyContract> {
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
        child: Center(
          child: Text(widget.child),
        ),
      ),
    );
  }
}
