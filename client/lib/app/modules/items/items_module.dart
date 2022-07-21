import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterboilerplatemodularmobx/app/modules/items/views/widgets/table_items.dart';

// Importação de paginas
// import 'views/list_product_page.dart';
import 'views/about_screen.dart';
import 'views/list_page_items.dart';

class ItemsModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ItemsPage(), children: [
          ChildRoute(
            '/list',
            child: (_, __) => Datatables(),
            transition: TransitionType.noTransition,
          ),
          ChildRoute(
            '/sobre',
            child: (_, __) => const AboutScreen(),
            transition: TransitionType.noTransition,
          ),
          // ChildRoute(
          //   '/Userscrud',
          //   child: (_, __) => const UsersCrudPage(),
          //   transition: TransitionType.noTransition,
          // )
        ]),
        // ChildRoute(
        //   '/list',
        //   child: (_, args) => ListProductPage(id: args.data ?? ''),
        //   // Animação das rotas
        //   transition: TransitionType.fadeIn,
        //   // duration: const Duration(seconds: 1)
        // ),
      ];
}
