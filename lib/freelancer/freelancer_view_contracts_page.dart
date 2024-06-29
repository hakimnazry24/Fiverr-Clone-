import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/freelancer/freelancer_contract_card.dart';
import "package:flutter_app/firebase/firebase_firestore.dart";

class FreelancerViewContractsPage extends StatefulWidget {
  const FreelancerViewContractsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FreelancerViewContractsPage> createState() => _FreelancerViewContractsPageState();
}

class _FreelancerViewContractsPageState extends State<FreelancerViewContractsPage> {
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
        itemCount: contracts.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ContractCard(data: contracts[index]);
        },
      ),
    );
  }
}
