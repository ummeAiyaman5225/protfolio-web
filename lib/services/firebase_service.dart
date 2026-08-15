import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../core/constants/firebase_options.dart';

class FirebaseService {
  /// Ensures Firebase is initialized before accessing Firestore.
  static Future<void> _ensureFirebaseInitialized() async {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
  }

  /// Saves a contact message to the 'portfolio_messages' collection in Firestore.
  static Future<DocumentReference<Map<String, dynamic>>> sendContactMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    await _ensureFirebaseInitialized();

    return await FirebaseFirestore.instance.collection('portfolio_messages').add({
      'name': name.trim(),
      'email': email.trim(),
      'subject': subject.trim(),
      'message': message.trim(),
      'createdAt': FieldValue.serverTimestamp(),
      'status': 'unread',
      'source': 'portfolio',
    });
  }

  /// Updates the 'emailSent' field of a specific message document.
  static Future<void> updateEmailStatus({
    required String docId,
    required bool emailSent,
  }) async {
    await _ensureFirebaseInitialized();
    await FirebaseFirestore.instance
        .collection('portfolio_messages')
        .doc(docId)
        .update({
      'emailSent': emailSent,
    });
  }
}
