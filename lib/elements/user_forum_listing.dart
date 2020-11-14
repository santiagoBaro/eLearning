import 'package:elearning/base_app/api_client.dart';
import 'package:elearning/data_types/foro_dataType.dart';
import 'package:flutter/material.dart';

import 'notification_card.dart';

class UserFormListing extends StatelessWidget {
  const UserFormListing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var client = ApiClient();
    return FutureBuilder<List<Forum>>(
      future: client.getForumByUser(),
      builder: (BuildContext context, AsyncSnapshot<List<Forum>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Text("no hay foros disponibles");
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return NotificationCard(foro: formRelleno);
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
