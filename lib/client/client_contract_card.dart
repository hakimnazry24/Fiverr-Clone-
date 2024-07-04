import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';

class ClientContractCard extends StatefulWidget {
  final data; // data from gig collection

  const ClientContractCard({
    super.key,
    required this.data,
  });

  @override
  State<ClientContractCard> createState() => _ClientContractCardState();
}

class _ClientContractCardState extends State<ClientContractCard> {
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Phone No copied to clipboard')),
    );
  }

  bool isDisposeCard = false;

  @override
  Widget build(BuildContext context) {
    // return SizedBox.shrink() when the Contract is deleted
    return !isDisposeCard ? SizedBox(
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
                widget.data.data()["service_name"],
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                'By ${widget.data.data()["freelancer_name"]}',
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
                    color: widget.data.data()["status"] == "pending"
                        ? Colors.yellow
                        : widget.data.data()["status"] == "accepted"
                            ? Colors.green
                            : widget.data.data()["status"] == "decline"
                                ? Colors.red
                                : Colors.white),
                padding: const EdgeInsets.all(10),
                child: Text("Status: ${widget.data.data()['status']}"),
              ),
              Text(
                'Date ${widget.data.data()["date"]}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Client name: ${widget.data.data()["client_name"]}',
                style: const TextStyle(fontSize: 13, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              Text(
                'Offer made: RM${widget.data.data()["offer"]}',
                style: const TextStyle(fontSize: 13, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Client contact: ${widget.data.data()["client_contact"]}',
                style: const TextStyle(fontSize: 13, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Freelancer contact: ${widget.data.data()["freelancer_contact"]}',
                      style: const TextStyle(fontSize: 13, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: () => _copyToClipboard(
                        context, widget.data.data()["freelancer_contact"]),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text("Delete contract"),
                                  content: const Text(
                                      "Are you sure to delete this Contract?"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel")),
                                    ElevatedButton(
                                        onPressed: () async {
                                          try {
                                            await db
                                                .collection("Contract")
                                                .doc(widget.data.id)
                                                .delete();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Successfully delete Contract")));
                                            setState(() {
                                              isDisposeCard = true;
                                            });
                                            Navigator.pop(context);
                                          } catch (e) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        "Unsuccessfully delete Contract. Something is wrong")));
                                          }
                                        },
                                        child: const Text("Delete")),
                                  ],
                                ));
                      },
                      icon: const Icon(Icons.delete)),
                  const SizedBox(
                    width: 10,
                  ),
                  // IconButton(onPressed: editContract, icon: const Icon(Icons.edit)),
                ],
              )
            ],
          ),
        ),
      ),
    ) : const SizedBox.shrink();
  }
}
