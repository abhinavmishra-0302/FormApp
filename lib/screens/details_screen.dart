import 'package:flutter/material.dart';
import 'package:intership/models/database_model.dart';
import 'package:intership/screens/update_screen.dart';
import 'package:intership/services/sqlite_service.dart';

class DetailsScreen extends StatelessWidget {
  late SQLiteService _sqLiteService;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Info>;

    Info? info = args["info"];

    _sqLiteService = SQLiteService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Card(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "${info!.name} ${info.lastName}",
                  style: const TextStyle(fontSize: 30, ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(margin: const EdgeInsets.only(top: 10, bottom: 10), child: Text("Mobile: ${info.mobile}", style: const TextStyle(fontSize: 20),)),
                  Container(margin: const EdgeInsets.only(top: 10, bottom: 10), child: Text("E-Mail: ${info.eMail}", style: const TextStyle(fontSize: 20),)),
                  Container(margin: const EdgeInsets.only(top: 10, bottom: 10), child: Text("Product: ${info.product}", style: const TextStyle(fontSize: 20),)),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                      return UpdateScreen(info: info);
                    }));
                  },
                  child: const Text("Update", style: TextStyle(fontSize: 23),))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: const Text("Delete this info?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            _sqLiteService.deleteItem(info);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text("Yes")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("No")),
                    ],
                  );
                });
          },
          child: const Icon(Icons.delete)),
    );
  }
}
