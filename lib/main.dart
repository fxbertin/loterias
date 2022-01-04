import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loteria/screens/dashboard.dart';
import 'package:loteria/screens/resultado.dart';

void main() {
  Intl.defaultLocale = 'pt_BR';
  runApp(Loteria());
}

class Loteria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}
