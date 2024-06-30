import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/client/client_view_contracts_page.dart';
import 'package:flutter_app/client/client_view_services_page.dart';
import 'package:flutter_app/components/drawer.dart';
import 'package:flutter_app/firebase/firebase_auth.dart';
import 'package:flutter_app/freelancer/freelancer_view_services_page.dart';
import 'package:flutter_app/freelancer/freelancer_view_contracts_page.dart';

class ClientHomePage extends StatefulWidget {
  ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  var client = auth.currentUser;

  @override
  void initState() {
    client = auth.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu),
              );
            }),
            automaticallyImplyLeading: false,
            title: const Text('Fiverr'),
            bottom: const TabBar(tabs: [
              Tab(text: 'Available services'),
              Tab(text: 'Contracts'),
            ]),
          ),
          drawer: AppDrawer(),
          body: TabBarView(
            children: [
              //TAB 1
              const ClientViewServicesPage(),
              //TAB 2
              ClientViewContractsPage(
                client: client!,
              ),
            ],
          )),
    );
  }
}
