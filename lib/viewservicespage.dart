import 'package:flutter/material.dart';
import 'package:flutter_app/service_card.dart';
import 'package:intl/intl.dart';
import 'contract.dart';
import 'viewcontractspage.dart';
import "package:flutter_app/firebase/firebase_firestore.dart";

class ViewServicesPage extends StatefulWidget {
  const ViewServicesPage({Key? key}) : super(key: key);

  @override
  _ViewServicesPageState createState() => _ViewServicesPageState();
}

class _ViewServicesPageState extends State<ViewServicesPage> {
  var services = [];
  Future<dynamic> getData() async {
    var data = await db.collection("Gig").get().then((event) {
      setState(() {
        services = event.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    () async {
      getData();
    }();

    return Scaffold(
      // body: Text(services[0].data().toString()),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: services.length,
          itemBuilder: (BuildContext context, index) {
            return ServiceCard(data: services[index],);
          }),
    );
  }
}
