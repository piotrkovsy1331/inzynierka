import 'package:flutter/material.dart';
import 'package:inzynierka/logics/hubs/meal_day_repository.dart';
import 'package:inzynierka/models/details.dart';
import 'package:inzynierka/models/enums/meal_type_enum.dart';
import 'package:inzynierka/models/product.dart';
import 'package:inzynierka/routes/router.gr.dart';

import 'package:auto_route/auto_route.dart';
import 'package:inzynierka/ui/add_product_screen/widget/fitstat_textformfield.dart';

import '../../globals/fitstat_appbar.dart';
import 'widget/fitstat_value_slider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen(
      {Key? key, required this.mealTypeName, required this.date})
      : super(key: key);
  final MealTypeNameEnum mealTypeName;
  final DateTime date;

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

  bool? caloriesValidated;
  bool? proteinValidated;
  bool? fatValidated;
  bool? sugarValidated;
  bool? weightValidated;

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
                    child: FitStatTextFormFieldWithBorder(
                        productNameController: _productNameController,
                        placeholder: 'Podaj nazwę produktu'),
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
                    unit: 'tłuszcz/100g',
                    maxValue: 99,
                    hintText: 'Podaj ilość tłuszczu na 100g produktu',
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
                    hintText: 'Podaj ilość cukru na 100g produktu',
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
                    maxValue: 1000,
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

  bool validataStiders() {
    if (caloriesValue > 1) {
      setState(() {
        caloriesValidated = true;
      });
    } else {
      setState(() {
        caloriesValidated = false;
      });
    }
    if (proteinValue > 1) {
      setState(() {
        proteinValidated = true;
      });
    } else {
      setState(() {
        proteinValidated = false;
      });
    }
    if (fatValue > 1) {
      setState(() {
        fatValidated = true;
      });
    } else {
      setState(() {
        fatValidated = false;
      });
    }
    if (sugarValue > 1) {
      setState(() {
        sugarValidated = true;
      });
    } else {
      setState(() {
        sugarValidated = false;
      });
    }
    if (weightValue > 1) {
      setState(() {
        weightValidated = true;
      });
    } else {
      setState(() {
        weightValidated = false;
      });
    }
    if ((caloriesValidated == true && caloriesValidated != null) &&
        (proteinValidated == true && proteinValidated != null) &&
        (fatValidated == true && fatValidated != null) &&
        (sugarValidated == true && sugarValidated != null) &&
        (weightValidated == true && weightValidated != null)) {
      return true;
    } else {
      return false;
    }
  }

  void resetForm() {
    caloriesValue = 0;
    proteinValue = 0;
    fatValue = 0;
    sugarValue = 0;
    weightValue = 0;
  }

  void onSubmitPressed() {
    bool _passed1 = _addProductFormKey.currentState!.validate();
    bool _passed2 = validataStiders();

    if (_passed1 && _passed2) {
      MealDayRepository().addProduct(
        widget.mealTypeName.displayName,
        Product(
            name: _productNameController.text,
            productDetails: Details(
                calories: countValueforWeight(weightValue, caloriesValue),
                fat: countValueforWeight(weightValue, fatValue),
                protein: countValueforWeight(weightValue, proteinValue),
                sugar: countValueforWeight(weightValue, sugarValue),
                weight: weightValue.floor())),
        widget.date,
      );
      _addProductFormKey.currentState!.reset();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Produkt został dodany ')));
      AutoRouter.of(context).push(const HomeRoute());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Proszę uzupełnić wszystkie powysze wartości ')));
    }
  }

  int countValueforWeight(double weight, double value) {
    return (value * weight / 100).floor();
  }
}