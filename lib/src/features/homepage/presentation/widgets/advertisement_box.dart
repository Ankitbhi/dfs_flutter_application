import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdvertisementBox extends StatefulWidget {
  const AdvertisementBox({super.key});

  @override
  State<AdvertisementBox> createState() => _AdvertisementBoxState();
}

class _AdvertisementBoxState extends State<AdvertisementBox> {
  int _currentIndex = 0;
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    List<Widget> itemList = [
      Column(children: [
        const Text('Your Profile is only 25% Complete',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
        SizedBox(
          width: MediaQuery.of(context).size.width * .7,
          child: const Text(
              'To apply for government schemes,please complete your profile.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        )
      ]),
      const Text('asa'),
      const Text('adssfd')
    ];
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          CarouselSlider(
            items: itemList,
            carouselController: _controller,
            options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                initialPage: 0,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _controller.previousPage(),
                icon: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_back_ios_rounded),
                ),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: itemList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              IconButton(
                onPressed: () => _controller.nextPage(),
                icon: Container(
                  width: 15.0,
                  height: 15.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                ),
              ),
            ],
          ),
          // CarouselSlider(
          //     items: [
          //       Column(children: [
          //         const Text('Your Profile is only 25% Complete',
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          //         SizedBox(
          //           width: MediaQuery.of(context).size.width * .7,
          //           child: const Text(
          //               'To apply for government schemes,please complete your profile.',
          //               style: TextStyle(
          //                   fontSize: 14, fontWeight: FontWeight.w400)),
          //         )
          //       ]),
          //       Text('asa'),
          //       Text('adssfd')
          //     ],
          //     options: CarouselOptions(
          //       height:
          //           MediaQuery.of(context).size.height, // Full screen height.
          //       autoPlay: true, // Enable auto-play.
          //       enlargeCenterPage: false, // Do not enlarge the center item.
          //       enableInfiniteScroll: true, // Enable infinite scrolling.
          //       initialPage: 0, // Start at the first item.
          //       viewportFraction: 0.8, // Show only one item with 80% width.
          //       aspectRatio: 16 / 9, // Set aspect ratio as needed.
          //       autoPlayInterval:
          //           Duration(seconds: 2), // Set auto-play interval.
          //       autoPlayCurve: Curves.fastOutSlowIn, // Specify animation curve.
          //       autoPlayAnimationDuration:
          //           Duration(milliseconds: 800), // Set animation duration.
          //     )
          //     // Custom dots for indicator.

          //     ),
        ]),
      ),
    );
  }
}
