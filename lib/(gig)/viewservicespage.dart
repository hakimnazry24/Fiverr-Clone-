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
  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder(
        stream: db.collection("Gig").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var services = snapshot.data!.docs;
          return ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 10),
            padding: EdgeInsets.all(10),
            itemCount: services.length,
            itemBuilder: (BuildContext context, index) {
              return ServiceCard(data: services[index]);
            },
          );
        },
      ),
    );
  }
}
