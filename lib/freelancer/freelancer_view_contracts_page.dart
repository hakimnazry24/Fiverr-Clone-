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
  bool isLoading = true;
  bool isContractsEmpty = false;

  Future<void> getData() async {
    await db
        .collection("Contract")
        .where("freelancerId", isEqualTo: widget.freelancer.uid)
        .get()
        .then((event) {
      setState(() {
        contracts = event.docs;
        if (contracts.isEmpty) isContractsEmpty = true;
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
        : isContractsEmpty
            ? Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).colorScheme.primary),
                child: const Center(
                  child: Text("No Contract yet"),
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
                    itemCount: contracts.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (context, index) {
                      return FreelancerContractCard(data: contracts[index]);
                    },
                  ),
                ),
              );
  }
}
