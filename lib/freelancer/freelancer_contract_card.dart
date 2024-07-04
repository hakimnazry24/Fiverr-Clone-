import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/firebase_firestore.dart';
import 'package:flutter/services.dart';

class FreelancerContractCard extends StatefulWidget {
  final dynamic data; // data from gig collection

  const FreelancerContractCard({
    super.key,
    required this.data,
  });

  @override
  State<FreelancerContractCard> createState() => _FreelancerContractCardState();
}

class _FreelancerContractCardState extends State<FreelancerContractCard> {
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Phone No copied to clipboard')),
    );
  }

  bool isContractAccepted = false;
  bool isAcceptOrRejectedButtonPressed = false;
  bool isHideContractButtonPressed = false;
  bool isRejectButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isHideContractButtonPressed ||
              widget.data.data()["hide_from_freelancer"]
          ? false
          : true,
      child: SizedBox(
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
                  widget.data.data()["service_name"] ?? "No service name",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'By ${widget.data.data()["freelancer_name"] ?? "No freelancer name"}',
                  style: TextStyle(
                      fontSize: 13, color: Colors.black.withOpacity(0.8)),
                ),
                const SizedBox(
                  height: 10,
                ),
                !isAcceptOrRejectedButtonPressed
                    ? Container(
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
                      )
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(15),
                            color:
                                isContractAccepted ? Colors.green : Colors.red),
                        padding: const EdgeInsets.all(10),
                        child: !isAcceptOrRejectedButtonPressed
                            ? Text("Status: ${widget.data.data()['status']}")
                            : Text(isContractAccepted
                                ? "Status: accepted"
                                : "Status: decline"),
                      ),
                Text(
                  'Date ${widget.data.data()["date"] ?? "No date"}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Client name: ${widget.data.data()["client_name"] ?? "No client name"}',
                  style: const TextStyle(fontSize: 13, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Offer made: RM${widget.data.data()["offer"] ?? "No offer"}',
                  style: const TextStyle(fontSize: 13, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Client contact: ${widget.data.data()["client_contact"] ?? "No client contact"}',
                  style: const TextStyle(fontSize: 13, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Freelancer contact: ${widget.data.data()["freelancer_contact"] ?? "No freelancer contact"}',
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
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    // only display Accept or Reject Contract button when the button is not yet pressed
                    // and the status of the Contract is "pending"
                    child: !isAcceptOrRejectedButtonPressed &&
                            widget.data.data()["status"] == "pending"
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                              title: const Text(
                                                  "Decline Contract"),
                                              content: const Text(
                                                  "Are you sure to decline this Contract?"),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text("Cancel")),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      try {
                                                        db
                                                            .collection(
                                                                "Contract")
                                                            .doc(widget.data.id)
                                                            .update({
                                                          "status": "decline",
                                                        });
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "You have declined the Contract!")));

                                                        setState(() {
                                                          isAcceptOrRejectedButtonPressed =
                                                              true;
                                                          isContractAccepted =
                                                              false;
                                                        });
                                                      } catch (e) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Unsuccessful in accepting the Contract. Something is wrong")));
                                                      }
                                                    },
                                                    child:
                                                        const Text("Decline"))
                                              ],
                                            ));
                                  },
                                  child: const Text("Decline contract")),
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (_) => AlertDialog(
                                              title:
                                                  const Text("Accept Contract"),
                                              content: const Text(
                                                  "Are you sure to accept this Contract?"),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text("Cancel")),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      try {
                                                        db
                                                            .collection(
                                                                "Contract")
                                                            .doc(widget.data.id)
                                                            .update({
                                                          "status": "accepted",
                                                        });

                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "You have accepted the Contract!")));

                                                        Navigator.pop(context);
                                                        setState(() {
                                                          isAcceptOrRejectedButtonPressed =
                                                              true;
                                                          isContractAccepted =
                                                              true;
                                                        });
                                                      } catch (e) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Unsuccessful in accepting the Contract. Something is wrong")));
                                                      }
                                                    },
                                                    child: const Text("Accept"))
                                              ],
                                            ));
                                  },
                                  child: const Text("Accept contract")),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      // show hide contract button if status of the contract is "decline"
                      widget.data.data()["status"] == "decline" ||
                              isRejectButtonPressed
                          ? IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                          title: const Text("Hide Contract"),
                                          content: const Text(
                                              "Are you sure to hide this Contract?"),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text("Cancel")),
                                            ElevatedButton(
                                                onPressed: () async {
                                                  try {
                                                    await db
                                                        .collection("Contract")
                                                        .doc(widget.data.id)
                                                        .set({
                                                      "hide_from_freelancer":
                                                          true
                                                    });
                                                    setState(() {
                                                      isHideContractButtonPressed =
                                                          true;
                                                    });
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    "Successfully hide Contract")));
                                                  } catch (e) {
                                                    print(e);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                                content: Text(
                                                                    "Unsuccessfull hiding Contract. Something is wrong")));
                                                  }
                                                },
                                                child:
                                                    const Text("Hide Contract"))
                                          ],
                                        ));
                              },
                              icon: const Icon(Icons.visibility_off))
                          : const SizedBox.shrink()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
