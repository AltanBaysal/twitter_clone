import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/assets/constatns.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Column(
          children: [
            Text(
              "User1",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "@User1",
              style: TextStyle(color: Colors.grey, fontSize: width * 0.035),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/information.svg"),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: height * 0.015, bottom: height * 0.03),
                  child: Column(
                    children: [
                      //row builder olmaması gerektiğini biliyorum :(
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "User1",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            "@User1",
                            style: TextStyle(
                                fontSize: width * 0.034, color: Colors.blue),
                          )
                        ],
                      ),

                      Text("User1 bio",
                          style: TextStyle(
                              fontSize: width * 0.034, color: Colors.black)),

                      Text("6 Following 1 Followers"),

                      Text("Joined September 2021"),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: width * 0.03),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: width * 0.06,
                            backgroundImage: const NetworkImage(
                                "https://i.pinimg.com/originals/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: width * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.05,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: width * 0.03),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Hello",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                const Text("Tuesday, 17:45"),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            iconSize: width * 0.03,
                            icon: SvgPicture.asset("assets/icons/heart.svg"),
                          )
                        ],
                      ),
                    ),
                   
                    Container(
                      margin: EdgeInsets.only(right: width * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: height * 0.05,
                                margin: EdgeInsets.only(left: width * 0.03,bottom: height*0.01),
                                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Hello",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const Text("Tuesday, 17:45"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
         
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            height: height * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: width*0.06,
                    width:  width*0.06,
                    child: SvgPicture.asset("assets/icons/image.svg",fit: BoxFit.cover,color: Colors.blue,),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: width*0.06,
                    width:  width*0.06,
                    child: SvgPicture.asset("assets/icons/gif.svg",fit: BoxFit.cover,color: Colors.blue,),
                  ),
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.05),
                  width: width * 0.5,
                  child: const TextField(
                    decoration: InputDecoration(hintText: "Start a message"),
                  ),
                ),

                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: width*0.08,
                    width:  width*0.08,
                    child: SvgPicture.asset("assets/icons/soundwaves.svg",fit: BoxFit.cover)
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
