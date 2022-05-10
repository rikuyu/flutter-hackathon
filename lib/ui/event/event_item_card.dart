import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/utils/utils.dart';
import '../../domain/entities/event.dart';
import '../utils/utils.dart';

class EventItemCard extends StatelessWidget {
  const EventItemCard(
      {Key? key, required this.event, required this.addFavoriteEvent})
      : super(key: key);

  final Event event;
  final Future<Result<dynamic>> Function(Event) addFavoriteEvent;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Wrap(children: [
                Text(event.title.toString(),
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
                      child: Text(event.address.toString(),
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
                      child: Text(Utils.convertDate(event.startedAt.toString()),
                          style: const TextStyle(fontSize: 14)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: CachedNetworkImage(
                  imageUrl: event.imagePath.toString(),
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
                children: const [
                  Text("【概要】", style: TextStyle(fontSize: 14)),
                ],
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                    child: Text(event.summary.toString(),
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
                        onPressed: () {},
                        icon: const Icon(Icons.link_sharp,
                            color: Colors.blueAccent)),
                  ),
                  IconButton(
                      onPressed: () async {
                        final result = await addFavoriteEvent(event);
                        if (result is Failure) {
                          Utils.showSnackBar(
                              context, result.message, Colors.redAccent);
                        } else {
                          Utils.showSnackBar(
                              context, result.message, Colors.greenAccent);
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
