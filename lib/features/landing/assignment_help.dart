import 'package:assignment_customer_app/core/theme_provider.dart';
import 'package:assignment_customer_app/features/atoms/heading_capsule.dart';
import 'package:assignment_customer_app/features/atoms/order_button.dart';
import 'package:assignment_customer_app/features/landing/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignmentHelp extends StatelessWidget {
  const AssignmentHelp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final accentColor = themeProvider.accentColor;

    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Column(
        children: [
          HeadingCapsule(label: "Assignments"),
          SizedBox(height: 10),
          Text(
            "Need Assignment Help? Our Professionals Offer Assistance in All Types of Assignments",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Have a look at the few assignment types that our writers work on",
            style: TextStyle(fontSize: 14, color: accentColor),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          FeatureCard(
            title: "Assignment Writing Help",
            description:
                "Writing a customised academic document is a challenging work to complete which requires students to take some assistance to outshine. Our knowledgeable writers produce the best quality customised paper regardless of its complexity level at reasonable prices.",
            icon: Icons.edit,
          ),
          SizedBox(height: 30),
          FeatureCard(
            title: "Coursework Writing Help",
            description:
                "No matter how complex your coursework topic is, leave all your academic worries to us and get the best quality writing services at economical prices. Don’t fall into the trap of trouble by drafting your coursework all by yourself when we are here to your rescue.",
            icon: Icons.school,
          ),
          SizedBox(height: 30),
          FeatureCard(
            title: "Homework Writing Help",
            description:
                "Completing homework turn out to be dilemmas for students who do not know how to tackle them. This provokes the homework helpers at Assignment Premium to take the initiative and assist the stressed out scholars by drafting the best homework for their assessments.",
            icon: Icons.home,
          ),
          SizedBox(height: 30),
          FeatureCard(
            title: "Case Study Writing Help",
            description:
                "Students who are asked to prepare a case study always want someone to guide them, the one who possesses adequate knowledge & experience. It solicits deep research & understanding to write an outstanding case study, which only we can provide.",
            icon: Icons.book,
          ),
          SizedBox(height: 30),
          FeatureCard(
            title: "Proofread & Editing Services",
            description:
                "Preparing a high-quality academic document is not every student's cup of tea, if not prepared correctly it hampers the progress of the student. To make your work outstanding and free from blemishes, proofreading and editing are a must. If you lack time, then approach us to seek help.",
            icon: Icons.edit_document,
          ),
          SizedBox(height: 30),
          FeatureCard(
            title: "Reports & Presentations Help",
            description:
                "If you are pondering over a mind-numbing topic while preparing a report or presentation, then do not be on pins and needles! Ask us, our reports and presentation writing experts will help you in an excellent manner and hand over a well-written document in no time.",
            icon: Icons.book,
          ),
          SizedBox(height: 20),
          OrderButton(
            label: "Order Now",
            width: MediaQuery.of(context).size.width * 2 / 3,
          ),
        ],
      ),
    );
  }
}
