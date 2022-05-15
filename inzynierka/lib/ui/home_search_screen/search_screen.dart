import 'package:flutter/material.dart';
import 'package:inzynierka/globals/fitstat_appbar.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_drawer.dart';
import 'package:inzynierka/logics/hubs/search_product_info_repositoory.dart';
import 'package:inzynierka/models/api_product.dart';
import 'package:inzynierka/ui/home_search_screen/widgets/api_product_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ApiProduct> _apiProducts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const FitstatDrawer(),
      appBar: const FitStatAppBar(
        title: 'Wyszukaj',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchForm(
              onSearch: onsearchTapped,
            ),
            _apiProducts.isEmpty
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.search,
                          color: Colors.black12,
                          size: 110,
                        ),
                        Text(
                          'Brak wyników do wyświetlenia,',
                          style: TextStyle(
                            color: Colors.black12,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _apiProducts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ApiProductTile(apiProduct: _apiProducts[index]);
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void onFoodTileTapped() {}
  void onsearchTapped(String query) async {
    _apiProducts.clear();
    _apiProducts.addAll(
        await SearchProductInfoRepository().getSearchedProdustList(query));
    setState(() {});
  }
}

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
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Wyszukaj produkty',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  filled: false,
                  errorStyle: TextStyle(fontSize: 15)),
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
