import 'package:flutter/material.dart';
import 'package:search_app/app/pages/home/cabecalho_tab/controller/cabecalho_controller.dart';
import 'package:search_app/app/pages/home/cabecalho_tab/cabecalho_tab.dart';

import 'catalogo_tab/catalogo_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CabecalhoController controller = CabecalhoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceBar(
          title: const Text('Pendência de Faturamento',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          titlePadding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .027),
        ),
        leading: const Icon(Icons.arrow_back, size: 30),
        toolbarHeight: MediaQuery.of(context).size.height * .09,
        elevation: 0,
        actions: const [
          Icon(Icons.more_vert, size: 30),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      const TabBar(
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        indicatorColor: Colors.blue,
                        labelColor: Colors.blue,
                        tabs: [
                          Tab(text: 'Cabeçalho'),
                          Tab(text: 'Catálogo'),
                          Tab(text: 'Carrinho'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            CabecalhoTab(controller: controller),
                            CatalogoTab(),
                            const Icon(Icons.car_repair_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
