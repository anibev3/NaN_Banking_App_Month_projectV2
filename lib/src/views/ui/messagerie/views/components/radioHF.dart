import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/components/constants.dart';

/// Flutter code sample for [Radio].

enum Genre { homme, femme }

class RadioHF extends StatefulWidget {
  const RadioHF({super.key});

  @override
  State<RadioHF> createState() => _RadioHFState();
}

class _RadioHFState extends State<RadioHF> {
  Genre? _character = Genre.homme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          child: ListTile(
            title: const Icon(Icons.man),
            leading: Radio<Genre>(
              value: Genre.homme,
              groupValue: _character,
              onChanged: (Genre? value) {
                setState(() {
                  _character = value;
                });
                genreCus = _character!;
              },
            ),
          ),
        ),
        Flexible(
          child: ListTile(
            title: const Icon(Icons.woman),
            leading: Radio<Genre>(
              value: Genre.femme,
              groupValue: _character,
              onChanged: (Genre? value) {
                setState(() {
                  _character = value;
                });
                genreCus = _character!;
              },
            ),
          ),
        ),
      ],
    );
  }
}
