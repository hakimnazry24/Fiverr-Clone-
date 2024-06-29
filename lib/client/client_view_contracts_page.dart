import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/client/client_contract_card.dart';
import 'package:flutter_app/freelancer/freelancer_contract_card.dart';
import "package:flutter_app/firebase/firebase_firestore.dart";

class ClientViewContractsPage extends StatefulWidget {
  User client;
  ClientViewContractsPage({super.key, required this.client});

  @override
  State<ClientViewContractsPage> createState() =>
      _ClientViewContractsPageState();
}

class _ClientViewContractsPageState extends State<ClientViewContractsPage> {
  var contracts = [];

  Future<void> getData(String clientId) async {
    await db
        .collection("Contract")
        .where("clientId", isEqualTo: clientId)
        .get()
        .then((event) {
      setState(() {
        contracts = event.docs;
      });
    });
  }

  @override
  initState() {
    super.initState();
    getData(widget.client.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: RefreshIndicator(
        onRefresh: () async {
          getData(widget.client.uid);
        },
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: contracts.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return ClientContractCard(data: contracts[index]);
          },
        ),
      ),
    );
  }
}
