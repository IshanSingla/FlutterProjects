import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../pages/calls.dart';
import '../pages/camera.dart';
import '../pages/chats.dart';
import '../pages/status.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription> cameras;
  // ignore: use_key_in_widget_constructors
  const WhatsAppHome({required this.cameras});

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        elevation: 1,
        backgroundColor: const Color(0xff075E54),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
        actions: const <Widget>[
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(widget.cameras),
          const ChatScreen(),
          const StatusScreen(),
          const CallsScreen(),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () => print("Open Chats"),
      )
          : null,
    );
  }
}