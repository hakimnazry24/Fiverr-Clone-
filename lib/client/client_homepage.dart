import 'package:flutter/material.dart';
import 'package:flutter_app/client/client_view_contracts_page.dart';
import 'package:flutter_app/client/client_view_services_page.dart';
import 'package:flutter_app/freelancer/freelancer_view_services_page.dart';
import 'package:flutter_app/freelancer/freelancer_view_contracts_page.dart';


class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Fiverr'),
            bottom: const TabBar(tabs: [
              Tab(text: 'Available services'),
              Tab(text: 'Contracts'),
            ]),
          ),
          body: const TabBarView(
            children: [
              //TAB 1
              ClientViewServicesPage(),
              //TAB 2
              ClientViewContractsPage(
                // contracts: []
                ),
            ],
          )),
    );
  }
}