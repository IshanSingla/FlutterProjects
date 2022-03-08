import 'package:flutter/material.dart';
import 'package:inducedyt/models/channel_model.dart';
import 'package:inducedyt/models/video_model.dart';
import 'package:inducedyt/screens/video_screen.dart';
import 'package:inducedyt/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC70es7_K577MiqO340d8S7A');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: const EdgeInsets.all(10.0),
        height: 140.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text('InducedYt'),

        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: MySearchDelegate()
              );
            },
            icon: const Icon(Icons.cast_connected),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: MySearchDelegate()
              );
            },
            icon: const Icon(Icons.notifications_none),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: MySearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              showSearch(
                  context: context, delegate: MySearchDelegate()
              );
            },
            icon: const Icon(Icons.person_pin),
          )
        ],

      ),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel.videos.length != int.parse(_channel.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel.videos.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return _buildProfileInfo();
                  }
                  Video video = _channel.videos[index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.business),
            label: 'Subscriptions',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_add_outlined),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
class MySearchDelegate extends SearchDelegate {
  List<String> suggestion = [
    "Induced",
    "Induced Tech",
    "Induced Official",
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: (){
      close(context, null);
    },
    //onPressed: () => close(context, null); // close
  );


  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          }
          else {
            query='';
          }
        },
        icon: const Icon(Icons.clear))
  ];



  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query
    )
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestion = [
      "Induced",
      "Induced Tech",
      "Induced Official",
    ];
    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query=suggestion[index];
            Center(
                child: Text(
                    query
                )

            );
          },
          title: Text(suggestion[index]),
        );
      },
    );
  }
}