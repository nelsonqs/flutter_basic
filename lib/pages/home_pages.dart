import 'package:flutter/material.dart';

class HomePages  extends StatefulWidget {
  const HomePages ({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {

  int currentpage = 1;
  final PageController pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //* AppBar
        appBar:AppBar(
          title: Text(' Hola Mundo  $currentpage'),
          elevation: 0,
        ),
        //? Cambiar la pantalla
        body: PageView(
          controller: pageController,
          physics:const NeverScrollableScrollPhysics(),
          children: const [
             CustomScreen(color: Colors.lime),
             CustomScreen(color: Colors.grey),
             CustomScreen(color: Colors.lightBlue),
          ],
        ),
        //* Tabs
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentpage,
          onTap: (value) {
            currentpage = value;
            pageController.animateToPage(currentpage, duration: const Duration(seconds: 1), curve: Curves.linear);

            print('index :  ${value.toString()}');
            setState(() {
              
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Colors.lime,
          unselectedItemColor: Colors.grey.withOpacity(0.8),
          items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_outlined),
            label: 'User' 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings' 
          )
        ],

        ),
      );
  }
}
class CustomScreen extends StatelessWidget {
  final Color color;
  // ignore: use_key_in_widget_constructors
  const CustomScreen({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      
      child: Scaffold(
        bottomSheet:  Row(children: const<Widget> [
          Cuadrado(color: Colors.cyan),
          Expanded (
            child: Cuadrado(color: Colors.cyan)
          ),
          Expanded (
            flex: 2,
            child: Cuadrado(color: Colors.cyan)
          ),
          Cuadrado(color: Colors.cyan),
          ],),
        body: SafeArea(
          bottom: true,
          left: true,
          right: true,
          child: ListView(
            children: List.generate(100,
              (i) => Text('$i -  Hola Mundo', style: const TextStyle(fontSize: 20))
            ),
          )),
      ),
    );
  }
}

class Cuadrado extends StatelessWidget {
  final Color color;

  const Cuadrado({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        color: color
      ),
    );
  }
}

