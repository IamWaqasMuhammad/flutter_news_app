

import '../../app_barrels.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentIndex = 0.obs;
  final isLoading = true.obs;
  final hasSeenOnboarding = false.obs;
  late SharedPreferences prefs;

  // List of onboarding pages (title, subtitle, image path)
  final List<Map<String, String>> onboardingData = [
    {
      "title": AppStringsAssets.onboardTitle1,
      "subtitle": AppStringsAssets.onboardSubTitle1,
      "image": AppImagesAssets.onboardingImage1,
    },
    {
      "title": AppStringsAssets.onboardTitle2,
      "subtitle": AppStringsAssets.onboardSubTitle2,
      "image": AppImagesAssets.onboardingImage2,
    },
    {
      "title": AppStringsAssets.onboardTitle3,
      "subtitle": AppStringsAssets.onboardSubTitle3,
      "image": AppImagesAssets.onboardingImage3,
    },
  ];


  @override
  void onInit() {
    super.onInit();
    _loadOnboardingStatus();
  }

  Future<void> _loadOnboardingStatus() async {
    prefs = await SharedPreferences.getInstance();
    hasSeenOnboarding.value = prefs.getBool('onboarding_done') ?? false;
    isLoading.value = false;
  }

  bool get isLastPage => currentIndex.value == onboardingData.length - 1;

  void nextPage() {
    if (isLastPage) {
      _saveOnboardingStatus();
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _saveOnboardingStatus() async {
    await prefs.setBool('onboarding_done', true);
    hasSeenOnboarding.value = true;
  }
}
