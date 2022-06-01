
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _heightFactorAnimation;
  double collapsedHeightFactor = 0.9;
  double expandedHeightFactor = 0.67;
  bool isAnimationCompleted = false;
  double screenHeight = 0;
  @override
  initState(){
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
    _heightFactorAnimation = Tween<double>(begin: collapsedHeightFactor,end: expandedHeightFactor).animate(_controller!);
    super.initState();
  }

  @override
  dispose(){
    _controller!.dispose();
    super.dispose();
  }

  onBottomPartTap(){
    setState((){
      if(isAnimationCompleted){
        _controller!.reverse();
      }else{
        _controller!.forward();
      }
      isAnimationCompleted = !isAnimationCompleted;
    });
  }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (c,widget)=> getWidget(),
        ),
      ),
    );
  }

  Widget getWidget(){
    return Stack(
      fit: StackFit.expand,
      children: [
        FractionallySizedBox(
          alignment: Alignment.topCenter,
          heightFactor: _heightFactorAnimation!.value,
          child: Image.asset("assets/image/steve.jpg",
            fit: BoxFit.cover,colorBlendMode: BlendMode.hue,color: Colors.black,),
        ),
        GestureDetector(
          onTap: onBottomPartTap,
          child: FractionallySizedBox(
            alignment: Alignment.bottomCenter,
            heightFactor: 1.05 - _heightFactorAnimation!.value,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
              ),
            ),
          ),
        )
      ],
    );
  }
}
