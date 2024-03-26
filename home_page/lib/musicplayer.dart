import 'package:flutter/material.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key, required this.control});

  final PageController control;
  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  double _sliderValue = 120;
  String formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  bool pause = false;
  bool fav = false;
  bool suffle = false;
  bool loop = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
          ),
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.pink[400],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3), // Shadow color
                    spreadRadius: 3, // Spread radius
                    blurRadius: 12, // Blur radius
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
          ),
          Expanded(
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.keyboard_arrow_down_sharp,
                          size: 25, color: Colors.white),
                      const Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Center(
                          child: Text(
                            "Now Playing",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            widget.control.animateToPage(1,
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.linear);
                          },
                          child: const Icon(Icons.menu,
                              size: 25, color: Colors.white))
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3), // Shadow color
                        spreadRadius: 3, // Spread radius
                        blurRadius: 12, // Blur radius
                        offset: const Offset(0, 2),
                      )
                    ]),
                    // padding: EdgeInsets.symmetric(horizontal: 30),
                    width: 320,
                    height: 320,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'images/badass.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.shuffle_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.skip_previous_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.pink[400],
                          boxShadow: [
                            BoxShadow(
                              color:
                                  Colors.white.withOpacity(0.3), // Shadow color
                              spreadRadius: 4, // Spread radius
                              blurRadius: 12, // Blur radius
                              offset: const Offset(0, 0),
                            )
                          ],
                          shape: BoxShape.circle),
                      child: InkWell(
                        onTap: () {
                          if (pause == false) {
                            setState(() {
                              pause = true;
                            });
                          } else {
                            setState(() {
                              pause = false;
                            });
                          }
                        },
                        child: Icon(
                          pause
                              ? Icons.pause_circle_filled_rounded
                              : Icons.play_circle_filled_rounded,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.skip_next_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                    InkWell(
                      onTap: () {
                        if (suffle && !loop) {
                          setState(() {
                            suffle = false;
                            loop = true;
                          });
                        } else if (!suffle && loop) {
                          setState(() {
                            suffle = false;
                            loop = false;
                          });
                        } else {
                          setState(() {
                            suffle = true;
                            loop = false;
                          });
                        }
                      },
                      child: suffle
                          ? const Icon(
                              Icons.repeat_one_rounded,
                              size: 30,
                              color: Colors.white,
                            )
                          : loop
                              ? const Icon(
                                  Icons.repeat_rounded,
                                  size: 30,
                                  color: Colors.white,
                                )
                              : Image.asset(
                                  'images/shuffle-off.png',
                                  width: 30,
                                ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListTile(
                    title: const Text(
                      "Badass(LEO)",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    subtitle: const Text(
                      "Aniruth",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    trailing: InkWell(
                      onTap: () {
                        if (fav == false) {
                          setState(() {
                            fav = true;
                          });
                        } else {
                          setState(() {
                            fav = false;
                          });
                        }
                      },
                      child: Icon(
                        size: 35,
                        fav
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        color: fav ? Colors.pink[400] : Colors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 240,

                      label: formatTime(_sliderValue.round()),
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                      activeColor: Colors.pink[400],

                      inactiveColor: Colors
                          .grey, // Optional: Customize the inactive track color.
                      thumbColor:
                          Colors.white, // Optional: Customize the thumb color.
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Text(
                            formatTime(_sliderValue.round()),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 60,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.keyboard_double_arrow_up_rounded,
                      size: 30,
                      color: Colors.grey,
                    ),
                    Text(
                      "LYRICS",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.pink[400],
                      child: const ListTile(
                        title: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Lyrics",
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.grey,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                        subtitle: Text(
                          "A Material Design card: a panel with slightly rounded corners and an elevation shadow.A card is a sheet of Material used to represent some related information, for example an album, a geographical location, a meal, contact details, etc.This is what it looks like when run",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
