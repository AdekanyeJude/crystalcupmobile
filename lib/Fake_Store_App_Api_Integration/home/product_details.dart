import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/product_model.dart';
import 'package:test_one/Screens/colors/colors.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/services/api_handler.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.id});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
  final String id;
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductsModel? productsModel;
  Future<void> getProductInfo() async {
    try {
      productsModel = await APIHandler.getProductById(id: widget.id);
    } catch (error) {
      print("error $error");
    }
    setState(() {});
  }

  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: productsModel == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    const BackButton(),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productsModel!.category!.name.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 3,
                                  child: Text(
                                    productsModel!.title.toString(),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  )),
                              Flexible(
                                flex: 1,
                                child: RichText(
                                  text: TextSpan(
                                      text: "\$",
                                      style: const TextStyle(
                                        color: Color.fromRGBO(33, 150, 243, 1),
                                      ),
                                      children: [
                                        TextSpan(
                                            text:
                                                productsModel!.price.toString(),
                                            style: TextStyle(
                                                color: colorCodes.charcoal,
                                                fontWeight: FontWeight.bold)),
                                      ]),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.4,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return FancyShimmerImage(
                            width: double.infinity,
                            imageUrl: productsModel!.images![index].toString(),
                            boxFit: BoxFit.fill,
                          );
                        },

                        autoplay: true,
                        itemCount: 3,
                        pagination: const SwiperPagination(
                          alignment: Alignment.bottomCenter,
                          builder: DotSwiperPaginationBuilder(
                            color: Colors.white,
                            activeColor: Colors.red,
                          ),
                        ),
                        // control: const SwiperControl(),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            productsModel!.description.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
