import 'package:flutter/material.dart';
import 'package:inzynierka/models/api_product.dart';
import 'package:auto_route/auto_route.dart';
import 'package:inzynierka/routes/router.gr.dart';
import 'package:transparent_image/transparent_image.dart';

class ApiProductTile extends StatelessWidget {
  const ApiProductTile({
    Key? key,
    required ApiProduct apiProduct,
  })  : _apiProduct = apiProduct,
        super(key: key);

  final ApiProduct _apiProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        decoration: _boxDecoration(),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              alignment: Alignment.center,
              height: 65,
              width: 65,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: _apiProduct.photo ??
                      "https://cdn.pixabay.com/photo/2014/12/21/23/39/bananas-575773_1280.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      _apiProduct.foodName!,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
                onTap: () => onAddTapped(context, _apiProduct.foodName!),
                child: const SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.add_circle,
                    size: 30,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        // gradient: LinearGradient(colors: gradientColor),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(width: 2, color: Colors.grey));
  }

  void onAddTapped(BuildContext context, String foodName) {
    AutoRouter.of(context).push(ApiProductRoute(foodName: foodName));
  }
}
