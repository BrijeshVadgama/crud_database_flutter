import 'package:crud_database/crud/services/database_connection.dart';
import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Connection'),
      ),
      body: FutureBuilder(
        future: MyDatabase().initDatabase(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // MyDatabase().insertUser('abc', 'rjk');
            return Center(
              child: Text(
                'Connected With Database',
                style: TextStyle(fontSize: 25, color: Colors.blueAccent),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Cannot Connected With Database',
                style: TextStyle(fontSize: 25, color: Colors.blueAccent),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
