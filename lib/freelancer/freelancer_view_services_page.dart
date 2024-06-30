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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGigPage()),
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
