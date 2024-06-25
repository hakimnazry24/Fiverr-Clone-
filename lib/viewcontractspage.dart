import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/contract_card.dart';
import 'contract.dart';
import 'gigview.dart';
import 'contractbox.dart'; // Ensure this import is needed and used correctly
import "package:flutter_app/firebase/firebase_firestore.dart";

// class ViewContractsPage extends StatefulWidget {
//   final List<Contract> contracts = [];

//   ViewContractsPage({
//     Key? key,
//     // required this.contracts
//   }) : super(key: key);

//   @override
//   _ViewContractsPageState createState() => _ViewContractsPageState();
// }

// class _ViewContractsPageState extends State<ViewContractsPage> {

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Contract'),
//       //   centerTitle: true,
//       //   actions: [
//       //     PopupMenuButton<int>(
//       //       itemBuilder: (context) => [
//       //         const PopupMenuItem(
//       //           value: 1,
//       //           child: Text('GIG'),
//       //         ),
//       //       ],
//       //       onSelected: (value) {
//       //         if (value == 1) {
//       //           Navigator.push(
//       //             context,
//       //             MaterialPageRoute(builder: (context) => const GigView()),
//       //           );
//       //         }
//       //       },
//       //     ),
//       //   ],
//       // ),
//       body: ListView.builder(
//         itemCount: widget.contracts.length,
//         itemBuilder: (context, index) {
//           return ViewContractsPage(contract: widget.contracts[index]);
//         },
//       ),
//     );
//   }
// }

class ViewContractsPage extends StatefulWidget {
  const ViewContractsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewContractsPage> createState() => _ViewContractsPageState();
}

class _ViewContractsPageState extends State<ViewContractsPage> {
  var contracts = [];
  Future<void> getData() async {
    await db.collection("Contract").get().then((event) {
      setState(() {
        contracts = event.docs;
      });
    });
  }

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Contract ID copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    () async {
      getData();
    }();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: ListView.builder(
        itemCount: contracts.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return ContractCard(data: contracts[index]);
        },
      ),
    );
  }
}


// Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: Colors.green,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Contract ID: ${contract.id}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.copy),
//                   onPressed: () => _copyToClipboard(context, contract.id),
//                 ),
//               ],
//             ),
//             Text('Looking For: ${contract.lookingFor}'),
//             Text('Offer: RM${contract.offer.toStringAsFixed(2)}'),
//             Text('Due Date: ${contract.dueDate}'),
//             Text('Description: ${contract.description}'),
//           ],
//         ),
//       ),
//     );