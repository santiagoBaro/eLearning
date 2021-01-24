import 'package:pushnotifications/base_app/api_client.dart';
import 'package:pushnotifications/data_types/foro_dataType.dart';
import 'package:flutter/material.dart';
import 'package:pushnotifications/pages/shared_elements/notification_card.dart';

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
            //* EMPTY LIUST
            return Text("No hay foros disponibles");
          } else {
            //* FORUM LIST
            ListView listMessages = ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return NotificationCard(foro: snapshot.data[index]);
              },
            );
            return listMessages;
          }
        } else if (snapshot.hasError) {
          //* ERROR
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
