// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BirWidget extends StatelessWidget {
  const BirWidget({super.key, required this.isTrue, required this.baskanda});

  final bool isTrue;
  final void Function(bool) baskanda;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => baskanda(isTrue),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: isTrue == true ? Colors.green : Colors.red,
          ),
          child: Text(
            isTrue == true ? 'Туура' : 'Туура эмес',
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
