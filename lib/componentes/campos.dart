import 'package:flutter/material.dart';

class CamposForm extends StatelessWidget {
  final String hintText;

  const CamposForm({super.key, required this.hintText, required TextEditingController controller, required keyboardType});

  @override
  Widget build(BuildContext context) {
    return TextField(
              decoration: InputDecoration(
                hintText: hintText,
              ),
              style: TextStyle(
                fontSize: 28.0,
              ),
            );
    }
  }

