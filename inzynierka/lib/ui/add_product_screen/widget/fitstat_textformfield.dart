import 'package:flutter/material.dart';

import '../../../helpers/validators.dart';

class FitStatTextFormFieldWithBorder extends StatelessWidget {
  const FitStatTextFormFieldWithBorder({
    Key? key,
    required TextEditingController productNameController,
    this.isReadOnly = false,
    required this.placeholder,
  })  : _productNameController = productNameController,
        super(key: key);

  final TextEditingController _productNameController;
  final bool isReadOnly;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        readOnly: isReadOnly,
        controller: _productNameController,
        validator: Validators.textValidator,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: Theme.of(context).textTheme.headline4,
          labelStyle: Theme.of(context).textTheme.headline4,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Theme.of(context).cardColor),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.green, width: 2.0)),
          fillColor: Colors.green,
        ),
        keyboardType: TextInputType.text);
  }
}
