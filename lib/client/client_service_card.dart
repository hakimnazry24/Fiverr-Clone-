import 'package:flutter/material.dart';
import 'package:flutter_app/client/create_contract_page.dart';

class ClientServiceCard extends StatelessWidget {
  final dynamic data;
  final bool isForDisplay;

  const ClientServiceCard(
      {super.key, required this.data, this.isForDisplay = false});

  @override
  Widget build(BuildContext context) {
    List<dynamic> categories = data.data()["categories"];

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
              Wrap(
                children: categories
                    .map((category) => Container(
                          margin: const EdgeInsets.all(2),
                          padding: const EdgeInsets.fromLTRB(7, 3, 7, 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.primary),
                          child: Text(category, style: const TextStyle(fontSize: 12),),
                        ))
                    .toList(),
              ),
              if (!isForDisplay)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CreateContractPage(data: data),
                        ),
                      ),
                      child: const Text(
                        "Create contract",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
