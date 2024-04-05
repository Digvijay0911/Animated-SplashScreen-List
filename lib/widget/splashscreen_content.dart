import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task2/presentation/movie_pages/newmovies.dart';

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({super.key});

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent>
    with TickerProviderStateMixin {
  // ------------------------------------------
  late AnimationController firstAnimationController;
  late AnimationController secondAnimationController;
  late CurvedAnimation firstCurvedAnimation;
  late CurvedAnimation secondCurvedAnimation;

  @override
  void initState() {
    super.initState();

     firstAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    secondAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    firstCurvedAnimation =
        CurvedAnimation(parent: firstAnimationController, curve: Curves.easeIn);
    secondCurvedAnimation = CurvedAnimation(
        parent: secondAnimationController, curve: Curves.easeIn);

    firstAnimationController.repeat();
    secondAnimationController.repeat();

    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const NewMovies())));
  }

  @override
  dispose() {
 firstAnimationController.dispose(); 
 secondAnimationController.dispose();
 super.dispose();
 }

  // ==========================================
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
           
              children: [
                 RotationTransition(
              turns:
                  Tween<double>(begin: 1, end: 0).animate(firstCurvedAnimation),
              alignment: Alignment.center,
              child: const Icon(
                Icons.settings,
                size: 100,
                color: Colors.white,
              ),
            ),
            RotationTransition(
              turns:
                  Tween<double>(begin: 0, end: 1).animate(secondCurvedAnimation),
              alignment: Alignment.center,
              child: const Icon(
                Icons.settings,
                size: 100,
                color: Colors.white,
              ),
            ),
              ],
            ),
          ),
         
    
          const SizedBox(height: 30,),
    
          const Text("MegaMovies",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
        
        ],
      ),
    );
  }
}
