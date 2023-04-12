import 'package:flutter/material.dart';

import '../models/database_model.dart';
import '../services/sqlite_service.dart';

class UpdateScreen extends StatelessWidget {
  final Info info;

  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final mobileController = TextEditingController();
  final productController = TextEditingController();
  final emailController = TextEditingController();

  late SQLiteService _sqliteService;

  UpdateScreen({required this.info}) {
    fnameController.text = info.name;
    lnameController.text = info.lastName;
    mobileController.text = info.mobile;
    productController.text = info.product;
    emailController.text = info.eMail;

    _sqliteService = SQLiteService();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Info"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: fnameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Enter first name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: lnameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Enter last name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your last name";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: mobileController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Enter mobile",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your mobile";
                      }
                      if (value.length != 10) {
                        return "Enter valid mobile";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: productController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Enter product",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter a product";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        labelText: "Enter E-Mail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.blueAccent))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your E-Mail";
                      }
                      if (!value.contains("@")) {
                        return "Please enter a valid E-Mail";
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),
                ),
                TextButton(
                  child: const Text(
                    "Update Info",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Info newInfo = Info(
                          name: fnameController.text,
                          lastName: lnameController.text,
                          mobile: mobileController.text,
                          eMail: emailController.text,
                          product: productController.text);

                      _sqliteService.updateItem(newInfo, info.name, info.eMail);

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Updated Sucessfully")));

                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
