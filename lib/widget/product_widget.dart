import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list/model/products.dart';
import 'package:shoping_list/provider/shopping_list_provider.dart';

class ProductWidget extends StatefulWidget {
  final Products products;

  const ProductWidget({Key? key, required this.products}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  late bool val;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    val = widget.products.done;
    print("change ${widget.products.name}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
          title: Text(widget.products.name),
          value: widget.products.done, //val,
          onChanged: (value) {
            //setState(() {
            //val = value!;
            //});
            Provider.of<ShopingListProvider>(context, listen: false)
                .putProductChange(
                    widget.products.id, widget.products.name, value!);
          }),
    );
  }
}
