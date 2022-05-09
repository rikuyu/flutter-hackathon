import 'dart:convert';

import 'package:flutter_hackathon/data/utils/constants.dart';
import 'package:flutter_hackathon/data/utils/utils.dart';
import 'package:flutter_hackathon/domain/entities/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../domain/data_source/remote/event_data_source.dart';
import '../../domain/entities/event.dart';

final eventDataSourceProvider = Provider((ref) => EventDataSourceImpl());

class EventDataSourceImpl implements EventDataSource {
  @override
  Future<Result> getEvents() async {
    try {
      final Uri url = Uri.parse(Constants.baseUrl);
      final response = await http.get(url);
      if (response.statusCode != 200) {
        return Failure(
            data: null, message: "Status Code ${response.statusCode}");
      }
      final Response data = Response.fromJson(json.decode(response.body));
      final List<Event?>? events = data.events;
      if (events == null) {
        return Failure(data: null, message: "Failure event null");
      } else {
        return Success(data: events, message: "Success");
      }
    } on FormatException catch (e) {
      return Failure(data: null, message: "Failure Format $e");
    } catch (e) {
      return Failure(data: null, message: "Error $e");
    }
  }
}
