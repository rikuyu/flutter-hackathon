import 'dart:io';

import 'package:flutter_hackathon/data/repository/event_repository_impl.dart';
import 'package:flutter_hackathon/domain/entities/favorite_event.dart';
import 'package:flutter_hackathon/domain/repository/event_respository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/repository/user_respotiory_impl.dart';
import '../../data/utils/utils.dart';
import '../../domain/entities/profile.dart';
import '../../domain/entities/state/profile_state.dart';
import '../../domain/repository/user_repository.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileState>((ref) =>
        ProfileViewModel(
            userRepository: ref.read(userRepositoryProvider),
            eventRepository: ref.read(eventRepositoryProvider)));

class ProfileViewModel extends StateNotifier<ProfileState> {
  ProfileViewModel(
      {required UserRepository userRepository,
      required EventRepository eventRepository})
      : _userRepository = userRepository,
        _eventRepository = eventRepository,
        super(const ProfileState(events: [])) {
    getFavoriteEvents();
    getProfileData();
  }

  final UserRepository _userRepository;
  final EventRepository _eventRepository;
  final ImagePicker picker = ImagePicker();

  void startLoading() => state = state.copy(isLoading: true);

  void endLoading() => state = state.copy(isLoading: false);

  void setFavoriteEvents(List<FavoriteEvent> events) =>
      state = state.copy(events: events);

  void setProfileName(String name) => state = state.copy(name: name);

  void setProfileDescription(String d) => state = state.copy(description: d);

  void setProfileImage(String imageUrl) =>
      state = state.copy(imageUrl: imageUrl);

  void setProfilePrefecture(int p) => state = state.copy(prefecture: p);

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      state = state.copy(imageFile: File(pickedFile.path));
    }
  }

  String? getCurrentUserId() {
    final result = _userRepository.getCurrentUserId();
    if (result is Success) {
      return result.data;
    } else {
      return null;
    }
  }

  Future<Result> updateProfile() async {
    final uid = getCurrentUserId();
    startLoading();
    if (state.name.isEmpty || state.description.isEmpty) {
      return Failure(data: "empty-item", message: "Failure");
    }
    if (state.name.length > 15) {
      return Failure(data: "name_max_length", message: "Failure");
    }
    if (state.description.length > 200) {
      return Failure(data: "description_max_length", message: "Failure");
    }
    if (uid == null) {
      return Failure(data: "user-not-found", message: "Failure");
    }
    if (state.imageFile != null) {
      final updateImageResult =
          await _userRepository.updateProfileImage(uid, state.imageFile!);
      if (updateImageResult is Success) {
        final profile = Profile(
            name: state.name,
            description: state.description,
            imageUrl: updateImageResult.data,
            prefecture: state.prefecture);
        setProfileImage(updateImageResult.data);
        return await _userRepository.updateProfile(uid, profile);
      }
    } else {
      final profile = Profile(
          name: state.name,
          description: state.description,
          imageUrl: null,
          prefecture: state.prefecture);
      return await _userRepository.updateProfile(uid, profile);
    }
    return Failure(data: "unknown-error", message: "Failure");
  }

  Future<void> getProfileData() async {
    final userId = getCurrentUserId();
    if (userId == null) return;
    final result = await _userRepository.getProfileData(userId);
    if (result is Success) {
      final profile = result.data;
      if (profile is Profile) {
        if (profile.name != null) {
          setProfileName(profile.name!);
        }
        if (profile.description != null) {
          setProfileDescription(profile.description!);
        }
        if (profile.imageUrl != null) {
          setProfileImage(profile.imageUrl!);
        }
      }
    }
  }

  Future<Result> getFavoriteEvents() async {
    startLoading();
    final userId = getCurrentUserId();
    if (userId == null) {
      endLoading();
      return Failure(data: null, message: "未ログインユーザー");
    }
    final result = await _eventRepository.getFavoriteEvents(userId);
    if (result is Success) {
      setFavoriteEvents(result.data);
      endLoading();
      return Success(data: null, message: result.message);
    }
    endLoading();
    return Failure(data: null, message: result.message);
  }

  Future<Result> deleteFavoriteEvent(FavoriteEvent event) async {
    final userId = getCurrentUserId();
    if (userId == null) {
      return Failure(data: null, message: "未ログインユーザー");
    }
    final result = await _eventRepository.deleteFavoriteEvent(userId, event);
    if (result is Success) {
      return await getFavoriteEvents();
    }
    return Failure(data: null, message: result.message);
  }

  Future<bool> logOut() async {
    startLoading();
    final result = await _userRepository.logOut();
    if (result is Success) {
      endLoading();
      return true;
    } else {
      endLoading();
      return false;
    }
  }
}
