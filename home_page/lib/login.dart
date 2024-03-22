// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                      "Shipping Details",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
                width: 280,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Basic Info",
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.circle_rounded,
                          color: Colors.green[700],
                          size: 25,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 80,
                      width: 100,
                      child: Column(
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
                                ),
                                Icon(
                                  Icons.circle_rounded,
                                  size: 15,
                                ),
                                Icon(
                                  Icons.circle_rounded,
                                  size: 15,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // Icon(
                    //   Icons.circle_rounded,
                    //   size: 15,
                    // ),
                    // Icon(
                    //   Icons.circle_rounded,
                    //   size: 15,
                    // ),
                    // Icon(
                    //   Icons.circle_rounded,
                    //   size: 15,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Basic Info",
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(
                          Icons.circle_rounded,
                          color: Colors.green[700],
                          size: 25,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                width: 350,
                color: Colors.amber,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        controller: nameController,
                        onSubmitted: (value) {
                          log(value);
                        },
                        decoration:
                            InputDecoration(enabledBorder: InputBorder.none),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
