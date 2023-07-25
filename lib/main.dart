import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(FlappyBallApp());

class FlappyBallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FlappyBallGame(),
    );
  }
}

class FlappyBallGame extends StatefulWidget {
  @override
  _FlappyBallGameState createState() => _FlappyBallGameState();
}

class _FlappyBallGameState extends State<FlappyBallGame> {
  double ballYAxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = 0;
  double gravity = -2.0; // Daha yavaş düşme için değeri artırabilirsiniz
  double velocity = 2.0; // Daha hızlı yükselme için değeri artırabilirsiniz
  int score = 0;
  bool gameHasStarted = false;
  double gap = 200;
  double barrierX1 = 400;
  double barrierX2 = 600;
  double barrierX3 = 800;
  double barrierWidth = 50; // barrierWidth değişkeni burada tanımlandı
  double barrierHeight = 300;

  void jump() {
    setState(() {
      if (!gameHasStarted) {
        gameHasStarted = true;
      }
      time = 0;
      initialHeight = ballYAxis;
    });
  }

  void addScore() {
    setState(() {
      score++;
    });
  }

  void createBarrier() {
    setState(() {
      Random rnd = Random();
      double randomHeight = rnd.nextDouble() * 200 + 200;
      barrierX1 = 400;
      barrierX2 = barrierX1 + barrierWidth + gap;
      barrierX3 = barrierX2 + barrierWidth + gap;
      barrierHeight = randomHeight;
    });
  }

  void endGame() {
    setState(() {
      ballYAxis = 0;
      score = 0;
      time = 0;
      gameHasStarted = false;
      barrierX1 = 400;
      barrierX2 = 600;
      barrierX3 = 800;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(gameLoop);
  }

  void gameLoop(Duration duration) {
    setState(() {
      if (gameHasStarted) {
        time += 0.04;
        height = gravity * time * time + velocity * time;
        ballYAxis = initialHeight - height;

        barrierX1 -= velocity;
        barrierX2 -= velocity;
        barrierX3 -= velocity;

        if (barrierX1 < -barrierWidth) {
          barrierX1 += 2 * barrierWidth + gap;
          createBarrier();
        }
        if (barrierX2 < -barrierWidth) {
          barrierX2 += 2 * barrierWidth + gap;
          createBarrier();
        }
        if (barrierX3 < -barrierWidth) {
          barrierX3 += 2 * barrierWidth + gap;
          createBarrier();
        }

        if (barrierX1 <= 60 && barrierX1 > 0 ||
            barrierX2 <= 60 && barrierX2 > 0 ||
            barrierX3 <= 60 && barrierX3 > 0) {
          if (ballYAxis < barrierHeight || ballYAxis > barrierHeight + gap) {
            endGame();
          } else {
            addScore();
          }
        }

        if (ballYAxis <= -1 || ballYAxis >= 1) {
          endGame();
        }
      }
      WidgetsBinding.instance?.addPostFrameCallback(gameLoop);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        jump();
      },
      child: Scaffold(
        body: Stack(
          children: [
            AnimatedContainer(
              alignment: Alignment(0, ballYAxis),
              duration: Duration(milliseconds: 0),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                FlappyBarrier(
                  barrierX: barrierX1,
                  barrierHeight: barrierHeight,
                ),
                FlappyBarrier(
                  barrierX: barrierX1,
                  barrierHeight: MediaQuery.of(context).size.height -
                      (barrierHeight + gap),
                ),
                FlappyBarrier(
                  barrierX: barrierX2,
                  barrierHeight: barrierHeight,
                ),
                FlappyBarrier(
                  barrierX: barrierX2,
                  barrierHeight: MediaQuery.of(context).size.height -
                      (barrierHeight + gap),
                ),
                FlappyBarrier(
                  barrierX: barrierX3,
                  barrierHeight: barrierHeight,
                ),
                FlappyBarrier(
                  barrierX: barrierX3,
                  barrierHeight: MediaQuery.of(context).size.height -
                      (barrierHeight + gap),
                ),
              ],
            ),
            Positioned(
              top: 16,
              left: MediaQuery.of(context).size.width / 2 - 30,
              child: Text(
                'Score: $score',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlappyBarrier extends StatelessWidget {
  final double barrierX;
  final double barrierHeight;

  FlappyBarrier({required this.barrierX, required this.barrierHeight});

  @override
  Widget build(BuildContext context) {
    double barrierWidth;
    return Container(
      alignment: Alignment(barrierX, 0),
      child: Container(
        width: barrierWidth=50.0,
        height: barrierHeight,
        color: Colors.black,
      ),
    );
  }
}
