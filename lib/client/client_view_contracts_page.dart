import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/client/client_contract_card.dart';
import 'package:flutter_app/freelancer/freelancer_contract_card.dart';
import "package:flutter_app/firebase/firebase_firestore.dart";

class ClientViewContractsPage extends StatefulWidget {
  const ClientViewContractsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ClientViewContractsPage> createState() => _ClientViewContractsPageState();
}

class _ClientViewContractsPageState extends State<ClientViewContractsPage> {
  var contracts = [];
  Future<void> getData() async {
    await db.collection("Contract").get().then((event) {
      setState(() {
        contracts = event.docs;
      });
    });
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contract ID copied to clipboard')),
    );
  }

  initState() {
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
        itemCount: contracts.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ClientContractCard(data: contracts[index]);
        },
      ),
    );
  }
}
