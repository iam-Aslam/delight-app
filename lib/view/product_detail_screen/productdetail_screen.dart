import 'package:flutter/material.dart';
import 'package:greatindian/controller/product_provider.dart';
import 'package:greatindian/model/product_model.dart';
import 'package:greatindian/view/add_product_screen/widgets/textfield_widget.dart';
import 'package:greatindian/view/qrcode_screen.dart/qrcode_screen.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  final ValueNotifier<bool> editNotifier = ValueNotifier(true);

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

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            elevation: 0,
            foregroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QrScreen(
                          productId: data['id'],
                        ),
                      ));
                },
                icon: const Icon(Icons.qr_code_scanner_sharp),
              )
            ],
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
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
                ValueListenableBuilder(
                  valueListenable: editNotifier,
                  builder: (context, editOrUpdate, child) => Column(
                    children: [
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Product Name",
                        textString: data["name"] ?? 'No name',
                        textController: nameController,
                        enableTextField: !editOrUpdate,
                        // enableTextField: false,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "SubName",
                        enableTextField: !editOrUpdate,
                        textString: data["subname"] ?? 'No Subname',
                        textController: subnameController,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Category",
                        enableTextField: !editOrUpdate,
                        textString: data["category"] ?? 'No Category',
                        textController: categoryController,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Quantity",
                        enableTextField: !editOrUpdate,
                        textString: data["quantity"].toString(),
                        textController: quantityController,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Price",
                        enableTextField: !editOrUpdate,
                        textString: data["price"].toString(),
                        textController: priceController,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Color",
                        enableTextField: !editOrUpdate,
                        textString: data["color"] ?? 'No Color',
                        textController: colorController,
                      ),
                      DetailsTextFieldWidget(
                        size: size,
                        fieldName: "Description",
                        enableTextField: !editOrUpdate,
                        textString: data["description"] ??
                            'No Description Available Now',
                        textController: descriptionController,
                        height: 150,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ValueListenableBuilder(
              valueListenable: editNotifier,
              builder: (context, editOrUpdate, child) => TextButton(
                onPressed: () {
                  editNotifier.value = !editNotifier.value;
                  editOrUpdate
                      ? null
                      : productProvider.updateProduct(
                          context: context,
                          id: data['id'],
                          productsModel: Products(
                            subname: subnameController.text,
                            category: categoryController.text,
                            quantity: int.parse(quantityController.text),
                            price: int.parse(priceController.text),
                            color: colorController.text,
                            description: descriptionController.text,
                            productName: nameController.text,
                          ),
                        );
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
                child: Text(
                  editOrUpdate ? '   Edit   ' : 'Update',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
