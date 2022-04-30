import 'package:flutter/material.dart';
import 'package:inzynierka/ui/meal_details_screen/widgets/product_description.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../globals/global_widgets/gradient_horizontal_divider.dart';
import '../../../models/product.dart';

class NoteExpandableBody extends StatelessWidget {
  const NoteExpandableBody({
    Key? key,
    required this.gradientColor,
    required this.product,
    required this.isCollapsed,
    this.onArrowTapped,
    this.onEditTapped,
    this.onProductTapped,
    this.onDeleteTapped,
  }) : super(key: key);
  final List<Color> gradientColor;
  final Product product;
  final bool isCollapsed;
  final VoidCallback? onEditTapped;
  final VoidCallback? onProductTapped;
  final VoidCallback? onDeleteTapped;
  final VoidCallback? onArrowTapped;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                clipBehavior: Clip.antiAlias,
                alignment: Alignment.center,
                decoration: _boxDecorationGradient(),
                height: 70,
                width: 70,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: _boxDecoration(),
                  height: 65,
                  width: 65,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: product.photoUrl ??
                          "https://cdn.pixabay.com/photo/2014/12/21/23/39/bananas-575773_1280.png",
                      fit: BoxFit.cover,
                    ),
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
                        product.name,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      GradientHorizontalDivider(gradientColor: gradientColor)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(65, 0, 10, 0),
          child: Column(
            children: [
              InkWell(
                onTap: onProductTapped,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ProductDescription(
                            product: product, isCollapsed: isCollapsed),
                      ),
                      if (isCollapsed)
                        Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.keyboard_arrow_down,
                              color: Theme.of(context).cardColor,
                            )),
                    ]),
              ),
            ],
          ),
        ),
        if (!isCollapsed) ...[
          Divider(color: Theme.of(context).cardColor, height: 1, thickness: 1),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: onEditTapped,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Theme.of(context).cardColor,
                            size: 29,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Center(
                              child: Text(
                            'Edytuj',
                            style: Theme.of(context).textTheme.headline4,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Theme.of(context).cardColor,
                  thickness: 1,
                  width: 1,
                ),
                Expanded(
                  child: InkWell(
                    onTap: onDeleteTapped,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: Theme.of(context).cardColor,
                            size: 29,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Center(
                              child: Text(
                            'Usuń',
                            style: Theme.of(context).textTheme.headline4,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                VerticalDivider(
                  color: Theme.of(context).cardColor,
                  thickness: 1,
                  width: 1,
                ),
                Expanded(
                  child: InkWell(
                    onTap: onArrowTapped,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.keyboard_arrow_up,
                        color: Theme.of(context).cardColor,
                        size: 29,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ]
      ],
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        // gradient: LinearGradient(colors: gradientColor),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(width: 2, color: Colors.grey));
  }

  BoxDecoration _boxDecorationGradient() {
    return BoxDecoration(
      gradient: LinearGradient(colors: gradientColor),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
