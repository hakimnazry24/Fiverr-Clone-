import 'package:flutter/material.dart';
import 'package:flutter_app/(gig)/service_card.dart';
import 'package:flutter_app/(contract)/viewcontractspage.dart';
import 'package:intl/intl.dart';

class CreateContractPage extends StatefulWidget {
  var data;
  
  CreateContractPage({super.key, required this.data});

  @override
  State<CreateContractPage> createState() => _CreateContractPageState();
}

class _CreateContractPageState extends State<CreateContractPage> {
  Future<void> createContract() async {}
  final _formKey = GlobalKey<FormState>();
  final _clientNameController = TextEditingController();
  final _phonenumberclientController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _offerController = TextEditingController();
  final _additionalnoteController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _offerController.dispose();
    _additionalnoteController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.all(30),

          // width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Create contract",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              ServiceCard(
                data: widget.data,
                isForDisplay: true,
              ),
              const SizedBox(
                height: 10,
              ),
                            Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _clientNameController,
                        decoration: const InputDecoration(
                          labelText: 'Client Name',
                          hintText: 'Enter client name',
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.green, width: 2.0 )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0)
                          ),
                          filled: true,
                          fillColor: Colors.white
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the client name';
                          }
                          return null;
                        },
                        
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _phonenumberclientController,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          hintText: 'Enter phone number',
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.green, width: 2.0 )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0)
                          ),
                          filled: true,
                          fillColor: Colors.white
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the phone number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _dateController,
                        decoration: const InputDecoration(
                          labelText: 'Due Date',
                          hintText: 'Enter the due date',
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.green, width: 2.0 )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0)
                          ),
                          filled: true,
                          fillColor: Colors.white
                        ),
                        onTap: () => _selectDate(context),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the due date';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _timeController,
                        decoration: const InputDecoration(
                          labelText: 'Time',
                          hintText: 'Enter the time',
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.green, width: 2.0 )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0)
                          ),
                          filled: true,
                          fillColor: Colors.white
                        ),
                        onTap: () => _selectTime(context),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the time';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _offerController,
                        decoration: const InputDecoration(
                          labelText: 'Offer',
                          hintText: 'RM',
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.green, width: 2.0 )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0)
                          ),
                          filled: true,
                          fillColor: Colors.white
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the offer amount';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _additionalnoteController,
                        decoration: const InputDecoration(
                          labelText: 'Additional Note',
                          hintText: 'Enter additional notes',
                          focusedBorder: OutlineInputBorder(
                            borderSide:  BorderSide(color: Colors.green, width: 2.0 )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: 1.0)
                          ),
                          filled: true,
                          fillColor: Colors.white
                        ),
                        maxLines: 3,
                      ),
                    ),
        
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            await createContract();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ViewContractsPage()));
                          } catch (e) {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      content: Text("Something is wrong"),
                                    ));
                          }
                        },
                        child: Text("Create contract"))
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}