import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/categories_model.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Widgets/category_widget.dart';
import 'package:test_one/Screens/colors/colors.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/services/api_handler.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

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
              "Categories",
              style: TextStyle(color: colorCodes.charcoal),
            )),
        body: FutureBuilder<List<CategoriesModel>>(
            future: APIHandler.getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.data == null) {
                return Center(child: Text('No products has been added yet'));
              }

              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0,
                    childAspectRatio: 1.2,
                  ),
                  itemBuilder: (ctx, index) {
                    return ChangeNotifierProvider.value(
                        value: snapshot.data![index],
                        child: const CategoryWidget());
                  });
            }));
  }
}
