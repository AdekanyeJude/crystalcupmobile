import 'package:flutter/material.dart';
import 'package:test_one/Screens/colors/colors.dart';
import 'package:test_one/Coffee_App/utils/buttons/authBtn.dart';
import 'package:test_one/Coffee_App/utils/container/getindicator.dart';
import 'package:test_one/Coffee_App/utils/sizedBox/heightSizedBox.dart';
import 'package:test_one/Coffee_App/utils/texts/opensanstext.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  int currentPage = 0;
  PageController pageController = new PageController(
    initialPage: 0,
    // keepPage: true,
  );
  String btnName = 'Next';
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          image: AssetImage(
            'assets/images/coffee-beans-dark-background.png',
          ),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: colorCodes.white.withOpacity(0.1),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: PageView(
                // shrinkWrap: true,
                controller: pageController,
                children: [
                  onboarding('Find your favorite coffee at\nKrystal Cup',
                      'We’re coffee shop, beer and wine bar,\n& event space for performing arts'),
                  onboarding('Coffee so good your taste\nbuds will love it',
                      'The best grain, the finest roast the\npowerful flavor'),
                ],
                onPageChanged: (value) => {
                  setCurrentPage(value),
                },
              ),
            ),
            heightSizedBox(40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => getIndicator(index, currentPage),
              ),
            ),
          ],
        ),
      ),
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {
      if (currentPage == 1) {
        btnName = "Get Started";
      } else {
        btnName = "Next";
      }
    });
  }

  Widget onboarding(title, descr) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // heightSizedBox(120.0),
          Image.asset(
            'assets/images/light krystal cup.png',
            height: 85,
            width: 70,
          ),
          Text(
            'KRYSTAL CUP',
            style: TextStyle(
              fontFamily: 'Rosarivo',
              fontSize: 22.0,
              fontWeight: FontWeight.w400,
              color: colorCodes.white,
              letterSpacing: 2,
            ),
          ),
          heightSizedBox(35.0),
          openSansText(
            title,
            30.0,
            FontWeight.w700,
            colorCodes.white,
          ),
          heightSizedBox(15.0),
          openSansText(
            descr,
            14.0,
            FontWeight.w400,
            colorCodes.neonWhite,
          ),
          heightSizedBox(60.0),
          authBtn(btnName, () {
            if (currentPage == 1) {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => Loginscreen()));
            } else {
              pageController.animateToPage(currentPage + 1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            }
          }),
        ],
      ),
    );
  }
}
