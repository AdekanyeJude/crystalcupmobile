import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/product_model.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Widgets/feedsWidget.dart';
import 'package:test_one/Screens/colors/colors.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/services/api_handler.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final ScrollController scrollController = ScrollController();
  List<ProductsModel> productsList = [];
  int limit = 10;
  bool isLoading = false;
  bool isLimit = false;
  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        limit += 10;
        if (limit == 200) {
          isLimit = true;
        }
        log("limit $limit");
        await getProducts();
        isLoading = false;
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> getProducts() async {
    productsList = await APIHandler.getAllProduct(limit: limit.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorCodes.whiteSmoke,
        elevation: 2.0,
        title: Text(
          'All Products',
          style: TextStyle(color: colorCodes.charcoal),
        ),
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
        // actions: [
        //   InkWell(
        //     onTap: () {},
        //     child: Icon(
        //       IconlyBold.user_3,
        //       color: colorCodes.iconcolor,
        //     ),
        //   ),
        // ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: productsList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  children: [
                    GridView.builder(
                        // controller: scrollController,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          childAspectRatio: 0.6,
                        ),
                        itemCount: productsList.length,
                        itemBuilder: (context, index) {
                          return ChangeNotifierProvider.value(
                              value: productsList[index], child: FeedsWidget());
                        }),
                    if (isLoading)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                  ],
                ),
              ),
      ),
    );
  }
}
