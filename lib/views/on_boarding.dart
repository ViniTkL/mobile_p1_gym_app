import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prova_p1_mobile/ui-components/brand_logo.dart';
import 'package:prova_p1_mobile/ui-components/button.dart';
import 'package:prova_p1_mobile/views/login.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<String> imagesBg = [
    'beautiful-young-sporty-woman-training-workout-gym 3.png',
    'on_board_a.png',
    'on_board_b.png',
    'on_board_c.png'
  ];

  int indexImage = 0;

  void nextImage() {
    setState(() {
      if (indexImage + 1 <= 3)
        indexImage++;
      else
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Durations.long4, () {
      setState(() {
        indexImage++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/${imagesBg[indexImage]}'),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              indexImage == 0 ? Logo() : Carousel(index: indexImage),
              SizedBox(
                height: 20,
              ),
              Button(
                  function: () => nextImage(),
                  text: indexImage == 3 ? 'Get Started' : 'Next',
                  isTransparent: true),
            ],
          )),
    ));
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('Welcome to',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: 25,
                color: const Color.fromRGBO(226, 241, 99, 1))),
        SizedBox(
          height: 20,
        ),
        BrandLogo(fontSize: 54),
      ],
    );
  }
}

class Carousel extends StatefulWidget {
  final int index;

  const Carousel({required this.index, super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<String> textMessage = [
    'Start your journey towards a more active lifestyle',
    'Find nutrition tips that fit your lifestyle',
    'A community for you, challenge yourself',
  ];

  List<String> iconCarousel = [
    'WorkOut.svg',
    'Nutrition.svg',
    'Community.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 170,
      decoration: BoxDecoration(color: Color.fromRGBO(179, 160, 255, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconCarousel[widget.index - 1]),
          SizedBox(
            height: 10,
          ),
          Text(
            textMessage[widget.index - 1],
            style: const TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
