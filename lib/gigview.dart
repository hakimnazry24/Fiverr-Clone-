import 'gigbox.dart';
import 'package:flutter/material.dart';
import 'contractview.dart';

void main() {
  runApp(const GigView());
}

class GigView extends StatefulWidget {
  const GigView({Key? key}) : super(key: key);

  @override
  _GigViewState createState() => _GigViewState();
}

class _GigViewState extends State<GigView> {
  final List _gig = ['gig 1', 'gig 2', 'gig 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gig'),
          centerTitle: true,
          actions: [
            PopupMenuButton<int>(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Contract'),
                ),
              ],
              onSelected: (value) {
                if (value == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const ContractView(contracts: [])));
                }
              },
            )
          ],
        ),
        body: ListView.builder(
          itemCount: _gig.length,
          itemBuilder: (context, index) {
            return MyGig(child: _gig[index]);
          },
        ));
  }
}
