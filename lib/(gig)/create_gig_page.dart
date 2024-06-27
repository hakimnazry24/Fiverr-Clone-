import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';

class CreateGigPage extends StatefulWidget {
  final dynamic gigData;

  const CreateGigPage({Key? key, this.gigData}) : super(key: key);

  @override
  _CreateGigPageState createState() => _CreateGigPageState();
}

class _CreateGigPageState extends State<CreateGigPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _freelancerNameController = TextEditingController();
  TextEditingController _freelancerContactController = TextEditingController();
  TextEditingController _priceMinController = TextEditingController();
  TextEditingController _priceMaxController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.gigData != null) {
      _nameController.text = widget.gigData.data()["name"];
      _freelancerNameController.text = widget.gigData.data()["freelancer_name"];
      _freelancerContactController.text = widget.gigData.data()["freelancer_contact"];
      _priceMinController.text = widget.gigData.data()["price_min"].toString();
      _priceMaxController.text = widget.gigData.data()["price_max"].toString();
      _descriptionController.text = widget.gigData.data()["description"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Gig')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the gig name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _freelancerNameController,
                decoration: InputDecoration(labelText: 'Freelancer Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the freelancer name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _freelancerContactController,
                decoration: InputDecoration(labelText: 'Freelancer Contact'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the freelancer contact';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceMinController,
                decoration: InputDecoration(labelText: 'Minimum Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the minimum price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceMaxController,
                decoration: InputDecoration(labelText: 'Maximum Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the maximum price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    var gigData = {
                      'name': _nameController.text,
                      'freelancer_name': _freelancerNameController.text,
                      'freelancer_contact': _freelancerContactController.text,
                      'price_min': int.parse(_priceMinController.text),
                      'price_max': int.parse(_priceMaxController.text),
                      'description': _descriptionController.text,
                    };
                    if (widget.gigData != null) {
                      await db.collection('Gig').doc(widget.gigData.id).update(gigData);
                    } else {
                      await db.collection('Gig').add(gigData);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.gigData != null ? 'Update Gig' : 'Create Gig'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
