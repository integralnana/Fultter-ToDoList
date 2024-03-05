import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:onboarding_screen/screen/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'นี่คือวัว',
      body: 'วัวดินกินหญ้า วัวฟ้ากินยุง',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
// primary: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text("(x+y)^2 = x^2 + 2xy + y^2"),
        ),
      ),
      image: Center(
        child: Image.network(
            'https://m.media-amazon.com/images/I/71H6pf8BSeL.jpg'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'นี่คือหมู',
      body: 'หมูดินกินหญ้า หมูฟ้ากินยุง',
// title: 'First Page',
// body: 'Description',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
// primary: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text("x^2 - y^2 = (x+y)(x-y)"),
        ),
      ),
      image: Center(
        child: Image.network(
            'https://m.media-amazon.com/images/I/71iW-Hl2ibL.jpg'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    PageViewModel(
      title: 'คุโรมิ',
      body: 'คุโรมิน่ารัก',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 8,
          ),
          onPressed: () {},
          child: const Text('เป็นเรื่องจริง'),
        ),
      ),
      image: Center(
        child: Image.network(
            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/90f9af29-a2ea-4c71-be11-6489816dae27/dfrfnz8-8a9d60bf-88c5-4260-a2f4-b97709058180.jpg/v1/fill/w_750,h_750,q_75,strp/kuromi__png__by_p1kachugirl101_dfrfnz8-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzUwIiwicGF0aCI6IlwvZlwvOTBmOWFmMjktYTJlYS00YzcxLWJlMTEtNjQ4OTgxNmRhZTI3XC9kZnJmbno4LThhOWQ2MGJmLTg4YzUtNDI2MC1hMmY0LWI5NzcwOTA1ODE4MC5qcGciLCJ3aWR0aCI6Ijw9NzUwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.H6GTsfvYQjzr4FYQruEzPVYD08aXHjPi6Zbr4y7rQT0'),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าหลัก'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 80, 12, 12),
        child: IntroductionScreen(
          pages: pages,
          dotsDecorator: const DotsDecorator(
            size: Size(15, 15),
            color: Colors.blue,
            activeSize: Size.square(20),
            activeColor: Colors.red,
          ),
          showDoneButton: true,
          done: const Text(
            'Done',
            style: TextStyle(fontSize: 20),
          ),
          showSkipButton: true,
          skip: const Text(
            'Skip',
            style: TextStyle(fontSize: 20),
          ),
          showNextButton: true,
          next: const Icon(
            Icons.arrow_forward,
            size: 25,
          ),
          onDone: () => onDone(context),
          curve: Curves.bounceOut,
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
