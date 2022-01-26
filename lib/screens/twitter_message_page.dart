import 'package:flutter/material.dart';
import 'package:twitter/models/user_model.dart';
import 'package:twitter/services/conversations_finder_by_id.dart';
import 'package:twitter/ui/widgets/appbar/appbar_ui/appbar.dart';
import 'package:twitter/ui/widgets/appbar/message_page_appbar.dart';
import 'package:twitter/ui/widgets/chat.dart';


class TwitterMessagePage extends StatefulWidget {
  const TwitterMessagePage({ Key? key }) : super(key: key);

  @override
  _TwitterMessagePageState createState() => _TwitterMessagePageState();
}

class _TwitterMessagePageState extends State<TwitterMessagePage> {
  @override
  Widget build(BuildContext context) {

    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxScrolled) => [
        const AppbarUI(appbaritems: MessagePageAppBar()),
      ],
      
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: ListView.builder(          
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: selectedUser.conversations.length,
          itemBuilder: (context, index) => Chat(conversation: conversationFinderbyId(id: selectedUser.conversations[index])),
        ),
      ),
    );
  }

    Future _refresh() {
    setState(() {});
    return Future.value(true);
  }
}


