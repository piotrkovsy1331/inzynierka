import 'package:flutter/material.dart';
import 'package:inzynierka/helpers/validators.dart';
import 'package:inzynierka/logics/hubs/meal_day_repository.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/enums/meal_type_enum.dart';
import 'package:inzynierka/models/product.dart';
import 'package:inzynierka/ui/home_summary_screen/summary_screen.dart';
import 'package:jiffy/jiffy.dart';

import 'widget/fitstat_value_slider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key, required this.mealTypeName})
      : super(key: key);
  final MealTypeNameEnum mealTypeName;

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _addProductFormKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();

  double caloriesValue = 0;
  double proteinValue = 0;
  double fatValue = 0;
  double sugarValue = 0;
  double weightValue = 0;

  bool caloriesValidated = false;
  bool proteinValidated = false;
  bool fatValidated = false;
  bool sugarValidated = false;
  bool weightValidated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FitStatAppBar(title: 'Dodaj posiłek'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: _addProductFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: _productNameController,
                        validator: Validators.productNameValidator,
                        decoration: InputDecoration(
                          labelText: 'Nazwa Produktu',
                          labelStyle: Theme.of(context).textTheme.headline4,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Theme.of(context).cardColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.green, width: 2.0)),
                          fillColor: Colors.green,
                        ),
                        keyboardType: TextInputType.text),
                  ),
                  FitstatValueSlider(
                    sliderValue: caloriesValue,
                    unit: 'kcal/100g',
                    maxValue: 1000,
                    hintText: 'Podaj ilość kalorii na 100g produktu',
                    validated: caloriesValidated,
                    onValueChange: (double value) {
                      setState(() {
                        caloriesValue = value;
                      });
                    },
                  ),
                  FitstatValueSlider(
                    sliderValue: proteinValue,
                    unit: 'białko/100g',
                    maxValue: 99,
                    hintText: 'Podaj ilość białka na 100g produktu',
                    validated: proteinValidated,
                    onValueChange: (double value) {
                      setState(() {
                        proteinValue = value;
                      });
                    },
                  ),
                  FitstatValueSlider(
                    sliderValue: fatValue,
                    unit: 'tłuszcz/100g',
                    maxValue: 99,
                    hintText: 'Podaj ilość białka na 100g produktu',
                    validated: fatValidated,
                    onValueChange: (double value) {
                      setState(() {
                        fatValue = value;
                      });
                    },
                  ),
                  FitstatValueSlider(
                    sliderValue: sugarValue,
                    unit: 'cukier/100g',
                    maxValue: 99,
                    hintText: 'Podaj ilość tłuszczu na 100g produktu',
                    validated: sugarValidated,
                    onValueChange: (double value) {
                      setState(() {
                        sugarValue = value;
                      });
                    },
                  ),
                  FitstatValueSlider(
                    sliderValue: weightValue,
                    unit: 'gram',
                    maxValue: 99,
                    hintText: 'Podaj wagę produktu',
                    validated: weightValidated,
                    onValueChange: (double value) {
                      setState(() {
                        weightValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            child: InkWell(
              onTap: onSubmitPressed,
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                ),
                child: Center(
                  child: Text(
                    'Zapisz',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onSubmitPressed() {
    if (caloriesValue > 1) {
      setState(() {
        caloriesValidated = true;
      });
    }
    if (proteinValue > 1) {
      setState(() {
        proteinValidated = true;
      });
    }
    if (fatValue > 1) {
      setState(() {
        fatValidated = true;
      });
    }
    if (sugarValue > 1) {
      setState(() {
        sugarValidated = true;
      });
    }
    if (weightValue > 1) {
      setState(() {
        weightValidated = true;
      });
    }

    MealDayRepository().addProduct(
     widget.mealTypeName.displayName,
        Product(
            name: _productNameController.text,
            productDetails: Details(
                calories: caloriesValue.floor(),
                fat: fatValue.floor(),
                protein: proteinValue.floor(),
                sugar: sugarValue.floor(),
                weight: weightValue.floor())),
        Jiffy().startOf(Units.DAY).dateTime);
  }
}
