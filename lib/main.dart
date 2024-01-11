import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_emoji/animated_emoji.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double actionButtonSize = 15.0;
  Color fontColor = Colors.black;
  bool light = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Track color when the switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber;
        }
        // Otherwise return null to set default track color
        // for remaining states such as when the switch is
        // hovered, focused, or disabled.
        return null;
      },
    );
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return Colors.amber.withOpacity(0.54);
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return Colors.grey.shade400;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
            // You can open a drawer, show a menu, or perform any other action here
            print('Menu button pressed');
          },
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "HOME",
                style: GoogleFonts.lato(
                    color: Colors.black, fontSize: actionButtonSize),
              )),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Text("ABOUT",
                  style: GoogleFonts.lato(
                      color: Colors.black, fontSize: actionButtonSize))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Text("SERVICE",
                  style: GoogleFonts.lato(
                      color: Colors.black, fontSize: actionButtonSize))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Text("PROJECT",
                  style: GoogleFonts.lato(
                      color: Colors.black, fontSize: actionButtonSize))),
          SizedBox(
            width: 30,
          ),
          TextButton(
              onPressed: () {},
              child: Text("CONTACT",
                  style: GoogleFonts.lato(
                      color: Colors.black, fontSize: actionButtonSize))),
          SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.green, width: 1)),
            child: TextButton(
                style:
                    TextButton.styleFrom(backgroundColor: Colors.transparent),
                onPressed: () {},
                child: Text("RESUME",
                    style: GoogleFonts.lato(
                        color: Colors.black, fontSize: actionButtonSize))),
          ),
          SizedBox(
            width: 30,
          ),
          SizedBox(
              width: 80,
              height: 30,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: Switch(
                    value: light,
                    overlayColor: overlayColor,
                    trackColor: trackColor,
                    thumbColor:
                        const MaterialStatePropertyAll<Color>(Colors.black),
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      setState(() {
                        light = value;
                      });
                    },
                  ))),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Align(
        alignment: Alignment.topLeft,
        child: Column(children: [
          Row(
              children: [
            Container(
              width: 500,
              height: 800,
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: FractionalOffset.topCenter,
                      image: AssetImage("assets/imgpsh_fullsize_anim.jpg"))),
            ),
            Expanded(
                child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        "WELCOME TO MY PORTFOLIO",
                        style: GoogleFonts.breeSerif(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 5),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      AnimatedEmoji(
                        AnimatedEmojis.wave,
                        size: 50,
                      ),
                    ]),
                    Text(
                      "S R Ashwin kumar",
                      style: GoogleFonts.exo2(
                          color: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3),
                    ),
                    AnimatedTextKit(animatedTexts: [
                      TyperAnimatedText("Software Engineering :)",
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 167, 86, 75),
                              letterSpacing: 1.0,
                              fontFamily: ''))
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(
                            FontAwesomeIcons.instagram,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.linkedin)),
                      IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.github))
                    ]),
                  ]),
            ))
          ].reversed.toList()),
          SizedBox(
            height: 20,
          ),
          Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: screenWidth * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            alignment: FractionalOffset.topCenter,
                            image: AssetImage("assets/user-profile.gif"))),
                  ),
                  Container(
                      height: screenHeight * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "About Me",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 40, fontWeight: FontWeight.w700),
                          ),
                          Container(
                              width: screenWidth * 0.5,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Who am i ? ",
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 175, 50, 0))),
                                  ])),
                          Container(
                            width: screenWidth * 0.5,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "I'm Ashwin Kumar S R , a Software Engineering",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 25,
                                          color: Color.fromARGB(255, 0, 0, 0)))
                                ]),
                          ),
                          Container(
                            width: screenWidth * 0.5,
                            child: Text(
                                "I am a proactive and detail-oriented software developer with a Bachelor's degree in Mechanical Engineering from Mepco Schlenk Engineering College in Sivakasi, India. I graduated with a CGPA of 7.3 in 2022.",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 110, 110, 110))),
                          )
                        ],
                      ))
                ],
              )),
          Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: screenHeight * 0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Skills",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 40, fontWeight: FontWeight.w700),
                          ),
                          Container(
                              width: screenWidth * 0.5,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Technology i have work with",
                                        style: GoogleFonts.aBeeZee(
                                            fontSize: 20,
                                            color: Color.fromARGB(
                                                255, 175, 50, 0))),
                                  ])),
                          Container(
                            width: screenWidth * 0.5,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Flutter",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 110, 110, 110))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 20,
                                    child:
                                        Image.asset("assets/arrow-right.png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Dart",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 110, 110, 110))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 20,
                                    child:
                                        Image.asset("assets/arrow-right.png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Asp.Net",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 110, 110, 110))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 20,
                                    child:
                                        Image.asset("assets/arrow-right.png"),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("WPF",
                                      style: GoogleFonts.aBeeZee(
                                          fontSize: 20,
                                          color: Color.fromARGB(
                                              255, 110, 110, 110)))
                                ]),
                          ),
                        ],
                      )),
                  Container(
                    width: screenWidth * 0.2,
                    child: Image.asset("assets/startup.gif"),
                  ),
                ],
              )),
        ]),
      ))),
      backgroundColor: Colors.white,
    );
  }
}
