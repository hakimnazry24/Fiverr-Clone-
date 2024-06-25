import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ContractForm extends StatefulWidget {
  const ContractForm({Key? key}) : super(key: key);

  @override
  State<ContractForm> createState() => _ContractFormState();
}

class _ContractFormState extends State<ContractForm> {
  final _formKey = GlobalKey<FormState>();
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
      appBar: AppBar(
        title: const Text('Create Contract'),
        centerTitle: true,
      ),
      body: Container( 
        decoration: BoxDecoration(color: Color.fromRGBO(208, 249, 224, 1.0)),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: <Widget>[
             Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color.fromRGBO(113, 111, 111, 1), Color.fromRGBO(113, 111, 111, 1)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
            children: <Widget>[
              Text('Laundry - From Washing until Drying',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text('by: Hakim Nazry'),
              Text('RM 10.00 - RM 20.00', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text( 'Description: I will wash your clothes and dry them. I will also iron them if you want me to.')
            ],
          ),),
             ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
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
              Positioned(
              bottom: 16,
              right: 16,
              child: FloatingActionButton(
                onPressed: (){},
                backgroundColor: Color.fromRGBO(111, 250, 167, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text('Create contract', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ),
            ),
            ],
          ),
        ),
      ),);
      
  }}
