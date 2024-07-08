import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';
import 'package:flutter_app/freelancer/freelancer_service_card.dart';
import 'create_gig_page.dart';

class FreelancerViewServicesPage extends StatefulWidget {
  final User freelancer;
  const FreelancerViewServicesPage({super.key, required this.freelancer});

  @override
  _ViewServicesPageState createState() => _ViewServicesPageState();
}

class _ViewServicesPageState extends State<FreelancerViewServicesPage> {
  var services = [];
  bool isLoading = true;
  bool isServicesEmpty = false;

  Future<void> getData() async {
    await db
        .collection("Gig")
        .where("freelancerId", isEqualTo: widget.freelancer.uid)
        .get()
        .then((event) {
      setState(() {
        services = event.docs;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    if (services.isEmpty) isServicesEmpty = true;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Container(
            decoration:
                BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateGigPage()),
                );
                getData();
              },
              child: const Icon(Icons.add),
            ),
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
                  return FreelancerServiceCard(data: services[index]);
                },
              ),
            ),
          );
  }
}
