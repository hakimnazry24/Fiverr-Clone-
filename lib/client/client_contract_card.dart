import 'package:flutter/material.dart';
import 'package:flutter_app/client/create_contract_page.dart';
import 'package:flutter/services.dart';

class ClientContractCard extends StatelessWidget {
  final data; // data from gig collection

  const ClientContractCard({
    super.key,
    required this.data,
  });

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Phone No copied to clipboard')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 5))
            ]),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                data.data()["service_name"],
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                'By ${data.data()["freelancer_name"]}',
                style: TextStyle(
                    fontSize: 13, color: Colors.black.withOpacity(0.8)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(15),
                    color: data.data()["status"] == "pending"
                        ? Colors.yellow
                        : data.data()["status"] == "accepted"
                            ? Colors.blue
                            : data.data()["status"] == "decline"
                                ? Colors.red
                                : Colors.white),
                padding: const EdgeInsets.all(10),
                child: Text("Status: ${data.data()['status']}"),
              ),
              Text(
                'Date ${data.data()["date"]}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Client name: ${data.data()["client_name"]}',
                style: const TextStyle(fontSize: 13, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Offer made: RM${data.data()["offer"]}',
                style: const TextStyle(fontSize: 13, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Client contact: ${data.data()["client_contact"]}',
                style: const TextStyle(fontSize: 13, height: 1.5),
                textAlign: TextAlign.justify,
              ),

              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Freelancer contact: ${data.data()["freelancer_contact"]}',
                      style: const TextStyle(fontSize: 13, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () => _copyToClipboard(context, data.data()["freelancer_contact"]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // display Create Contract button when isForDisplay is true
              // display empty widget when false

              
            ],
          ),
        ),
      ),
    );
  }
}
