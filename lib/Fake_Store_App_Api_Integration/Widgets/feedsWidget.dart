import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/Models/product_model.dart';
import 'package:test_one/Screens/colors/colors.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:test_one/Fake_Store_App_Api_Integration/home/product_details.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({
    super.key,
  });

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  @override
  Widget build(BuildContext context) {
    final productsModelProvider = Provider.of<ProductsModel>(context);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: ProductDetails(
                  id: productsModelProvider.id.toString(),
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: RichText(
                            text: TextSpan(
                                text: '\$',
                                style: const TextStyle(
                                  color: Color.fromRGBO(33, 150, 243, 1),
                                ),
                                children: <TextSpan>[
                          TextSpan(
                            text: "${productsModelProvider.price}",
                            style: TextStyle(
                                color: colorCodes.charcoal,
                                fontWeight: FontWeight.w600),
                          ),
                        ]))),
                    Icon(
                      IconlyBold.heart,
                      color: colorCodes.iconcolor,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  height: size.height * 0.2,
                  width: double.infinity,
                  errorWidget: const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                    size: 28,
                  ),
                  imageUrl: productsModelProvider.images![0],
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  productsModelProvider.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              )
            ],
          ),
        ),
      ),
    );
  }
}
