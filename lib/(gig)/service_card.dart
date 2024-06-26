import 'package:flutter/material.dart';
import 'package:flutter_app/(contract)/createcontractpage.dart';

class ServiceCard extends StatelessWidget {
  var data;

  // when isForDisplay equals true, it means it is for display only. The "Create Contract" will be removed
  // By default, it is false
  bool isForDisplay;
  ServiceCard({super.key, required this.data, this.isForDisplay = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // child: Text(data.data()["name"]),

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
                data.data()["name"],
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
              Text(
                'RM${data.data()["price_min"]} - RM${data.data()["price_max"]}',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                data.data()["description"],
                style: const TextStyle(fontSize: 13, height: 1.5),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              // display Create Contract button when isForDisplay is true
              // display empty widget when false
              !isForDisplay
                  ? SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CreateContractPage(
                                            data: data,
                                          ))),
                              child: const Text(
                                "Create contract",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
