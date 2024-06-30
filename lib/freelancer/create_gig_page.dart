import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_auth.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';

class CreateGigPage extends StatefulWidget {
  final dynamic gigData;

  const CreateGigPage({Key? key, this.gigData}) : super(key: key);

  @override
  _CreateGigPageState createState() => _CreateGigPageState();
}

class _CreateGigPageState extends State<CreateGigPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _freelancerNameController =
      TextEditingController();
  final TextEditingController _freelancerContactController =
      TextEditingController();
  final TextEditingController _priceMinController = TextEditingController();
  final TextEditingController _priceMaxController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  User freelancer = auth.currentUser!;

  @override
  void initState() {
    super.initState();
    if (widget.gigData != null) {
      _nameController.text = widget.gigData.data()["name"];
      _freelancerNameController.text = widget.gigData.data()["freelancer_name"];
      _freelancerContactController.text =
          widget.gigData.data()["freelancer_contact"];
      _priceMinController.text = widget.gigData.data()["price_min"].toString();
      _priceMaxController.text = widget.gigData.data()["price_max"].toString();
      _descriptionController.text = widget.gigData.data()["description"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Gig')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGigPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the gig name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _freelancerNameController,
                decoration: const InputDecoration(labelText: 'Freelancer Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the freelancer name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _freelancerContactController,
                decoration:
                    const InputDecoration(labelText: 'Freelancer Contact'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the freelancer contact';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceMinController,
                decoration: const InputDecoration(labelText: 'Minimum Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the minimum price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceMaxController,
                decoration: const InputDecoration(labelText: 'Maximum Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the maximum price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var gigData = {
                      'name': _nameController.text,
                      'freelancer_name': _freelancerNameController.text,
                      'freelancer_contact': _freelancerContactController.text,
                      'price_min': int.parse(_priceMinController.text),
                      'price_max': int.parse(_priceMaxController.text),
                      'description': _descriptionController.text,
                      'freelancerId': freelancer.uid
                    };
                    if (widget.gigData != null) {
                      try {
                        db
                            .collection('Gig')
                            .doc(widget.gigData.id)
                            .update(gigData);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Successfully add new Gig")));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    "Cannot add new Gig. Something is wrong")));
                      }
                    } else {
                      db.collection('Gig').add(gigData);
                    }
                    Navigator.pop(
                      context,
                    );
                  }
                },
                child:
                    Text(widget.gigData != null ? 'Update Gig' : 'Create Gig'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
