// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:greatindian/controller/product_provider.dart';
import 'package:greatindian/model/product_model.dart';
import 'package:provider/provider.dart';

import 'widgets/textfield_widget.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subnameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_left)),
        title: const Text(
          "Product Details",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Product Name",
              textController: nameController,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Sub Name",
              textController: subnameController,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Category",
              textController: categoryController,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Quantity",
              textController: quantityController,
              numPad: true,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Price",
              textController: priceController,
              numPad: true,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Color",
              textController: colorController,
            ),
            DetailsTextFieldWidget(
              size: size,
              fieldName: "Description",
              textController: descriptionController,
              height: 160,
              maxLines: 4,
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextButton(
                onPressed: () async {
                  await productProvider.addProduct(
                    Products(
                      productName: nameController.text.trim(),
                      subname: subnameController.text.trim(),
                      category: categoryController.text.trim(),
                      quantity: int.parse(quantityController.text.trim()),
                      price: int.parse(priceController.text.trim()),
                      color: colorController.text.trim(),
                      description: descriptionController.text.trim(),
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(
                          horizontal: size.width * 0.32, vertical: 20)),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
