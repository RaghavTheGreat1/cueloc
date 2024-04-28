import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/admob_constants.dart';

class AdmobServices {
  final AdmobAdUnitIdService adIds = AdmobAdUnitIdService();

  List<String> keywords = [
    // High-intent keywords
    'Buy', 'Shop', 'Purchase', 'Order', 'Discount', 'Deal', 'Offer', 'Sale',
    'Promo', 'Coupon', 'Best price',

    // Brand-specific keywords (example: popular Indian brands)
    'Flipkart', 'Amazon India', 'Myntra', 'BigBasket', 'Zomato', 'Swiggy',
    'Ola', 'Paytm', 'MakeMyTrip', 'BookMyShow',

    // Action-oriented keywords
    'Click', 'Download', 'Install', 'Try', 'Get', 'Sign up', 'Learn more',
    'Watch now', 'Play now', 'Start', 'Book now',

    // Location-based keywords (example: Indian cities and regions)
    'Mumbai', 'Delhi', 'Bangalore', 'Kolkata', 'Chennai', 'Hyderabad', 'Pune',
    'Ahmedabad', 'Jaipur', 'Goa',

    // Seasonal keywords (example: Indian festivals and seasons)
    'Diwali', 'Holi', 'Durga Puja', 'Navratri', 'Ganesh Chaturthi', 'Eid',
    'Republic Day', 'Independence Day', 'Summer vacation', 'Monsoon sale',

    // Trending keywords (example: current trending topics in India)
    'Cricket', 'Bollywood', 'IPL', 'COVID-19', 'Farmers protest',
    'Digital India', 'Startup India', 'Make in India', 'Aatmanirbhar Bharat',

    // Problem-solving keywords (example: common issues faced in India)
    'How to book train tickets',
    'Troubleshoot smartphone issues',
    'Fix Wi-Fi connection problem',
    'How to file income tax returns',
    'Solve Aadhaar card issues',

    // Entertainment keywords (example: popular Indian movies, TV shows, and celebrities)
    'Bahubali', 'Dilwale Dulhania Le Jayenge', 'Sacred Games', 'Mirzapur',
    'Virat Kohli', 'Deepika Padukone', 'Amitabh Bachchan', 'Alia Bhatt',
  ];

  Future<void> showTransitionInterstitialAd() async {
    await InterstitialAd.load(
      adUnitId: adIds.transitionInterstitialAdUnitId,
      request: AdRequest(
        keywords: keywords,
        nonPersonalizedAds: true,
      ),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (onAdLoaded) async {
          await onAdLoaded.show();
        },
        onAdFailedToLoad: (onAdFailedToLoad) {
          debugPrintStack(label: onAdFailedToLoad.toString());
        },
      ),
    );
  }
}
