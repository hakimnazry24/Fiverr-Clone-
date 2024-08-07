import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/freelancer/freelancer_drawer.dart';
import 'package:flutter_app/freelancer/freelancer_view_services_page.dart';
import 'package:flutter_app/freelancer/freelancer_view_contracts_page.dart';
import "package:flutter_app/firebase/firebase_auth.dart";

class FreelancerHomePage extends StatefulWidget {
  const FreelancerHomePage({super.key});

  @override
  State<FreelancerHomePage> createState() => _FreelancerHomePageState();
}

class _FreelancerHomePageState extends State<FreelancerHomePage> {
  User freelancer = auth.currentUser!;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            leading: Builder(
              builder: (context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu));
              },
            ),
            automaticallyImplyLeading: false,
            title: const Text('IIUM Freelancer (Freelancer)'),
            bottom: const TabBar(tabs: [
              Tab(text: 'Your services'),
              Tab(text: 'Your contracts'),
            ]),
          ),
          drawer: FreelancerDrawer(),
          body: TabBarView(
            children: [
              //TAB 1
              FreelancerViewServicesPage(
                freelancer: freelancer,
              ),
              //TAB 2
              FreelancerViewContractsPage(
                freelancer: freelancer,
              ),
            ],
          )),
    );
  }
}
