import 'package:flutter/material.dart';
import 'package:flutter_hackathon/ui/event/event_item_card.dart';
import 'package:flutter_hackathon/ui/event/event_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/event.dart';
import '../utils/utils.dart';

class EventPage extends ConsumerWidget {
  const EventPage({Key? key, required this.controller}) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(eventViewModelProvider);
    final notifier = ref.read(eventViewModelProvider.notifier);

    final List<Widget> eventsWidget = state.events
        .whereType<Event>()
        .toList()
        .map((e) => EventItemCard(
            event: e,
            addFavoriteEvent: notifier.addFavoriteEvent,
            deleteFavoriteEvent: null,
            favoriteEvent: null,
            isUseFavorite: false))
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        controller: controller,
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!state.isLoading)
                Container(
                    color: Colors.orange,
                    width: double.infinity,
                    height: kToolbarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 40,
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'images/event_icon.png',
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: IconButton(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    barrierDismissible: true,
                                    builder: (_) {
                                      return AlertDialog(
                                          title: const Text("開催地を選択",
                                              style: TextStyle(
                                                  color: Colors.orange)),
                                          content: SizedBox(
                                              width: double.maxFinite,
                                              child: ListView.builder(
                                                itemCount: 48,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                    title: Text(
                                                      Utils
                                                          .createPrefectureName(
                                                              index),
                                                      style: TextStyle(
                                                          color:
                                                              state.prefecture ==
                                                                      index
                                                                  ? Colors
                                                                      .orange
                                                                  : Colors
                                                                      .black),
                                                    ),
                                                    onTap: () {
                                                      notifier
                                                          .setEventPrefecture(
                                                              index);
                                                      notifier.getEvents();
                                                      Navigator.pop(context);
                                                    },
                                                  );
                                                },
                                              )));
                                    },
                                  );
                                },
                                icon: const Icon(Icons.filter_list,
                                    color: Colors.white))),
                      ],
                    )),
              eventsWidget.isEmpty && !state.isLoading
                  ? const Center(
                      child: Text("イベントがありません",
                          style: TextStyle(color: Colors.orange, fontSize: 18)),
                    )
                  : Column(children: eventsWidget),
              const SizedBox(height: 30)
            ],
          ),
          if (state.isLoading)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ],
            )
        ]),
      ),
    );
  }
}
