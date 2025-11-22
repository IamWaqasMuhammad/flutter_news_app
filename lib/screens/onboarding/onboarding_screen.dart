

import 'package:flutter_news_app/common_widgets/custom_image.dart';

import '../../app_barrels.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final OnboardingController controller = Get.find<OnboardingController>();

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const LoadingSpinner();
        }

        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.onboardingData.length,
                onPageChanged: (index) =>
                controller.currentIndex.value = index,
                itemBuilder: (context, index) {
                  final page = controller.onboardingData[index];
                  return AnimatedPage(
                    imagePath: page["image"]!,
                    title: page["title"]!,
                    subtitle: page["subtitle"]!,

                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Animated Dot Indicators
            Obx(
                  () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.onboardingData.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentIndex.value == index ? 16 : 8,
                    height: controller.currentIndex.value == index ? 16 : 8,
                    decoration: BoxDecoration(
                      color: controller.currentIndex.value == index
                          ? Colors.blue
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Next / Get Started Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Obx(
                        () => Text(
                      controller.isLastPage ? "Get Started" : "Next",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        );
      }),
    );
  }
}

/// Animated page content
class AnimatedPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const AnimatedPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Column(
        children: [
          CustomImage(
            path: imagePath,
            width: 584,
            height: 428,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
