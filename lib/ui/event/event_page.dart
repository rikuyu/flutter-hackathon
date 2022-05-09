import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon/ui/event/event_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventPage extends ConsumerWidget {
  const EventPage({Key? key, required this.controller}) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(eventViewModelProvider);
    final notifier = ref.read(eventViewModelProvider.notifier);

    return SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Container(
                color: Colors.orange,
                width: double.infinity,
                height: kToolbarHeight,
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
            Column(children: [
              Card(
                child: InkWell(
                  child: Column(
                    children: [
                      Wrap(children: [
                        Text("食と芸術を楽しむふじのくに⇄せかい演劇祭鑑賞ツアー",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ]),
                      Row(
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text("開催日 2022-04-30",
                                style: TextStyle(fontSize: 14)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://eventon.jp/uploads/2022/04/9a52501db4a0194ad121469cdffb5e0b.jpeg",
                          placeholder: (context, url) => Container(
                            height: 150,
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("【概要】", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Text(
                                "静岡　日本平周辺で、石垣イチゴや旬の食材を使った夕食、劇団SPACの公演をパッケージで楽しめる貸切バスツアーです！",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Card(
                child: InkWell(
                  child: Column(
                    children: [
                      Wrap(children: [
                        Text("食と芸術を楽しむふじのくに⇄せかい演劇祭鑑賞ツアー",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ]),
                      Row(
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text("開催日 2022-04-30",
                                style: TextStyle(fontSize: 14)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://eventon.jp/uploads/2022/04/9a52501db4a0194ad121469cdffb5e0b.jpeg",
                          placeholder: (context, url) => Container(
                            height: 150,
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("【概要】", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Text(
                                "静岡　日本平周辺で、石垣イチゴや旬の食材を使った夕食、劇団SPACの公演をパッケージで楽しめる貸切バスツアーです！",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Card(
                child: InkWell(
                  child: Column(
                    children: [
                      Wrap(children: [
                        Text("食と芸術を楽しむふじのくに⇄せかい演劇祭鑑賞ツアー",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ]),
                      Row(
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text("開催日 2022-04-30",
                                style: TextStyle(fontSize: 14)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://eventon.jp/uploads/2022/04/9a52501db4a0194ad121469cdffb5e0b.jpeg",
                          placeholder: (context, url) => Container(
                            height: 150,
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("【概要】", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Text(
                                "静岡　日本平周辺で、石垣イチゴや旬の食材を使った夕食、劇団SPACの公演をパッケージで楽しめる貸切バスツアーです！",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
              Card(
                child: InkWell(
                  child: Column(
                    children: [
                      Wrap(children: [
                        Text("食と芸術を楽しむふじのくに⇄せかい演劇祭鑑賞ツアー",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600))
                      ]),
                      Row(
                        children: [
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text("開催日 2022-04-30",
                                style: TextStyle(fontSize: 14)),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              "https://eventon.jp/uploads/2022/04/9a52501db4a0194ad121469cdffb5e0b.jpeg",
                          placeholder: (context, url) => Container(
                            height: 150,
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("【概要】", style: TextStyle(fontSize: 14)),
                        ],
                      ),
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            child: Text(
                                "静岡　日本平周辺で、石垣イチゴや旬の食材を使った夕食、劇団SPACの公演をパッケージで楽しめる貸切バスツアーです！",
                                style: TextStyle(fontSize: 14)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ),
            ]),
          ],
        ));
  }
}
