// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, avoid_unnecessary_containers

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_page/login.dart';

class AddressTab extends StatefulWidget {
  const AddressTab({super.key});
  @override
  State<AddressTab> createState() => _AddressTabState();
}

class _AddressTabState extends State<AddressTab> {
  final TextEditingController street = TextEditingController();
  final TextEditingController building_no = TextEditingController();
  final TextEditingController appartment_no = TextEditingController();
  final TextEditingController city = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 30,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new,
                          ),
                        )),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 50),
                        child: Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 20,
                    )
                  ],
                ),
                Container(
                  height: height / 9,
                  padding: EdgeInsets.symmetric(
                    horizontal: width / 7,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Basic Info",
                            style: TextStyle(
                              fontSize: 15,
                              // color: Color.fromARGB(255, 16, 179, 25),
                            ),
                          ),
                          Icon(
                            Icons.circle_rounded,
                            color: Colors.grey[500],
                            size: 25,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 25,
                            width: 100,
                          ),
                          SizedBox(
                            height: 30,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.circle_rounded,
                                  size: 15,
                                  color: Colors.grey[500],
                                ),
                                Icon(
                                  Icons.circle_rounded,
                                  size: 15,
                                  color: Colors.grey[500],
                                ),
                                Icon(
                                  Icons.circle_rounded,
                                  size: 15,
                                  color: Colors.grey[500],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 16, 179, 25),
                            ),
                          ),
                          Icon(
                            Icons.circle_rounded,
                            color: Color.fromARGB(255, 16, 179, 25),
                            size: 25,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  // color: Colors.amber,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        textbox(
                            width: double.infinity,
                            eg: "eg.: Winston st.",
                            hint: "Street",
                            title: "Street",
                            controller: street),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textbox(
                                width: width / 2.4,
                                eg: "eg.: 14",
                                hint: "Building Number",
                                title: "Building No.",
                                controller: building_no),
                            textbox(
                                width: width / 2.4,
                                eg: "eg.: 54",
                                hint: "Appartment Number",
                                title: "Appartment No.",
                                controller: appartment_no),
                          ],
                        ),
                        textbox(
                            width: double.infinity,
                            eg: "eg.: London",
                            hint: "City",
                            title: "City",
                            controller: city),
                        textbox(
                            width: double.infinity,
                            eg: "eg.: 192-782",
                            hint: "_ _ _ - _ _ _",
                            title: "Postal Code",
                            controller: street),
                      ]),
                ),
                Container(
                  height: 170,
                  width: double.infinity,
                  // color: Color.fromARGB(255, 0, 0, 0),
                  child: Center(
                    child: Container(
                      height: 55,
                      width: 350,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 16, 179, 25),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        "Submit Form",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  textbox(
      {String? title,
      TextEditingController? controller,
      String? hint,
      String? eg,
      double? width}) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7),
          child: Container(
            height: 50,
            width: width!,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              onSubmitted: (value) {
                log(value);
              },
              cursorColor: const Color.fromARGB(255, 0, 0, 0),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none, // Remove the border color
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                hintText: hint!,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              eg!,
              style: TextStyle(color: Colors.black38),
            ),
          ],
        ),
      ],
    );
  }
}
