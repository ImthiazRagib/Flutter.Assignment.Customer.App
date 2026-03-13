import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:assignment_customer_app/features/atoms/heading_capsule.dart';
import 'package:assignment_customer_app/features/atoms/order_button.dart';
import 'package:assignment_customer_app/widgets/testimonials/testimonals.dart';
import 'package:flutter/material.dart';
import 'package:assignment_customer_app/widgets/stars.dart';
import 'package:provider/provider.dart';

class TestimonialSlider extends StatefulWidget {
  const TestimonialSlider({super.key});

  @override
  State<TestimonialSlider> createState() => _TestimonialSliderState();
}

class _TestimonialSliderState extends State<TestimonialSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Testimonals> testimonials = [
    Testimonals(
      name: 'John Doe',
      role: 'Software Engineer',
      imageUrl: 'https://via.placeholder.com/150',
      subjectName: 'Mathematics',
      review:
          "Working with this platform has made advanced mathematics far more approachable. The tutors break down complex concepts into clear steps and provide detailed feedback on my assignments.",
      date: DateTime.now(),
      isVerified: true,
      isFeatured: true,
      rating: 5,
    ),
    Testimonals(
      name: 'Jane Doe',
      role: 'Software Engineer',
      imageUrl: 'https://via.placeholder.com/150',
      subjectName: 'Mathematics',
      review:
          "The maths support has been really helpful, especially for exam preparation and structuring longer assignments. There is still room to cover more niche topics, but responses are always timely and professional.",
      date: DateTime.now(),
      isVerified: true,
      isFeatured: true,
      rating: 3.5,
    ),
    Testimonals(
      name: 'John Doe',
      role: 'Software Engineer',
      imageUrl: 'https://via.placeholder.com/150',
      subjectName: 'Economics',
      review:
          "The economics guidance is excellent — every session links theory to real-world examples, which has noticeably improved my grades. I now feel far more confident tackling data-driven case studies and long-form assignments.",
      date: DateTime.now(),
      isVerified: true,
      isFeatured: true,
      rating: 4.75,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page?.round() ?? 0;
      });
    });
  }

  void _next() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previous() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final backgroundColor = themeProvider.backgroundColor;
    final textColor = themeProvider.textColor;
    final accentColor = themeProvider.accentColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        HeadingCapsule(label: 'Testimonials'),
        SizedBox(height: 10),
        Text(
          'What our clients say about us',
          style: TextStyle(
            color: textColor,
            fontSize: 14,

            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: (MediaQuery.of(context).size.height * 0.3).clamp(
            190,
            double.infinity,
          ),
          child: PageView.builder(
            controller: _pageController,
            itemCount: testimonials.length,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (context, i) {
              final t = testimonials[i];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  color: backgroundColor,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: accentColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Text(
                                t.name.isNotEmpty
                                    ? t.name[0].toUpperCase()
                                    : '?',
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.name,
                                    style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Stars(rating: t.rating),
                                  const SizedBox(height: 4),
                                  Text(
                                    t.subjectName,
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: Text(
                            '“${t.review}”',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 14, height: 1.3),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "${t.date.day.toString().padLeft(2, '0')}/"
                          "${t.date.month.toString().padLeft(2, '0')}/"
                          "${t.date.year}",
                          style: TextStyle(
                            color: textColor.withValues(alpha: 0.7),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        // Dots indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(testimonials.length, (i) {
            final active = i == _currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: active ? 18 : 8,
              decoration: BoxDecoration(
                color: active ? Colors.black : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          }),
        ),

        SizedBox(height: 30),
        OrderButton(
          label: 'Order Now',
          width: MediaQuery.of(context).size.width * 2 / 3,
        ),
      ],
    );
  }
}
