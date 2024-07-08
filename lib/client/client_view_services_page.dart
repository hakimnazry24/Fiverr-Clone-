import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';
import 'package:flutter_app/client/client_service_card.dart';

class ClientViewServicesPage extends StatefulWidget {
  const ClientViewServicesPage({super.key});

  @override
  _ClientViewServicesPageState createState() => _ClientViewServicesPageState();
}

class _ClientViewServicesPageState extends State<ClientViewServicesPage> {
  var services = [];
  bool isLoading = true;
  bool isServicesEmpty = false;

  Future<void> getData() async {
    await db.collection("Gig").get().then((event) {
      setState(() {
        services = event.docs;
        if (services.isEmpty) isServicesEmpty = true;
        isLoading = false;
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
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : isServicesEmpty
            ? Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: const Center(
                  child: Text("No Service yet"),
                ),
              )
            : Scaffold(
                backgroundColor: Theme.of(context).colorScheme.primary,
                body: RefreshIndicator(
                  onRefresh: () async {
                    await getData();
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: services.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return ClientServiceCard(data: services[index]);
                    },
                  ),
                ),
              );
  }
}
