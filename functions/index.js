const functions = require("firebase-functions");
const admin = require("firebase-admin");
const nodemailer = require("nodemailer");

admin.initializeApp();

// Configurable destination email & SMTP credentials
// You can set secrets/environment variables in Firebase:
// firebase functions:config:set smtp.email="your-email@gmail.com" smtp.password="your-app-password" destination.email="mahekkureshi5225@gmail.com"
const DESTINATION_EMAIL = process.env.DESTINATION_EMAIL || functions.config().destination?.email || "mahekkureshi5225@gmail.com";
const SMTP_EMAIL = process.env.SMTP_EMAIL || functions.config().smtp?.email;
const SMTP_PASSWORD = process.env.SMTP_PASSWORD || functions.config().smtp?.password;

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: SMTP_EMAIL,
    pass: SMTP_PASSWORD,
  },
});

exports.sendContactNotification = functions.firestore
  .document("portfolio_messages/{messageId}")
  .onCreate(async (snap, context) => {
    const data = snap.data();
    if (!data) return null;

    const { name, email, subject, message, source } = data;

    const mailOptions = {
      from: `Portfolio Contact <${SMTP_EMAIL || DESTINATION_EMAIL}>`,
      to: DESTINATION_EMAIL,
      replyTo: email, // Directly reply to visitor's email address
      subject: `New Portfolio Contact — ${name}`,
      text: `
New message received from portfolio website!

Name: ${name}
Email: ${email}
Subject: ${subject}

Message:
${message}

Source:
${source || "Portfolio Website"}
      `,
      html: `
        <div style="font-family: Arial, sans-serif; padding: 20px; color: #333; line-height: 1.6;">
          <h2 style="color: #0284c7; border-bottom: 2px solid #0284c7; padding-bottom: 8px;">New Portfolio Contact Message</h2>
          <p><strong>Name:</strong> ${name}</p>
          <p><strong>Email:</strong> <a href="mailto:${email}">${email}</a></p>
          <p><strong>Subject:</strong> ${subject}</p>
          <div style="background: #f8fafc; padding: 16px; border-left: 4px solid #0284c7; margin: 20px 0; border-radius: 4px;">
            <p style="margin: 0; white-space: pre-wrap;">${message}</p>
          </div>
          <p style="font-size: 12px; color: #64748b;">Source: ${source || "Portfolio Website"}</p>
        </div>
      `,
    };

    try {
      if (!SMTP_EMAIL || !SMTP_PASSWORD) {
        console.warn(
          "SMTP credentials not configured. Please set SMTP_EMAIL and SMTP_PASSWORD environment variables or firebase functions:config."
        );
        return null;
      }
      await transporter.sendMail(mailOptions);
      console.log(`Notification email sent successfully for message ${context.params.messageId}`);
    } catch (error) {
      console.error("Error sending notification email:", error);
    }
  });
