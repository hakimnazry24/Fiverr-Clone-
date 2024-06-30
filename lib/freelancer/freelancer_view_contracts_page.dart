import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/freelancer/freelancer_contract_card.dart';
import "package:flutter_app/firebase/firebase_firestore.dart";

class FreelancerViewContractsPage extends StatefulWidget {
  final User freelancer;

  const FreelancerViewContractsPage({super.key, required this.freelancer});

  @override
  State<FreelancerViewContractsPage> createState() =>
      _FreelancerViewContractsPageState();
}

class _FreelancerViewContractsPageState
    extends State<FreelancerViewContractsPage> {
  var contracts = [];

  Future<void> getData() async {
    await db
        .collection("Contract")
        .where("freelancerId", isEqualTo: widget.freelancer.uid)
        .get()
        .then((event) {
      setState(() {
        contracts = event.docs;
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
      body: RefreshIndicator(
        onRefresh: () async {
          await getData();
        },
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: contracts.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return ContractCard(data: contracts[index]);
          },
        ),
      ),
    );
  }
}
