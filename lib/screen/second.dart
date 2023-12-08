import 'package:flutter/material.dart';
import 'package:timer/screen/mainscreen.dart';

class CountdownClockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindful Meal Timer',
        style: TextStyle(
                color: Color.fromARGB(255, 249, 251, 250),
                fontSize: 20,
              ),),
        backgroundColor: Color(0xfff2B2B2B),
      ),
      backgroundColor: Color(0xfff2B2B2B), // Set the background color here
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Time to eat mindfully',
              style: TextStyle(
                color: Color.fromARGB(255, 249, 251, 250),
                fontSize: 30,
              ),
            ),
            SizedBox(height: 2,),
            Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 101, 100, 100),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 101, 100, 100),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(width: 5),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 101, 100, 100),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    ),
            
            SizedBox(height: 5), // Adjust the height as needed
            Text(
              'It\'s simple: eat slowly for ten minutes, rest for \n    five, then finish your meal',
              style: TextStyle(
                color: Color.fromARGB(255, 249, 251, 250),
                fontSize: 18,
              ),
            ),
            SizedBox(height: 130),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Color(0xfff24FFCC),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Color(0xfff2B2B2B), 
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '30',
                          style: TextStyle(
                            color: Color(0xfff24FFCC),
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(height: 5), // Adjust the height as needed
                        Text(
                          'Seconds',
                          style: TextStyle(
                            color: Color.fromARGB(255, 244, 247, 247),
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimerReel()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 130),
                primary: Color.fromARGB(255, 185, 240, 199)),
              child: Text(
                'START',
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 0, 11, 9),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
