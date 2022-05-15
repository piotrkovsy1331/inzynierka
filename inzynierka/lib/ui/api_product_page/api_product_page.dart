import 'package:flutter/material.dart';
import 'package:inzynierka/logics/hubs/search_product_info_repositoory.dart';
import 'package:inzynierka/shared/style/fitstat_gradient.dart';
import 'package:inzynierka/ui/api_product_page/widget/api_product_quantity_text.dart';
import 'package:inzynierka/ui/meal_details_screen/widgets/product_text.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../globals/global_widgets/gradient_horizontal_divider.dart';
import '../../globals/fitstat_appbar.dart';
import '../../models/product.dart';

class ApiProductScreen extends StatefulWidget {
  ApiProductScreen({Key? key, required this.foodName}) : super(key: key);
  String foodName;
  @override
  State<ApiProductScreen> createState() => _ApiProductScreenState();
}

class _ApiProductScreenState extends State<ApiProductScreen> {
  late final Future<Product> product;
  @override
  void initState() {
    // TODO: implement initState
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
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  GradientHorizontalDivider(
                      gradientColor: FitstatGradient.fireDark),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Wartości odywcze ',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ApiProductQuantityText(
                      quantity: 'kcal',
                      value: snapshot.data!.productDetails.calories.toString()),
                  ApiProductQuantityText(
                      quantity: 'białko',
                      value: snapshot.data!.productDetails.protein.toString()),
                  ApiProductQuantityText(
                      quantity: 'tłuszcz',
                      value: snapshot.data!.productDetails.fat.toString()),
                  ApiProductQuantityText(
                      quantity: 'cukier',
                      value: snapshot.data!.productDetails.sugar.toString()),
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
}
