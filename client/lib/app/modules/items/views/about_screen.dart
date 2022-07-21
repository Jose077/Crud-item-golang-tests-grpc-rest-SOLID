import 'package:flutter/material.dart';
import 'widgets/left_description.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AboutScreenData();
  }
}

class AboutScreenData extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 130),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 150.0, top: 0, right: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const LeftDescription(),
                  SizedBox(
                    width: 500,
                    height: 504,
                    child: Image.asset('../../assets/vrilustration.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
