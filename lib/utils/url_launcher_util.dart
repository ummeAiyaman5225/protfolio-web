import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  static Future<void> launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  static Future<void> makePhoneCall(String phone) async {
    final Uri url = Uri.parse('tel:$phone');
    if (!await launchUrl(url)) {
      throw Exception('Could not call $phone');
    }
  }

  static Future<void> sendEmail(String email) async {
    final Uri url = Uri.parse('mailto:$email');
    if (!await launchUrl(url)) {
      throw Exception('Could not send email to $email');
    }
  }
}
