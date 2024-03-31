import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'There is no weather 😔',
                style: TextStyle(
                    fontSize: 35, color: Colors.black, fontFamily: "bebasNeue"),
              ),
              Text(
                'Start searching now 🔍',
                style: TextStyle(
                    fontSize: 35, color: Colors.black, fontFamily: "bebasNeue"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
