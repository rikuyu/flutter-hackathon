import 'package:flutter/material.dart';
import 'package:flutter_hackathon/ui/profile/profile_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/utils/utils.dart';
import '../utils/utils.dart';

class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileViewModelProvider);
    final notifier = ref.read(profileViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "プロフィールの編集",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                child: SizedBox(
                  height: 150,
                  width: 100,
                  child: state.imageFile != null
                      ? Container(
                          width: 80,
                          height: 80,
                          child: Image.file(state.imageFile!),
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle))
                      : Container(
                          width: 80,
                          height: 80,
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle)),
                ),
                onTap: () async {
                  await notifier.pickImage();
                },
              ),
              TextField(
                decoration: const InputDecoration(labelText: "ユーザーネーム"),
                onChanged: (name) {
                  notifier.setProfileName(name);
                },
              ),
              const SizedBox(height: 8),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: const InputDecoration(labelText: "あいさつ"),
                onChanged: (description) {
                  notifier.setProfileDescription(description);
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                child: Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        color: Colors.orangeAccent),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: Text(Utils.createPrefectureName(state.prefecture),
                          style: const TextStyle(fontSize: 16)),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (_) {
                              return AlertDialog(
                                  title: const Text("都道府県を選択", style: TextStyle(color: Colors.orange)),
                                  content: SizedBox(
                                      width: double.maxFinite,
                                      child: ListView.builder(
                                        itemCount: 47,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(
                                              Utils.createPrefectureName(
                                                  index + 1),
                                              style: TextStyle(
                                                  color: state.prefecture ==
                                                          index + 1
                                                      ? Colors.orange
                                                      : Colors.black),
                                            ),
                                            onTap: () {
                                              notifier.setProfilePrefecture(
                                                  index + 1);
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                      )));
                            },
                          );
                        },
                        icon:
                            const Icon(Icons.edit, color: Colors.orangeAccent)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: SizedBox(
                  width: double.infinity,
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
                      ),
                      onPressed: () async {
                        final result = await notifier.updateProfile();
                        notifier.endLoading();
                        if (result is Success) {
                          Utils.showSnackBar(
                              context, result.message, Colors.greenAccent);
                          Navigator.pop(context);
                        } else {
                          Utils.showSnackBar(
                              context,
                              Utils.createAuthErrorMessage(result.data),
                              Colors.redAccent);
                        }
                      },
                      child: const Text("更新",
                          style: TextStyle(color: Colors.white))),
                ),
              )
            ],
          ),
        ),
        if (state.isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: CircularProgressIndicator(),
            ),
          )
      ])),
    );
  }
}
