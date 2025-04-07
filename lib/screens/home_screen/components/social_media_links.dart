import 'package:url_launcher/url_launcher.dart';

class SocialMediaHelper {
  // Facebook
  static Future<void> openFacebook() async {
    const url = 'fb://profile/100095909764545';
    const webUrl = 'https://www.facebook.com/Shoaib913';
    await _launchUrl(url, webUrl);
  }

  // WhatsApp
  static Future<void> openWhatsApp() async {
    const url = 'whatsapp://send?phone=+923001234567';
    const webUrl = 'https://wa.me/+923001234567';
    await _launchUrl(url, webUrl);
  }

  // TikTok
  static Future<void> openTikTok() async {
    const url = 'snssdk1233://user/profile/12345678';
    const webUrl = 'https://www.tiktok.com/@yourusername';
    await _launchUrl(url, webUrl);
  }

  // Instagram
  static Future<void> openInstagram() async {
    const url = 'instagram://user?username=yourusername';
    const webUrl = 'https://www.instagram.com/yourusername';
    await _launchUrl(url, webUrl);
  }

  // YouTube
  static Future<void> openYouTube() async {
    const url = 'youtube://www.youtube.com/channel/UC123456789';
    const webUrl = 'https://www.youtube.com/c/yourchannel';
    await _launchUrl(url, webUrl);
  }

  // Common function to launch URLs
  static Future<void> _launchUrl(String appUrl, String webUrl) async {
    if (await canLaunchUrl(Uri.parse(appUrl))) {
      await launchUrl(Uri.parse(appUrl));
    } else {
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }
}
