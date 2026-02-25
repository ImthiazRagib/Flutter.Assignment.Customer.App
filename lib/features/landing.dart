import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assignment Solutions"),
        backgroundColor: Colors.white,
        // actions: [
        //   TextButton(onPressed: () => context.go('/about'), child: const Text("About")),
        //   TextButton(onPressed: () => context.go('/services'), child: const Text("Services")),
        //   TextButton(onPressed: () => context.go('/order'), child: const Text("Order")),
        //   TextButton(onPressed: () => context.go('/login'), child: const Text("Login")),
        // ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            color: const Color(0xFF13245A),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.white),
                children: [
                  const TextSpan(
                    text:
                        "Get \$20 Bonus And Earn 10% Commission On All Your Friend's Order For Life! ",
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: SizedBox(width: 5),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: SizedBox(
                      height: 28,
                      child: OutlinedButton(
                        onPressed: () => (() {}),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          foregroundColor: Color(0xFFFBD502),
                          side: const BorderSide(color: Color(0xFFFBD502)),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text("Start Earning"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Assignment Writing Services Offered By Us", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF13245A)), textAlign: TextAlign.center),
                SizedBox(height: 10),
                Text("Expert help for all your academic assignments — fast, reliable, and affordable.", style: TextStyle(fontSize: 14, color: Colors.grey.shade700), textAlign: TextAlign.center),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.go('/order'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFBD502),
                      foregroundColor: Color(0xFF13245A),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Get assignment help now"),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF13245A), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.assignment, size: 20, color: Color(0xFF13245A)),
                      SizedBox(width: 6),
                      Flexible(child: Text("Assignments", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF13245A)), overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF13245A), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.school, size: 20, color: Color(0xFF13245A)),
                      SizedBox(width: 6),
                      Flexible(child: Text("Expert Help", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF13245A)), overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF13245A), width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.schedule, size: 20, color: Color(0xFF13245A)),
                      SizedBox(width: 6),
                      Flexible(child: Text("On Time", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xFF13245A)), overflow: TextOverflow.ellipsis)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
