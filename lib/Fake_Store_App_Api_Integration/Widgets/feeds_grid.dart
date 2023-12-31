import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/product_model.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Widgets/feedsWidget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsList})
      : super(key: key);
  final List<ProductsModel> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider.value(value: productsList[index],child: FeedsWidget());
        });
  }
}
