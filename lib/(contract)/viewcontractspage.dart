import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/(contract)/contract_card.dart';
import "package:flutter_app/firebase/firebase_firestore.dart";

class ViewContractsPage extends StatefulWidget {
  const ViewContractsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewContractsPage> createState() => _ViewContractsPageState();
}

class _ViewContractsPageState extends State<ViewContractsPage> {
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
    // () async {
    //   getData();
    // }();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemCount: contracts.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ContractCard(data: contracts[index]);
        },
      ),
    );
  }
}
