import 'package:flutter/material.dart';

import '../controllers/users_store.dart';
import '../models/users_model.dart';
import 'widgets/left_description.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ItemsScreenData();
  }
}

class ItemsScreenData extends State<ItemsScreen> {
  UserStore store = UserStore();

  @override
  void initState() {
    super.initState();
    store.fetchUsersDataDio();
  }

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
