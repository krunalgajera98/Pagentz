import 'package:bndemo/features/home/domain/entities/team_model.dart';
import 'package:bndemo/features/home/presentation/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamController extends GetxController {
  RxString selectedString = 'Teams'.obs;
  RxBool showCreateDrawer = false.obs;
  final TextEditingController teamNameController = TextEditingController();
  final TextEditingController existingUsersController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  RxList<TeamModel> teamsList = [
    TeamModel(name: 'Operations Team(Sample)', members: '1'),
  ].obs;

  void openCreateDrawer() {
    showCreateDrawer.value = true;
  }

  void closeCreateDrawer() {
    showCreateDrawer.value = false;
  }
}
