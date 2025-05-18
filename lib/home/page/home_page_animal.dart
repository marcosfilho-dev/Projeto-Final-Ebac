
import 'package:flutter/material.dart';

class HomePageAnimal extends StatefulWidget {
  const HomePageAnimal({super.key});

  @override
  State<HomePageAnimal> createState() => _HomePageAnimalState();
}

class _HomePageAnimalState extends State<HomePageAnimal> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
    final Duration _duration = const Duration(milliseconds: 1000);

   @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: _duration,
      vsync: this);
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(
      color: const Color.fromARGB(102, 5, 144, 54),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, 
                icon: const Icon(Icons.send), 
                iconSize: 30,
                color: Colors.black,)
              ],

            ),
            AnimatedContainer(
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 3),
              child: Card(
                child: Column(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    RepaintBoundary(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: SizedBox(
                          height: 250,
                          child: Image.asset("assets/dog2.jpeg",
                          fit: BoxFit.cover,),
                          ),
                      ),
                    ),
                    
              
                      const Row(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border,
                          size: 30,
                          ),
                        ),
                        Icon(Icons.comment,
                        size: 30,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.share_rounded,
                          size: 30,),
                        ),
                      ],),
                  ],
                ),
                
              ),
            ),
            AnimatedBuilder(
              builder: (context, child) {
                return Transform.rotate(angle: _controller.value * (360) ,
                child: child,);
              },
              animation: _controller,
              child: Card(
                child: Column(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: SizedBox(
                        height: 250,
                        child: Image.asset("assets/cat.jpeg",
                        fit: BoxFit.cover,),
                        ),
                    ),
                      const Row(children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite_border,
                          size: 30,
                          ),
                        ),
                        Icon(Icons.comment,
                        size: 30,),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.share_rounded,
                          size: 30,),
                        ),
                      ],)
                  ],
                ),
                
              ),
            ),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: ElevatedButton(
              onPressed: (){
                _controller.repeat(); 
                _controller.stop(canceled: true);
              }, 
              child: const Icon(
                Icons.rotate_right,
                size: 50,
                color: Colors.amber,
              )),
          )
          ],
        ),
    ),
    );

  }
}