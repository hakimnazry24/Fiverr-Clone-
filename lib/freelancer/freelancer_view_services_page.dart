import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';
import 'package:flutter_app/client/client_service_card.dart';
import 'package:flutter_app/freelancer/freelancer_service_card.dart';
import 'create_gig_page.dart';

class FreelancerViewServicesPage extends StatefulWidget {
  const FreelancerViewServicesPage({Key? key}) : super(key: key);

  @override
  _ViewServicesPageState createState() => _ViewServicesPageState();
}

class _ViewServicesPageState extends State<FreelancerViewServicesPage> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGigPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: services.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return FreelancerServiceCard(data: services[index]);
        },
      ),
    );
  }
}
