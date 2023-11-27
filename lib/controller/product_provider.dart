import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:greatindian/model/product_model.dart';
import 'package:greatindian/utilities/popup.dart';

class ProductProvider extends ChangeNotifier {
  //get product stream
  final Stream<QuerySnapshot> productsStream =
      FirebaseFirestore.instance.collection('products').snapshots();
  //add products
  Future<void> addProduct(Products productsModel) async {
    final product = FirebaseFirestore.instance.collection('products');
    final reference = product.doc();
    try {
      await reference.set({
        'category': productsModel.category,
        'description': productsModel.description,
        'id': reference.id,
        'name': productsModel.productName,
        'price': productsModel.price,
        'subname': productsModel.subname,
        'quantity': productsModel.quantity,
        'color': productsModel.color,
      }).then((value) {
        notifyListeners();
        ToastClass.showToast('Product added successfully');
      });
    } catch (error) {
      log("Failed to add product: $error");
    }
  }

  //delete products
  Future<void> deleteProduct(String id, BuildContext context) {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return products.doc(id).delete().then((value) {
      log("Product Deleted");
      ToastClass.showToast('Product Deleted successfully');
    }).catchError((error) {
      log("Failed to delete product: $error");
      ToastClass.showToast('Failed to Delete Product');
    });
  }

  //update products
  Future<void> updateProduct(
      {required Products productsModel,
      required String id,
      required BuildContext context}) async {
    final products = FirebaseFirestore.instance.collection('products');
    final productRef = products.doc(id);

    try {
      await productRef.update({
        'category': productsModel.category,
        'description': productsModel.description,
        'name': productsModel.productName,
        'price': productsModel.price,
        'subname': productsModel.subname,
        'quantity': productsModel.quantity,
        'color': productsModel.color,
      }).then((value) {
        ToastClass.showToast('Product Updated');
        notifyListeners();

        Navigator.pop(context);
      });
      log("Product Updated");
    } catch (error) {
      ToastClass.showToast('Failed to update product');
      log("Failed to update product: $error");
    }
  }
}
