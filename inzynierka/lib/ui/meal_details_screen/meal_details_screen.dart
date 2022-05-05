import 'package:flutter/material.dart';
import 'package:inzynierka/logics/hubs/meal_day_repository.dart';
import 'package:inzynierka/models/enums/meal_type_enum.dart';
import 'package:inzynierka/ui/meal_details_screen/widgets/product_tile.dart';

import '../../globals/fitstat_appbar.dart';
import '../../models/product.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen(
      {Key? key,
      required this.gradientColor,
      required this.mealTypeName,
      required this.productsList,
      required this.date})
      : super(key: key);
  final MealTypeNameEnum mealTypeName;
  final List<Color> gradientColor;
  final List<Product> productsList;
  final DateTime date;
  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FitStatAppBar(
        title: widget.mealTypeName.displayName,
      ),
      body: (widget.productsList.isEmpty)
          ? Center(
              child: Text(
                'Brak posiłków',
                style: Theme.of(context).textTheme.headline3!,
              ),
            )
          : ListView.builder(
              itemCount: widget.productsList.length,
              itemBuilder: (context, index) {
                return ProductTile(
                  product: widget.productsList[index],
                  gradientColor: widget.gradientColor,
                  onDeleteTapped: (iddex) {
                    deleteProduct(
                        index, widget.mealTypeName.displayName, widget.date);
                    widget.productsList.removeAt(index);

                    setState(() {});
                  },
                  index: index,
                );
              },
            ),
    );
  }

  void deleteProduct(int index, String mealtype, DateTime date) {
    MealDayRepository().removeProduct(index, mealtype, date);
  }
}
