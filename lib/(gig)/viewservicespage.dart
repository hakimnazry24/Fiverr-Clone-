import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';
import 'package:flutter_app/(gig)/service_card.dart';
import 'create_gig_page.dart';

class ViewServicesPage extends StatefulWidget {
  const ViewServicesPage({Key? key}) : super(key: key);

  @override
  _ViewServicesPageState createState() => _ViewServicesPageState();
}

class _ViewServicesPageState extends State<ViewServicesPage> {
  var services = [];
  Future<void> getData() async {
    await db.collection("Gig").get().then((event) {
      setState(() {
        services = event.docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    () async {
      getData();
    }();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateGigPage()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemCount: services.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ServiceCard(data: services[index]);
        },
      ),
    );
  }
}
