import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Drawer(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff235b69),
                    Color(0xFF2b798c),
                    Color(0xFF47afc9),
                  ],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        // Image.asset('../images/logo.png',
                        //     width: 30, height: 25),
                        Text(
                          'SisItens',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            //letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Menu',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          fontSize: 12),
                    ),
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: const Icon(Icons.featured_play_list_outlined),
                    title: Text('Itens'),
                    onTap: () {
                      Modular.to.navigate('./');
                    },
                  ),
                  ListTile(
                    iconColor: Colors.white,
                    textColor: Colors.white,
                    leading: Icon(Icons.warning_amber),
                    title: Text('Sobre'),
                    onTap: () {
                      Modular.to.navigate('./sobre');
                    },
                  ),
                ],
              ),
            ),
          ),
          const Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }
}
