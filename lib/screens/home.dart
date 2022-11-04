import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

const String fireWorksAnimPath = "assets/anim/gameover-explosion.json";
const String robotAnimPath = "assets/anim/welcome_robot.json";

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottie Animations'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          const Text("This Animation will automatically"),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.amber),
                top: BorderSide(color: Colors.red),
                left: BorderSide(color: Colors.green),
                right: BorderSide(color: Colors.blue),
              ),
            ),
            child: Lottie.asset(robotAnimPath),
          ),
          const Text("This Animation will Played with Button"),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.amber),
                top: BorderSide(color: Colors.red),
                left: BorderSide(color: Colors.green),
                right: BorderSide(color: Colors.blue),
              ),
            ),
            child: Lottie.asset(fireWorksAnimPath,
                controller: animationController, onLoaded: (composition) {
              animationController.duration = composition.duration;
            }),
          ),
          ElevatedButton(
              onPressed: () {
                animationController.forward();
                if (animationController.isCompleted) {
                  animationController.reset();
                  animationController.forward();
                }
              },
              child: const Text("Play Animation"))
        ]),
      ),
    );
  }
}
