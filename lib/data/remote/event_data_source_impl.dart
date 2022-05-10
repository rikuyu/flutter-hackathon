import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hackathon/data/utils/constants.dart';
import 'package:flutter_hackathon/data/utils/utils.dart';
import 'package:flutter_hackathon/domain/entities/favorite_event.dart';
import 'package:flutter_hackathon/domain/entities/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../domain/data_source/remote/event_data_source.dart';
import '../../domain/entities/event.dart';

final eventDataSourceProvider = Provider((ref) => EventDataSourceImpl());

class EventDataSourceImpl implements EventDataSource {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

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

  @override
  Future<Result> addFavoriteEvent(String userId, FavoriteEvent event) async {
    try {
      await _store
          .collection("member")
          .doc(userId)
          .collection("favorite_event")
          .doc(event.id)
          .set(FavoriteEvent.toMap(event));
      return Success(data: null, message: "いいねしました");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "Error");
    }
  }

  @override
  Future<Result> getFavoriteEvents(String userId) async {
    try {
      final QuerySnapshot snapshot = await _store
          .collection("member")
          .doc(userId)
          .collection("favorite_event")
          .get();
      final List<QueryDocumentSnapshot<Object?>> data = snapshot.docs;
      final List<FavoriteEvent> events = data.map((DocumentSnapshot doc) {
        Map<String, dynamic> event = doc.data()! as Map<String, dynamic>;
        return FavoriteEvent.fromJson(event, doc.id);
      }).toList();
      return Success(data: events, message: "Success");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "Error");
    }
  }

  @override
  Future<Result> deleteFavoriteEvent(String userId, FavoriteEvent event) async {
    try {
      await _store
          .collection("member")
          .doc(userId)
          .collection("favorite_event")
          .doc(event.id)
          .delete();
      return Success(data: null, message: "Success");
    } on FirebaseAuthException catch (e) {
      return Failure(data: e.code, message: "Error");
    }
  }
}
