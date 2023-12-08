
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class TimerReel extends StatefulWidget {
  const TimerReel({Key? key}) : super(key: key);

  @override
  _TimerReelState createState() => _TimerReelState();
}

class _TimerReelState extends State<TimerReel> {
  late Timer _timer;
  int _start = 30;
  var _isTimerOn = false;
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
    loadSound();
    startTimer();
  }

   void loadSound() async {
  await audioPlayer.play('assets/sounds/countdown_tick.mp3' as Source);
}

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            if (_start <= 5) {
              playSound();
            }
            _start--;
          });
        }
      },
    );
  }

  void playSound() {
    audioPlayer.play('assets/sounds/countdown_tick.mp3' as Source);
  }

  @override
  void dispose() {
    _timer.cancel();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      
      appBar: AppBar(
        title: const Text(
          'Mindful Meal Timer',
          style: TextStyle(
            color: Color.fromARGB(255, 249, 251, 250),
            fontSize: 22,
          ),
        ),
        backgroundColor: Color(0xfff2B2B2B),
      ),
      body: Container(
        
         color: Color(0xfff2B2B2B),
  width: MediaQuery.of(context).size.width,
  child: Column(
   
    children: [
      Text(
        'Nom nom :)',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 5,),
       Text(
        'You have 10 minutes to eat before the stop\n          focus on eating slowly',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.width * 0.78,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  size: MediaQuery.of(context).size.width * 0.84,
                  customColors: CustomSliderColors(
                    trackColor: Color(0xfff364643),
                    progressBarColor: Color(0xfff24FFCC),
                    dotColor: Colors.black,
                    shadowColor: Colors.grey.shade600,
                  ),
                  startAngle: 270,
                  angleRange: 360,
                  customWidths: CustomSliderWidths(
                    trackWidth: 36,
                    progressBarWidth: 22,
                    handlerSize: 7,
                  ),
                ),
                min: 0,
                max: 30,
                initialValue: _start.toDouble(),
                onChange: (double value) {
                  setState(() {
                    _start = value.round();
                  });
                },
                innerWidget: (percentage) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${_start.round()}',
                        style: const TextStyle(
                          fontSize: 50,
                          color: Color(0xfff24FFCC),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        "seconds",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            GestureDetector(
              onTap: () {
                if (_isTimerOn) {
                  _timer.cancel();
                  setState(() {
                    _isTimerOn = false;
                    // _start = 30;
                  });
                } else {
                  _isTimerOn = true;
                  startTimer();
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.50,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  color: _isTimerOn ? Colors.redAccent : Color.fromARGB(255, 247, 249, 248),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  _isTimerOn ? 'Stop' : 'Start',
                  style: TextStyle(
                    fontSize: 24,
                    color: _isTimerOn ? Colors.white : Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
             SizedBox(height: 35,),
            Container(
  padding: EdgeInsets.all(10), // Adjust padding as needed
  decoration: BoxDecoration(
    border: Border.all(
      color: const Color.fromARGB(255, 249, 246, 246), // Set border color
      width: 2.0, // Set border width
    ),
    borderRadius: BorderRadius.circular(8), // Set border radius
  ),
  child: Text(
    'LETS STOP IAM FULL NOW',
    style: TextStyle(
      fontSize: 16,
      color: const Color.fromARGB(255, 245, 242, 242),
    ),
  ),
)
          ],
        ),
      ),
    );
  }
}
