import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  SearchForm({required this.onSearch});

  final void Function(String search) onSearch;

  @override
  _SearchFormState createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();
  var _searchedItem = "";
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Wyszukaj produkty',
                  hintStyle: Theme.of(context).textTheme.headline4,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: false,
                  errorStyle: const TextStyle(fontSize: 15)),
              onChanged: (value) {
                _searchedItem = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return ' Wpisz nazwe ';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final isValid = _formKey.currentState!.validate();
                  if (isValid) {
                    widget.onSearch(_searchedItem);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(13),
                  child: Text(
                    'Szukaj',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
