import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/components/constants.dart';

/// Flutter code sample for [DropdownButton].

const List<String> list = <String>[
  "Compte courant",
  "Compte d'epargne",
  "Compte à terme",
  "Compte bancaire offshore",
  "Compte professionnel",
  "Compte joint"
];

class DropdownButtonCpt extends StatefulWidget {
  const DropdownButtonCpt({super.key});

  @override
  State<DropdownButtonCpt> createState() => _DropdownButtonCptState();
}

class _DropdownButtonCptState extends State<DropdownButtonCpt> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        // icon: const Icon(Icons.arrow_downward),
        // elevation: 16,
        underline: null,
        style: const TextStyle(color: Colors.blue),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          drpValue = value!;
          setState(() {
            dropdownValue = value;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
