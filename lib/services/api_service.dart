import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:inducedyt/models/channel_model.dart';
import 'package:inducedyt/models/video_model.dart';

class APIService {
  APIService._instantiate();

  static final APIService instance = APIService._instantiate();

  final String _baseUrl = 'www.googleapis.com';
  String _nextPageToken = '';




  Future<List<Video>> search({required String word}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'q': word,
      'key': "AIzaSyDHaYtqlyjOIljQbfRvCxHgfSB3Jtn8DSQ",
      'type':"video"
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/search',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Channel
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];

      // Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      for (var json in videosJson) {
        videos.add(
          Video.fromMap(json['snippet']),
        );
      }
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<Channel> fetchChannel({required String channelId}) async {
    Map<String, String> parameters = {
      'part': 'snippet, contentDetails, statistics',
      'id': channelId,
      'key': "AIzaSyDHaYtqlyjOIljQbfRvCxHgfSB3Jtn8DSQ",
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/channels',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Channel
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body)['items'][0];
      Channel channel = Channel.fromMap(data);

      // Fetch first batch of videos from uploads playlist
      channel.videos = await fetchVideosFromPlaylist(
        playlistId: channel.uploadPlaylistId,
      );
      return channel;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  Future<List<Video>> fetchVideosFromPlaylist({required String playlistId}) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId,
      'maxResults': '8',
      'pageToken': _nextPageToken,
      'key': "AIzaSyDHaYtqlyjOIljQbfRvCxHgfSB3Jtn8DSQ",
    };
    Uri uri = Uri.https(
      _baseUrl,
      '/youtube/v3/playlistItems',
      parameters,
    );
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Playlist Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      _nextPageToken = data['nextPageToken'] ?? '';
      List<dynamic> videosJson = data['items'];

      // Fetch first eight videos from uploads playlist
      List<Video> videos = [];
      for (var json in videosJson) {
        videos.add(
          Video.fromMap(json['snippet']),
        );
      }
      return videos;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

}
