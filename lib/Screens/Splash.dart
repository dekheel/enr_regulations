import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:lottie/lottie.dart';
import '../animations/FadeAnimation.dart';
import 'Login.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

//check for playing audio horn
var isplayed = false;

// create audioplayer & audiocache var
// AudioPlayer player = AudioPlayer();
// AudioCache cache = new AudioCache(prefix: "assets/", fixedPlayer: player);

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    _scale2Animation = Tween<double>(begin: 1.0, end: 32.0)
        .animate(_scale2Controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => Login()));
        }
      });
  }

//method to play horn once
  playHorn() {
    // cache.play("Horn.mp3");
    return isplayed = true;
  }

  @override
  Widget build(BuildContext context) {
    //train horn call method if dosent play at all
    if (isplayed) {
    } else {
      playHorn();
    }

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(3, 9, 23, 1),
      body: ListView(children: [
        Container(
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -50,
                left: 0,
                child: FadeAnimation(
                    1,
                    Container(
                      width: width,
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/one.png'),
                              fit: BoxFit.cover)),
                    )),
              ),
              Positioned(
                top: -100,
                left: 0,
                child: FadeAnimation(
                    1.3,
                    Container(
                      width: width,
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/one.png'),
                              fit: BoxFit.cover)),
                    )),
              ),
              Positioned(
                top: -150,
                left: 0,
                child: FadeAnimation(
                    1.6,
                    Container(
                      width: width,
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/one.png'),
                              fit: BoxFit.cover)),
                    )),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                      1,
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AutoSizeText(
                              maxLines: 1,
                              "",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff27827c),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: height / 5,
                            child: AutoSizeText(
                              maxLines: 1,
                              "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: FadeAnimation(
                        3,
                        Center(
                          child: SizedBox(
                            width: 300,
                            height: height / 2,
                            child:
                                Lottie.asset("lib/animations/Enr_Train.json"),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: height / 4,
                      child: FadeAnimation(
                          3,
                          AnimatedBuilder(
                            animation: _scaleController,
                            builder: (context, child) => Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Center(
                                  child: AnimatedBuilder(
                                    animation: _widthController,
                                    builder: (context, child) => Container(
                                      width: _widthAnimation.value,
                                      height: 80,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color(0xff27827c)
                                              .withOpacity(.4)),
                                      child: InkWell(
                                        onTap: () {
                                          // await player.stop();
                                          _scaleController.forward();
                                        },
                                        child: Stack(children: <Widget>[
                                          AnimatedBuilder(
                                            animation: _positionController,
                                            builder: (context, child) =>
                                                Positioned(
                                              left: _positionAnimation.value,
                                              child: AnimatedBuilder(
                                                animation: _scale2Controller,
                                                builder: (context, child) =>
                                                    Transform.scale(
                                                        scale: _scale2Animation
                                                            .value,
                                                        child: Container(
                                                          width: 60,
                                                          height: 60,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                3, 9, 23, 1),
                                                          ),
                                                          child:
                                                              hideIcon == false
                                                                  ? Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 30,
                                                                    )
                                                                  : Container(),
                                                        )),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                )),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
