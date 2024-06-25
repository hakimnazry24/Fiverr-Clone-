import 'package:flutter/material.dart';
import 'package:flutter_app/contractview.dart';
import 'package:flutter_app/contractform.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Fiverr'),
            bottom: const TabBar(tabs: [
              Tab(text: 'CREATE'),
              Tab(text: 'VIEW'),
            ]),
          ),
          body: const TabBarView(
            children: [
              //TAB 1
              ContractForm(),
              //TAB 2
              ContractView(contracts: [])
            ],
          )),
    );
  }
}