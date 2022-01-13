import 'package:flutter/material.dart';
import 'package:twitter/screens/chat_page.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatPage()),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: height * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: width * 0.08,
                  backgroundImage: const NetworkImage(
                      "https://i.pinimg.com/originals/d9/56/9b/d9569bbed4393e2ceb1af7ba64fdf86a.jpg"),
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "User1",
                        style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold),
                      ),
                      Text("LastMessage", softWrap: true)
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.01),
              alignment: Alignment.topRight,
              child: const Text("1d"),
            ),
          ],
        ),
      ),
    );
  }
}
