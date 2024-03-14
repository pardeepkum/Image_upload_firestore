import 'package:flutter/material.dart';

class StockScreen extends StatelessWidget {
  const StockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    centerTitle: true,
    title: const Text('Streaks',
        style: TextStyle(
          color: Color(0xFF1C0D12),
          fontSize: 18,
          fontFamily: "Epilogue",
          fontWeight: FontWeight.w700,
        ),
      ),
  ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Today\'s Goal: 3 streak days',
              style: TextStyle(
                color: Color(0xFF1C0D12),
                fontSize: 22,
                fontFamily: "Epilogue",
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.only(top: 10,left: 20),
              height: MediaQuery.of(context).size.height*0.1,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xffF2E8EB)
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Streak Days',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                      color: Color(0xff1C0D12)
                  ),
                  ),
                  SizedBox(height: 5,),
                  Text('2',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      color: Color(0xff1C0D12)
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const Text('Daily Streak',
              style: TextStyle(
                color: Color(0xFF1C0D12),
                fontSize: 16,
                fontFamily: "Epilogue",
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 5,),
            const Text('2',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Color(0xff1C0D12)
              ),
            ),
            const SizedBox(height: 10,),
            RichText(
                text: const TextSpan(
                  text: 'Last 30 Days ',
                    style: TextStyle(
                        color: Color(0xff964F66),
                        fontWeight: FontWeight.w400,
                        fontSize: 16
                    ),
              children: [
                TextSpan(
                  text: '+ 100%',
                  style: TextStyle(
                    color: Color(0xff088759),
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  )
                )
              ]
            )),
            Image.asset('assets/week.png',
            height: 200,width: 358,
              fit: BoxFit.fill,
              color: const Color(0xff964F66),
            ),
            const SizedBox(height: 10,),
            Image.asset('assets/graph.png'),
            const SizedBox(height: 10,),
            const Text('Keep it up! You\'re on a roll.',
              style: TextStyle(
                color: Color(0xFF1C0D12),
                fontSize: 16,
                fontFamily: "Epilogue",
                fontWeight: FontWeight.w400,
              ),
            ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height*1/16,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xffF2E8EB),
            child :  const Text('Get Started',
              style: TextStyle(
                color: Color(0xFF1C0D12),
                fontSize: 16,
                fontFamily: "Epilogue",
                fontWeight: FontWeight.w400,
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
