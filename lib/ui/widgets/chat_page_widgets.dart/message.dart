import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter/constants/asset_constants.dart';
import 'package:twitter/constants/color_constants.dart';
import 'package:twitter/core/init/create_users.dart';
import 'package:twitter/models/message_model.dart';
import 'package:twitter/services/user_finder_by_email.dart';

class MessageYouSent extends StatelessWidget {
  const MessageYouSent(
      {Key? key, required this.message, required this.addTimeToggle})
      : super(key: key);

  final bool addTimeToggle;
  final Message message;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: height * 0.005),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    message.text,
                    softWrap: true,
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.04),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (addTimeToggle)
          Text(
            message.sendingDateAsString(),
            style: TextStyle(
                color: ColorsConstant.lightBlack, fontSize: width * 0.03),
          ),
      ],
    );
  }
}

class MessageOppenentSent extends StatelessWidget {
  const MessageOppenentSent(
      {Key? key, required this.message, required this.addTimeToggle})
      : super(key: key);

  final Message message;
  final bool addTimeToggle;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Row(
      children: [
        CircleAvatar(
          radius: width * 0.06,
          backgroundImage: NetworkImage(
            userFinderByEmail(
              userEmail: message.emailWhoSent,
              list: users,
            ).userProfilePicture,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: height * 0.005),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: height * 0.06,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      margin: EdgeInsets.only(right: width * 0.02),
                      decoration: const BoxDecoration(
                        color: ColorsConstant.lightGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          message.text,
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.black, fontSize: width * 0.04),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: width * 0.06,
                        width: width * 0.06,
                        child: SvgPicture.asset(IconsConstant.chatPageMessageReactionIcon,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              if (addTimeToggle)
                Text(
                  message.sendingDateAsString(),
                  style: TextStyle(
                      color: ColorsConstant.lightBlack, fontSize: width * 0.03),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
