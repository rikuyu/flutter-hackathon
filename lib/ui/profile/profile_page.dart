import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: 100,
          child: Container(color: Colors.red),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 0, 12, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  transform: Matrix4.translationValues(0, -34, 0),
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              "https://pics.prcm.jp/b02640d0c5d8a/82625399/jpeg/82625399.jpeg")))),
              const Spacer(),
              _profileButton(Icons.edit),
              _profileButton(Icons.logout)
            ],
          ),
        ),
        _profileBio(),
        SizedBox(height: 2, child: Container(color: Colors.orangeAccent)),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // favorite event
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _profileButton(IconData icon) {
    return Padding(
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
          onPressed: () async {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _profileBio(){
    return Container(
      transform: Matrix4.translationValues(0, -18, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text("User Name", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: Wrap(children: const [
              Text(
                  "私はイベントによく参加する大学生です。コロナが収束したので、いろんな人とオフラインでイベントに参加したいと思っています。よろしくお願いします。")
            ]),
          ),
        ],
      ),
    );
  }
}
