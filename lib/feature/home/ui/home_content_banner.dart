import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeContentBanner extends StatefulWidget {
  const HomeContentBanner({super.key});

  @override
  State<HomeContentBanner> createState() => _HomeContentBannerState();
}

class _HomeContentBannerState extends State<HomeContentBanner> {
  final PageController _controller = PageController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Image.asset('images/banner1.jpg', fit: BoxFit.cover),
              Image.asset('images/banner2.jpg', fit: BoxFit.cover),
              Image.asset('images/banner1.jpg', fit: BoxFit.cover),
            ],
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Text(
              '당신의 책상을 꾸며보세요',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const WormEffect(
                  dotHeight: 6,
                  dotWidth: 6,
                  dotColor: Colors.white30,
                  activeDotColor: Colors.white,
                ),
                onDotClicked: (i) => _controller.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
