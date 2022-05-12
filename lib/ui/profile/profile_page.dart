import 'package:flutter/material.dart';
import 'package:flutter_hackathon/domain/entities/favorite_event.dart';
import 'package:flutter_hackathon/domain/entities/state/profile_state.dart';
import 'package:flutter_hackathon/ui/event/event_card.dart';
import 'package:flutter_hackathon/ui/profile/edit_profile_page.dart';
import 'package:flutter_hackathon/ui/profile/profile_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../login/log_in_page.dart';
import '../utils/utils.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileViewModelProvider);
    final notifier = ref.read(profileViewModelProvider.notifier);

    final List<Widget> favoriteEventsWidget = state.events
        .whereType<FavoriteEvent>()
        .toList()
        .map((e) => EventCard(
            event: null,
            addFavoriteEvent: null,
            deleteFavoriteEvent: notifier.deleteFavoriteEvent,
            favoriteEvent: e,
            isUseFavorite: true))
        .toList();

    Widget createProfileImage() {
      if (state.imageUrl != null) {
        return Container(
            transform: Matrix4.translationValues(0, -32, 0),
            width: 80,
            height: 80,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(state.imageUrl!)));
      } else {
        return Container(
            transform: Matrix4.translationValues(0, -32, 0),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 4),
                color: Colors.grey,
                shape: BoxShape.circle));
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Container(
                color: Colors.orange,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'images/event_icon.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 12, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                createProfileImage(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          primary: Colors.orangeAccent),
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EditProfilePage()));
                        notifier.getProfileData();
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 2, 0, 0),
                  child: SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          primary: Colors.orangeAccent),
                      onPressed: () async {
                        final result = await ref
                            .read(profileViewModelProvider.notifier)
                            .logOut();
                        if (result == true) {
                          Utils.showSnackBar(
                              context, "Success", Colors.greenAccent);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LogInPage(),
                            ),
                            (route) => false,
                          );
                        } else {
                          Utils.showSnackBar(
                              context, "Error", Colors.redAccent);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                        child: Icon(Icons.logout, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          _profileBio(state),
          SizedBox(height: 2, child: Container(color: Colors.orangeAccent)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Material(
                    child: Text("いいねしたイベント", style: TextStyle(fontSize: 16))),
              ],
            ),
          ),
          SizedBox(height: 2, child: Container(color: Colors.orangeAccent)),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                notifier.getFavoriteEvents();
              },
              child: SingleChildScrollView(
                child: state.isLoading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Center(
                            child: CircularProgressIndicator(
                                color: Colors.cyanAccent),
                          ),
                        ],
                      )
                    : state.events.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                            child: Material(
                                child: Text("いいねしたイベントがありません",
                                    style: TextStyle(fontSize: 16))),
                          )
                        : Column(children: favoriteEventsWidget),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _profileBio(ProfileState state) {
    return Container(
      transform: Matrix4.translationValues(0, -18, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Material(
                  child: Text(state.name.isEmpty ? "Flutter太郎" : state.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined,
                    color: Colors.orangeAccent),
                Text(Utils.createPrefectureName(state.prefecture),
                    style: const TextStyle(fontSize: 16)),
                const Spacer()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Wrap(children: [
              Material(
                child: Text(
                    state.description.isEmpty
                        ? "私はイベントによく参加する大学生です。コロナが収束したので、いろんな人とオフラインでイベントに参加したいと思っています。よろしくお願いします。"
                        : state.description,
                    style: const TextStyle(fontSize: 16)),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
