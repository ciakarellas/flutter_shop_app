import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoping_list/provider/shopping_list_provider.dart';

class AddProductToListForm extends StatefulWidget {
  const AddProductToListForm({Key? key}) : super(key: key);

  @override
  State<AddProductToListForm> createState() => _AddProductToListFormState();
}

class _AddProductToListFormState extends State<AddProductToListForm> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return ChangeNotifierProvider<ShopingListProvider>(
      create: (_) => ShopingListProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child:
                Consumer<ShopingListProvider>(builder: (context, model, child) {
              return Column(
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("wroć")),
                  TextField(
                    autofocus: true,
                    controller: _controller,
                  ),
                  ElevatedButton(
                      onPressed: () => print("object"),
                      child: const Text("dodaj")),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
