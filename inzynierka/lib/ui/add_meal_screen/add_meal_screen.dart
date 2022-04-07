import 'package:flutter/material.dart';

class AddMealScreen extends StatefulWidget {
 const AddMealScreen({Key? key}) : super(key: key);

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nazwa posiłku'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [Text('AddMealScreen')],
      ),
    );
  }
}
