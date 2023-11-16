import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/product_model.dart';
// import 'package:test_one/Screens/Widgets/feedsWidget.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Widgets/feeds_grid.dart';
import 'package:test_one/Screens/colors/colors.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Widgets/saleWidget.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/home/category_screen.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/home/feeds_screen.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/home/users_screen.dart';
import 'package:test_one/Coffee_App/utils/textField.dart/searchtextfield.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/services/api_handler.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController textController = TextEditingController();
  // List<ProductsModel> productsList = [];
  void intitState() {
    textController;
    super.initState();
  }

  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // @override
  // void didChangeDependencies() {
  //   getProducts();
  //   super.didChangeDependencies();
  // }

  // Future<void> getProducts() async {
  //   productsList = await APIHandler.getAllProduct();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          // backgroundColor: colorCodes.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: colorCodes.whiteSmoke,
            elevation: 2.0,
            title: Text(
              'Home',
              style: TextStyle(color: colorCodes.charcoal),
            ),
            leading: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const CategoriesScreen(),
                    ));
              },
              child: Icon(
                IconlyBold.category,
                color: colorCodes.iconcolor,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const UsersScreen(),
                    ),
                  );
                },
                child: Icon(
                  IconlyBold.user_3,
                  color: colorCodes.iconcolor,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                textField(textController, 'Search', ''),
                SizedBox(
                  height: 18,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.25,
                            child: Swiper(
                              autoplay: true,
                              pagination: const SwiperPagination(
                                alignment: Alignment.bottomCenter,
                                builder: DotSwiperPaginationBuilder(
                                  activeColor: Colors.red,
                                  color: Colors.white,
                                ),
                              ),
                              // control: const SwiperControl(),
                              itemCount: 3,
                              itemBuilder: (context, index) =>
                                  const SaleWidget(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                
                                Text(
                                  'Latest Product',
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: colorCodes.background),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: FeedsScreen(),
                                            type: PageTransitionType.fade));
                                  },
                                  child: Icon(IconlyBold.arrow_right_2,
                                      color: colorCodes.iconcolor),
                                )
                              ],
                            ),
                          ),
                          // productsList.isEmpty
                          //     ? Container()
                          //     : FeedsGridWidget(
                          //         productsList: productsList,
                          //       )
                          FutureBuilder<List<ProductsModel>>(
                              future: APIHandler.getAllProduct(
                                  limit: "3".toString()),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(
                                      child: Text('Error: ${snapshot.error}'));
                                } else if (snapshot.data == null) {
                                  return Center(
                                      child: Text(
                                          'No products has been added yet'));
                                }

                                return FeedsGridWidget(
                                    productsList: snapshot.data!);
                              })
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
