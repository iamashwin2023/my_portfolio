import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_emoji/animated_emoji.dart';

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
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "HOME",
                  style:
                      TextStyle(fontSize: actionButtonSize, color: fontColor),
                )),
            SizedBox(
              width: 30,
            ),
            TextButton(
                onPressed: () {},
                child: Text("ABOUT",
                    style: TextStyle(
                        fontSize: actionButtonSize, color: fontColor))),
            SizedBox(
              width: 30,
            ),
            TextButton(
                onPressed: () {},
                child: Text("SERVICE",
                    style: TextStyle(
                        fontSize: actionButtonSize, color: fontColor))),
            SizedBox(
              width: 30,
            ),
            TextButton(
                onPressed: () {},
                child: Text("PROJECT",
                    style: TextStyle(
                        fontSize: actionButtonSize, color: fontColor))),
            SizedBox(
              width: 30,
            ),
            TextButton(
                onPressed: () {},
                child: Text("CONTACT",
                    style: TextStyle(
                        fontSize: actionButtonSize, color: fontColor))),
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
                      style: TextStyle(
                          fontSize: actionButtonSize, color: fontColor))),
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
          child: Row(children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Image.asset(
                  'assets/imgpsh_fullsize_anim.jpg',
                  color: Colors.white.withOpacity(0.5),
                  colorBlendMode: BlendMode.softLight,
                )),
            Expanded(
                child: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      "WELCOME TO MY PORTFOLIO",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 3.0),
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
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                        fontFamily: ''),
                  ),
                ])))
          ]),
        ))));
  }
}
