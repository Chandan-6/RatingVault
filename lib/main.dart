import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25.0),
                    ),
                  ),
                  builder: (context) => RatingBottomSheet(),
                );
              },
              child: Text('Product Review'),
            ),
          ],
        ),
      ),
    );
  }
}

class RatingBottomSheet extends StatefulWidget {
  @override
  _RatingBottomSheetState createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  int currentRating = 0;

  void updateRating(int n) {
    setState(() {
      currentRating = n;
    });
  }

  var SuggestedCommentes = [
    ['Poor', 'Disappointing', 'Not Worth'],
    ['Fair', 'Mediocre', 'Adequate'],
    ['Average', 'Satisfactory', 'Decent'],
    ['Good', 'Impressive', 'Great'],
    ['Excellent', 'Awesome', 'Exceptional'],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'How was you experience using our product!',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () => updateRating(index + 1),
                  icon: Icon(
                    currentRating >= index + 1
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: Colors.yellow,
                    size: 40,
                  ),
                );
              }),
            ),
            currentRating > 0
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: Chip(
                                label: Text( SuggestedCommentes[currentRating - 1][index], style: TextStyle(fontSize: 12)),
                                elevation: 20,
                                padding: EdgeInsets.all(8),
                                backgroundColor: Colors.greenAccent[100],
                                shadowColor: Colors.black,  
                                ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
