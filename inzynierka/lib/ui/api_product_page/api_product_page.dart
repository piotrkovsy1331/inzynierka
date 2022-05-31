import 'package:flutter/material.dart';
import 'package:inzynierka/helpers/time_helper.dart';
import 'package:inzynierka/logics/hubs/meal_day_repository.dart';
import 'package:inzynierka/logics/hubs/search_product_info_repositoory.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/enums/meal_type_enum.dart';
import 'package:inzynierka/ui/add_product_screen/widget/fitstat_value_slider.dart';
import 'package:inzynierka/ui/api_product_page/widget/api_product_quantity_text.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:auto_route/auto_route.dart';
import '../../globals/fitstat_appbar.dart';
import '../../models/product.dart';
import '../../routes/router.gr.dart';

class ApiProductScreen extends StatefulWidget {
  ApiProductScreen({Key? key, required this.foodName}) : super(key: key);
  String foodName;
  @override
  State<ApiProductScreen> createState() => _ApiProductScreenState();
}

class _ApiProductScreenState extends State<ApiProductScreen> {
  late final Future<Product> product;

  List<DropdownMenuItem<String>> mealDropdownItems = [
    DropdownMenuItem(
      child: Text(MealTypeNameEnum.breakfast.displayName),
      value: MealTypeNameEnum.breakfast.displayName,
    ),
    DropdownMenuItem(
      child: Text(MealTypeNameEnum.lunch.displayName),
      value: MealTypeNameEnum.lunch.displayName,
    ),
    DropdownMenuItem(
      child: Text(MealTypeNameEnum.dinner.displayName),
      value: MealTypeNameEnum.dinner.displayName,
    ),
    DropdownMenuItem(
      child: Text(MealTypeNameEnum.supper.displayName),
      value: MealTypeNameEnum.supper.displayName,
    ),
    DropdownMenuItem(
      child: Text(MealTypeNameEnum.tea.displayName),
      value: MealTypeNameEnum.tea.displayName,
    ),
  ];

  String? mealType;
  double weightValue = 0;
  bool? weightValidated;
  bool? mealTypeValidateed;
  @override
  void initState() {
    super.initState();
    product =
        SearchProductInfoRepository().getProductNutritionInfo(widget.foodName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FitStatAppBar(title: widget.foodName),
      body: FutureBuilder(
        future: product,
        builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: snapshot.data!.photoUrl ??
                                "https://cdn.pixabay.com/photo/2014/12/21/23/39/bananas-575773_1280.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 30),
                          child: Text(
                            (snapshot.data!.name).toUpperCase(),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Theme.of(context).cardColor,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
                    decoration: _boxDecoration(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Wartości odywcze ',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ApiProductQuantityText(
                              quantity: 'kcal',
                              value: snapshot.data!.productDetails.calories
                                  .toString()),
                          ApiProductQuantityText(
                              quantity: 'białko',
                              value: snapshot.data!.productDetails.protein
                                  .toString()),
                          ApiProductQuantityText(
                              quantity: 'tłuszcz',
                              value:
                                  snapshot.data!.productDetails.fat.toString()),
                          ApiProductQuantityText(
                              quantity: 'cukier',
                              value: snapshot.data!.productDetails.sugar
                                  .toString()),
                          const SizedBox(
                            height: 15,
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Podaj ilość i wybierz posiłek ',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FitstatValueSlider(
                      sliderValue: weightValue,
                      hintText: 'Podaj masę produktu',
                      onValueChange: (value) {
                        setState(() {
                          weightValue = value;
                        });
                      },
                      unit: 'gram',
                      validated: weightValidated,
                      maxValue: 1000),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: DropdownButtonFormField(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Dodaj do ',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(color: Theme.of(context).cardColor),
                          ),
                        ),
                        items: mealDropdownItems,
                        onChanged: (value) {
                          mealType = value.toString();
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => onAddProductTapped(snapshot.data!),
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40)),
                          ),
                          child: Center(
                            child: Text(
                              'Dodaj',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Error Screen'),
            );
          }
        },
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      // gradient: LinearGradient(colors: gradientColor),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(width: 2, color: Colors.grey),
    );
  }

  void validateSliders() {
    weightValidated = weightValue != 0 ? true : false;
  }

  void validateDropdown() {
    mealTypeValidateed = mealType != null ? true : false;
  }

  void onAddProductTapped(Product product) async {
    validateSliders();
    validateDropdown();

    if (weightValidated == true && mealTypeValidateed == true) {
      MealDayRepository().addProduct(
          mealType!,
          Product(
              name: product.name,
              productDetails: countDetails(product, weightValue)),
          TimeHelper.returnCurrentDate(DateTime.now()));
      AutoRouter.of(context).push(const HomeRoute());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Proszę uzupełnić wszystkie powysze wartości ')));
    }
  }

  Details countDetails(Product product, double weight) {
    return Details(
      calories: countValue(weight, product.productDetails.calories),
      fat: countValue(weight, product.productDetails.fat),
      protein: countValue(weight, product.productDetails.protein),
      sugar: countValue(weight, product.productDetails.sugar),
      weight: weightValue.ceil(),
    );
  }

  int countValue(double weight, int quantity) {
    return ((quantity * weight) / 100).ceil();
  }
}
