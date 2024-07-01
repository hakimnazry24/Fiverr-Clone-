import 'package:flutter/material.dart';
import "package:simple_icons/simple_icons.dart";
import "package:url_launcher/url_launcher.dart";

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    Uri githubLink = Uri.parse("https://github.com/hakimnazry24");
    Uri linkedInLink = Uri.parse("https://www.linkedin.com/in/hakim-nazri/");
    Uri xLink = Uri.parse("https://x.com/hakimnazry_");
    Uri emailLink =
        Uri.parse("mailto:hakimnazry@gmail.com?subject=Hey!&body=What's%20up!");

    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 70, 30, 50),
          child: Column(
            children: [
              const Text(
                  "Hello, my name is Hakim, the developer of IIUM Freelancer. This app is free-to-use, no need to pay anything. I do not gain any profit margin out of services provided by freelancers (except maybe advertisements). Just using the app is enough for me to show your support. If you have any question, to report any bug, or even to contribute to the project, reach me out at: "),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await launchUrl(githubLink);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  child: const Row(
                    children: [
                      Icon(SimpleIcons.github),
                      SizedBox(
                        width: 10,
                      ),
                      Text("hakimnazry24")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await launchUrl(linkedInLink);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  child: const Row(
                    children: [
                      Icon(SimpleIcons.linkedin),
                      SizedBox(
                        width: 10,
                      ),
                      Text("linkedin.com/in/hakim-nazri")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await launchUrl(xLink);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  child: const Row(
                    children: [
                      Icon(SimpleIcons.x),
                      SizedBox(
                        width: 10,
                      ),
                      Text("@hakimnazry_")
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await launchUrl(emailLink);
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  child: const Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 10,
                      ),
                      Text("hakimnazry@gmail.com")
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Row(
                children: [
                  Text("p.s. just press the social links", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black.withOpacity(0.6)),),
                ],
              )
            ],
          ),
        ));
  }
}
