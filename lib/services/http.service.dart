import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nasa/models/apod.dart';
import 'package:http/http.dart' as http;
import 'package:nasa/models/asset.dart';

class HttpService {
  final String apiKey = dotenv.env['API_KEY']!;
  final String apod = 'https://api.nasa.gov/planetary/apod';
  final String asset = 'https://images-api.nasa.gov/asset/';
  final String earthPhoto = 'https://images-api.nasa.gov/asset/PIA00122';
  final String moonPhoto =
      'https://images-api.nasa.gov/asset/GSFC_20171208_Archive_e001861';
  final String marsPhoto = 'https://images-api.nasa.gov/asset/PIA04591';

  HttpService();

  String _buildUrl(String url) {
    return '$url?api_key=$apiKey';
  }

  String _getApodUrl() => _buildUrl(apod);
  String _getMoon() => _buildUrl(moonPhoto);
  String _getMars() => _buildUrl(marsPhoto);
  String _getEarth() => _buildUrl(earthPhoto);

  Future<Apod> getApod() async {
    var apodJson = await _getAsset(_getApodUrl());
    var apod = Apod.fromJson(apodJson);

    return apod;
  }

  Future<Asset> getEarth() async {
    var json = await _getAsset(_getEarth());
    var asset = Asset.fromJson(json);

    return asset;
  }

  Future<Asset> getMars() async {
    var json = await _getAsset(_getMars());
    var asset = Asset.fromJson(json);

    return asset;
  }

  Future<Asset> getMoon() async {
    var json = await _getAsset(_getMoon());
    var asset = Asset.fromJson(json);

    return asset;
  }

  Future<dynamic> _getAsset(String url) async {
    var parsedUrl = Uri.parse(url);
    var response = await http.get(parsedUrl);

    return jsonDecode(response.body);
  }
}
