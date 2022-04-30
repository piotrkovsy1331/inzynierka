import 'package:flutter/material.dart';
import 'package:inzynierka/models/product.dart';
import 'package:inzynierka/ui/meal_details_screen/widgets/product_expandable_body.dart';
import 'package:expandable/expandable.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({
    Key? key,
    required this.product,
    required this.gradientColor,
    required this.onDeleteTapped,
    required this.index,
  }) : super(key: key);
  final Product product;
  final List<Color> gradientColor;
  final Function(int) onDeleteTapped;
  final int index;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  ExpandableController controller =
      ExpandableController(initialExpanded: false);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: _boxDecoration(),
        foregroundDecoration: _boxDecoration(),
        child: Expandable(
          controller: controller,
          collapsed: NoteExpandableBody(
            gradientColor: widget.gradientColor,
            isCollapsed: true,
            product: widget.product,
            onProductTapped: _onProductTapped,
          ),
          expanded: NoteExpandableBody(
            gradientColor: widget.gradientColor,
            isCollapsed: false,
            product: widget.product,
            onArrowTapped: _onArrowTapped,
            onEditTapped: _onEditTapped,
            onDeleteTapped: () {
              widget.onDeleteTapped(widget.index);
            },
            onProductTapped: _onProductTapped,
          ),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).cardColor),
        borderRadius: const BorderRadius.all(Radius.circular(5)));
  }

  void _onArrowTapped() {
    setState(() {
      controller.expanded = false;
    });
  }

  void _onProductTapped() {
    setState(() {
      controller.expanded = true;
    });
  }

  void _onEditTapped() {}
}
