import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/users_model.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Widgets/users_widget.dart';
import 'package:test_one/Screens/colors/colors.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/services/api_handler.dart';


class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: colorCodes.whiteSmoke,
            elevation: 2.0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                IconlyBold.arrow_left_3,
                color: colorCodes.iconcolor,
                size: 29,
              ),
            ),
            title: Text(
              "USers",
              style: TextStyle(color: colorCodes.charcoal),
            )),
        body: FutureBuilder<List<UsersModel>>(
            future: APIHandler.getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.data == null) {
                return Center(child: Text('No user has been added yet'));
              }

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: snapshot.data![index],
                      child: UsersWidget(),
                    );
                  });
            }));
  }
}
