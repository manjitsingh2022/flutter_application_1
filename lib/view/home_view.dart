import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/calculator_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home Page'), 
      // ),
      body:SafeArea(child: CalculatorView()) ,
    );
  }
}