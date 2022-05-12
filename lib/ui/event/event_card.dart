import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hackathon/domain/entities/favorite_event.dart';

import '../../data/utils/utils.dart';
import '../../domain/entities/event.dart';
import '../utils/utils.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    Key? key,
    required this.event,
    required this.favoriteEvent,
    required this.addFavoriteEvent,
    required this.deleteFavoriteEvent,
    required this.isUseFavorite,
  }) : super(key: key);

  final Event? event;
  final FavoriteEvent? favoriteEvent;
  final Future<Result<dynamic>> Function(Event)? addFavoriteEvent;
  final Future<Result<dynamic>> Function(FavoriteEvent)? deleteFavoriteEvent;
  final bool isUseFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Wrap(children: [
                Text(
                    isUseFavorite
                        ? favoriteEvent!.title.toString()
                        : event!.title.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600))
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Row(
                  children: [
                    const Spacer(),
                    const Icon(Icons.location_on_outlined,
                        color: Colors.orangeAccent),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                          isUseFavorite
                              ? favoriteEvent!.address.toString().length >= 15
                                  ? favoriteEvent!.address
                                      .toString()
                                      .substring(0, 15)
                                  : favoriteEvent!.address.toString()
                              : event!.address.toString().length >= 15
                                  ? event!.address.toString().substring(0, 15)
                                  : event!.address.toString(),
                          style: const TextStyle(fontSize: 14)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Spacer(),
                    const Icon(Icons.calendar_today_outlined,
                        color: Colors.orangeAccent),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(
                          Utils.convertDate(isUseFavorite
                              ? favoriteEvent!.startedAt.toString()
                              : event!.startedAt.toString()),
                          style: const TextStyle(fontSize: 14)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CachedNetworkImage(
                  imageUrl: isUseFavorite
                      ? favoriteEvent!.imagePath.toString()
                      : event!.imagePath.toString(),
                  placeholder: (context, url) => Container(
                    height: isUseFavorite ? 150 : 110,
                    color: Colors.grey[200],
                    child: const Center(
                      child:
                          CircularProgressIndicator(color: Colors.cyanAccent),
                    ),
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.pinkAccent),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text("【概要】", style: TextStyle(fontSize: 14)),
                ],
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                    child: Text(
                        isUseFavorite
                            ? favoriteEvent!.summary.toString()
                            : event!.summary.toString(),
                        style: const TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: IconButton(
                        onPressed: () async {
                          final data = ClipboardData(
                              text: isUseFavorite
                                  ? favoriteEvent!.eventUrl.toString()
                                  : event!.eventUrl.toString());
                          await Clipboard.setData(data);
                          Utils.showSnackBar(
                              context, "イベントリンクをコピーしました", Colors.blueAccent);
                        },
                        icon: const Icon(Icons.link_sharp,
                            color: Colors.blueAccent)),
                  ),
                  IconButton(
                      onPressed: () async {
                        final Result result;
                        if (isUseFavorite) {
                          result = await deleteFavoriteEvent!(favoriteEvent!);
                          if (result is Failure) {
                            Utils.showSnackBar(
                                context, result.message, Colors.redAccent);
                          }
                        } else {
                          result = await addFavoriteEvent!(event!);
                          if (result is Success) {
                            Utils.showSnackBar(
                                context, result.message, Colors.greenAccent);
                          }
                        }
                      },
                      icon:
                          const Icon(Icons.favorite, color: Colors.pinkAccent))
                ],
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
