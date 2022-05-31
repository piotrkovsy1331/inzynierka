import 'package:flutter/material.dart';
import 'package:inzynierka/globals/fitstat_appbar.dart';
import 'package:inzynierka/globals/global_widgets/fitstat_drawer.dart';
import 'package:inzynierka/logics/hubs/search_product_info_repositoory.dart';
import 'package:inzynierka/models/api_product.dart';
import 'package:inzynierka/ui/home_search_screen/widgets/api_product_tile.dart';
import 'package:inzynierka/ui/home_search_screen/widgets/search_form.dart';

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
