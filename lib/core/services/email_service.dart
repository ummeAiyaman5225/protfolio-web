import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../config/emailjs_config.dart';

class EmailService {
  /// Sends a contact email via the official EmailJS REST API.
  static Future<bool> sendContactEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    try {
      final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

      final payload = {
        'service_id': EmailJsConfig.serviceId,
        'template_id': EmailJsConfig.templateId,
        'user_id': EmailJsConfig.publicKey,
        'template_params': {
          'name': name.trim(),
          'email': email.trim(),
          'subject': subject.trim(),
          'message': message.trim(),
          'time': DateTime.now().toLocal().toString(),
        },
      };

      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        debugPrint('EmailJS Success: ${response.body}');
        return true;
      } else {
        debugPrint('EmailJS REST API error - status: ${response.statusCode}, body: ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('Unexpected error sending email: $e');
      return false;
    }
  }
}
