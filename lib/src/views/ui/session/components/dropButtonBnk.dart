import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/constants.dart';
import 'package:provider/provider.dart';

/// Flutter code sample for [DropdownButton].

const List<String> listBank = <String>[
  "NAWARI",
  "BANQUE ATLATIQUE",
  "BNI",
  "BANQUE POPULAIRE",
  "ECOBANK",
  "NSIA BANQUE",
  "VERSUS BANK"
];
const Map<String, dynamic> listImages = {
  "NAWARI": "assets/img/nawari1.png",
  "BANQUE ATLATIQUE": "assets/img/bat.jpeg",
  "BNI": "assets/img/bni.png",
  "BANQUE POPULAIRE": "assets/img/bpop.jpeg",
  "ECOBANK": "assets/img/eco.jpg",
  "NSIA BANQUE": "assets/img/nsia.jpeg",
  "VERSUS BANK": "assets/img/versus.png",
};

class DropdownButtonTypBnk extends StatefulWidget {
  const DropdownButtonTypBnk({super.key});

  @override
  State<DropdownButtonTypBnk> createState() => _DropdownButtonTypBnkState();
}

class _DropdownButtonTypBnkState extends State<DropdownButtonTypBnk> {
  String dropdownValueBank = listBank.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: dropdownValueBank,
        // icon: const Icon(Icons.arrow_downward),
        // elevation: 16,
        // iconSize: 10,
        style: const TextStyle(color: Colors.blue),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          // var appState = Provider.of<AppState>(context, listen: false);

          setState(() {
            dropdownValueBank = value!;
            drpValueBank = value;
          });
        },
        items: listBank.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 200),
              child: ListTile(
                title: Text(
                  value,
                  style: const TextStyle(fontSize: 12),
                ),
                leading: ClipRRect(
                  child: SizedBox(
                      height: 37,
                      width: 37,
                      child: Image.asset(listImages[value])),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
