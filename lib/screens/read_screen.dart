import 'package:flutter/material.dart';
import 'package:intership/models/database_model.dart';
import 'package:intership/services/sqlite_service.dart';
import 'package:need_resume/need_resume.dart';

class ReadScreen extends StatefulWidget {
  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends ResumableState<ReadScreen> {
  late SQLiteService _sqliteService;

  List<Info> list = [];

  @override
  void initState() {
    super.initState();
    _sqliteService = SQLiteService();
    _sqliteService.initializeDB().whenComplete(() async {
      _refreshInfo();
    });
  }

  @override
  void onResume() {
    _refreshInfo();
  }

  void _refreshInfo() async {
    final data = await _sqliteService.getItems();
    setState(() {
      list = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Information"),
      ),
      body: RefreshIndicator(
        onRefresh: () { return Future.delayed(
          const Duration(seconds: 1),
            (){
              _refreshInfo();
            }
        ); },
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              splashColor: Colors.blueAccent,
              onTap: () {
                pushNamed(context, "/info_details", arguments: {
                  "info": list[index]
                });
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name: ${"${list[index].name} ${list[index].lastName}"}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Mobile: ${list[index].mobile}",
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: list.length,
        ),
      ),
    );
  }
}
