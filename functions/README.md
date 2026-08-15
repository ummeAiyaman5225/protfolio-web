# Firebase Cloud Functions — Contact Email Notifications

This directory contains the Firebase Cloud Function `sendContactNotification` that triggers automatically whenever a new contact message is written to the `portfolio_messages` collection in Firestore.

## Function Features
- Triggers on Firestore document creation in `portfolio_messages/{messageId}`.
- Sends an email to `mahekkureshi5225@gmail.com` with message details (Name, Email, Subject, Message).
- Sets `Reply-To` to the visitor's email address so replying to the email goes directly to the sender.
- Keeps all SMTP API keys and passwords securely server-side.

## Setup & Deployment Instructions

1. Install dependencies:
   ```bash
   cd functions
   npm install
   ```

2. Configure SMTP credentials via Firebase config CLI:
   ```bash
   firebase functions:config:set smtp.email="your_gmail_address@gmail.com" smtp.password="your_gmail_app_password" destination.email="mahekkureshi5225@gmail.com"
   ```

3. Deploy Cloud Functions:
   ```bash
   firebase deploy --only functions
   ```
