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

class _OnBoardingState extends State<OnBoarding> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  bool showLogo = true;
  int _currentPageIndex = 0;

  List<String> imagesBg = [
    'beautiful-young-sporty-woman-training-workout-gym 3.png',
    'on_board_a.png',
    'on_board_b.png',
    'on_board_c.png'
  ];

  void nextImage() {
    setState(() {
      if (_currentPageIndex + 1 == 3)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
    Future.delayed(Durations.extralong4, () {
      setState(() {
        showLogo = false;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        showLogo
            ? Center(
                child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/beautiful-young-sporty-woman-training-workout-gym 3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Logo()),
              )
            : PageView(
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
                children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/on_board_a.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Carousel(index: _currentPageIndex),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/on_board_b.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Carousel(index: _currentPageIndex),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/on_board_c.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Carousel(index: _currentPageIndex),
                      ),
                    ),
                  ]),
        PageIndicator(
          currentPageIndex: _currentPageIndex,
          tabController: _tabController,
          onUpdateCurrentPageIndex: _handlePageViewChanged,
          handleNextPage: _nextPage,
        ),
      ],
    );
  }

  void _nextPage() {
    _pageViewController.animateToPage((_currentPageIndex + 1) % 3,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex % 3;
    setState(() {
      _currentPageIndex = currentPageIndex % 3;
    });
  }
}

// @override
// Widget build(BuildContext context) {
//   return

//   // Scaffold(
//   //     body: SingleChildScrollView(
//   //   child: Container(
//   //       height: MediaQuery.of(context).size.height,
//   //       decoration: BoxDecoration(
//   //         image: DecorationImage(
//   //             image: AssetImage('assets/${imagesBg[indexImage]}'),
//   //             fit: BoxFit.cover),
//   //       ),
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           indexImage == 0 ? Logo() : Carousel(index: indexImage),
//   //           SizedBox(
//   //             height: 20,
//   //           ),
//   //           indexImage > 0
//   //               ? Button(
//   //                   function: () => nextImage(),
//   //                   text: indexImage == 3 ? 'Get Started' : 'Next',
//   //                   isTransparent: true)
//   //               : Text(''),
//   //         ],
//   //       )),
//   // ));
// }

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
          SvgPicture.asset(iconCarousel[widget.index]),
          SizedBox(
            height: 10,
          ),
          Text(
            textMessage[widget.index],
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

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.handleNextPage,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final void Function() handleNextPage;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
          TextButton(onPressed: handleNextPage, child: Text("NEXT"))
        ],
      ),
    );
  }
}
