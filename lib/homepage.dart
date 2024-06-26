import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_app/contractview.dart';
import 'package:flutter_app/contractform.dart';
=======
import 'package:flutter_app/(gig)/viewservicespage.dart';
import 'package:flutter_app/(contract)/viewcontractspage.dart';
>>>>>>> 01c4f8fbe706bd879f8a07f7f9f4c95fd4a6e2bb


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
              Tab(text: 'Available services'),
              Tab(text: 'Contracts'),
            ]),
          ),
          body: TabBarView(
            children: [
              //TAB 1
              ViewServicesPage(),
              //TAB 2
              ViewContractsPage(
                // contracts: []
                ),
            ],
          )),
    );
  }
}