import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';
import 'package:flutter_app/client/client_service_card.dart';

class ClientViewServicesPage extends StatefulWidget {
  const ClientViewServicesPage({Key? key}) : super(key: key);

  @override
  _ClientViewServicesPageState createState() => _ClientViewServicesPageState();
}

class _ClientViewServicesPageState extends State<ClientViewServicesPage> {
  var services = [];
  Future<void> getData() async {
    await db.collection("Gig").get().then((event) {
      setState(() {
        services = event.docs;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: services.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ClientServiceCard(data: services[index]);
        },
      ),
    );
  }
}
