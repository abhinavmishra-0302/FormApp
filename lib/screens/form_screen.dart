import 'package:flutter/material.dart';
import 'package:intership/models/database_model.dart';
import 'package:intership/services/sqlite_service.dart';

class FormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final lastNameController = TextEditingController();
    final mobileController = TextEditingController();
    final productController = TextEditingController();
    final emailController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    final sqliteService = SQLiteService();

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white12)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10),
                                child: const Text("Enter your first name:",
                                    style: TextStyle(fontSize: 20))),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent))),
                              textInputAction: TextInputAction.next,
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white12)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10),
                                child: const Text("Enter your last name:",
                                    style: TextStyle(fontSize: 20))),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: lastNameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your last name";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.date_range),
                                  labelText: "Last Name",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent))),
                              textInputAction: TextInputAction.next,
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white12)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10),
                                child: const Text("Enter your mobile:",
                                    style: TextStyle(fontSize: 20))),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: mobileController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your mobile";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.phone),
                                  labelText: "Mobile",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent))),
                              textInputAction: TextInputAction.next,
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white12)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10),
                                child: const Text("Enter your product:",
                                    style: TextStyle(fontSize: 20))),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: productController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a product";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.add_shopping_cart),
                                  labelText: "Product",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent))),
                              textInputAction: TextInputAction.next,
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white12)),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(10),
                                child: const Text("Enter your E-Mail:",
                                    style: TextStyle(fontSize: 20))),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter your E-Mail";
                                }
                                if (!value.contains("@")) {
                                  return "Please enter a valid E-Mail";
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  labelText: "E-Mail",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.blueAccent))),
                              textInputAction: TextInputAction.next,
                            )
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            sqliteService.insertItem(Info(
                                name: nameController.text,
                                lastName: lastNameController.text,
                                mobile: mobileController.text,
                                product: productController.text,
                                eMail: emailController.text));

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Submitted Successfully"),
                              behavior: SnackBarBehavior.floating,
                            ));
                          }
                        },
                        child: const Text("Submit")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
