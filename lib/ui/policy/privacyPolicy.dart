import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

import 'package:travel/controller/authController.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Privacy Policy',
          style: TextStyle(color: Colors.teal),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              authController.privacyList!["type"].toString(),
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            // Text(
            //   authController.privacyList!["detail"].toString(),
            //   style: TextStyle(fontSize: 16.0),
            // ),
            Text(
              "Privacy Policy for Travel Mobile App and Website",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "At Kabia Travels And Hospitality Solutions Private Limited, we are committed to protecting your privacy and ensuring the security of your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your data when you access our mobile app and website. By using our services, you agree to the terms of this Privacy Policy.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Information We Collect",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "1.1. Personal Information: When you use our travel app and website, we may collect personal information such as your name, email address, contact number, billing address, and payment details. This information is necessary to process your bookings and provide you with the requested services.",
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              "1.2. Travel Preferences: To facilitate personalized travel recommendations, we may collect information about your travel preferences, including preferred destinations, travel dates, seating preferences, and hotel room requirements.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "1.3. Device and Log Information: We may automatically collect device information (such as IP address, browser type, device identifiers) and usage data when you access our app and website. This information helps us improve our services and troubleshoot technical issues.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "1.4. Cookies and Similar Technologies: We use cookies and similar technologies to enhance your user experience, analyze trends, and customize content. You can manage your cookie preferences through your browser settings.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "How We Use Your Information",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " 2.1. Booking and Service Provision: We use your personal information to process bookings for rail tickets, flight tickets, hotel rooms, wedding destinations, visa assistance, and bus tickets. This includes sharing relevant details with service providers to fulfill your travel requests.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "2.2. Personalization: We may use your travel preferences to offer personalized recommendations, promotions, and travel-related content that match your interests.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "2.3. Customer Support: Your information enables us to provide customer support and respond to inquiries, feedback, or concerns related to your bookings or general use of our app and website.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "2.4. Marketing Communications: With your consent, we may send you marketing communications, updates, and promotional offers. You can opt-out of these communications at any time.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "2.5. Legal Obligations: We may process your information as required by law or when it is necessary to protect our legal rights or the rights of others.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Data Sharing and Disclosure",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "3.1. Service Providers: We may share your information with trusted third-party service providers who assist us in delivering travel services, payment processing, analytics, or marketing activities. These providers are obligated to handle your data securely and only use it for the purposes specified.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "3.2. Business Transfers: In the event of a merger, acquisition, or sale of our assets, your information may be transferred to the new entity as part of the business transaction.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "3.3. Legal Compliance: We may disclose your information when required by law, court order, or government request.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "3.4. User Consent: We will obtain your explicit consent before sharing your information with third parties for purposes other than those mentioned in this Privacy Policy.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Data Security",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We implement industry-standard security measures to protect your personal information from unauthorized access, alteration, or disclosure. Despite our best efforts, no data transmission over the internet or electronic storage is completely secure. Therefore, we cannot guarantee the absolute security of your data.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your Choices and Rights",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "5.1. Access and Correction: You can review and update your personal information by accessing your account settings on our app and website.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "5.2. Marketing Communications: You can opt-out of marketing communications by following the instructions provided in the emails or by contacting our customer support.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "5.3. Data Deletion: You have the right to request the deletion of your personal information, subject to any legal obligations that may require us to retain certain data.",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "5.4. Do Not Track: Our app and website do not respond to \"Do Not Track\" signals from your browser.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Children's Privacy",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Our services are not intended for children under the age of 13. We do not knowingly collect personal information from children. If you are a parent or guardian and believe that your child has provided us with personal information, please contact us, and we will take appropriate steps to remove the data from our systems",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Changes to this Privacy Policy",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We may update this Privacy Policy periodically to reflect changes in our data practices or legal requirements. When we make significant changes, we will notify you through our app or website or via email.",
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Contact Us",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "If you have any questions, concerns, or requests related to this Privacy Policy, please contact us at [kabiatravels@gmail.com \/ B-25, Pashupati Greens, Jhansi \/ 9205940100].",
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              "By using our travel app and website, you acknowledge that you have read and understood this Privacy Policy and agree to the collection, use, and disclosure of your information as described herein.",
              style: TextStyle(fontSize: 16.0),
            ),
            // Text(
            //   authController.privacyList!["detail"].toString(),
            //   style: TextStyle(fontSize: 16.0),
            // ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
