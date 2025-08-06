import 'package:bndemo/features/home/presentation/controller/team_controller.dart';
import 'package:bndemo/features/home/presentation/pages/create_team_drawer.dart';
import 'package:bndemo/features/home/presentation/pages/teams_content.dart';
import 'package:bndemo/features/home/presentation/widgets/side_bar.dart';
import 'package:bndemo/features/home/presentation/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  TeamController controller = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TopBar(),
              const Divider(
                thickness: 0.5,
                color: Colors.grey,
                height: 0,
              ),
              Expanded(
                child: Row(
                  children: [
                    Sidebar(),
                    const VerticalDivider(
                      width: 10,
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                              child: TeamsContent(onCreate: controller.openCreateDrawer),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Obx(
            () => controller.showCreateDrawer.value
                ? Align(
                    alignment: Alignment.centerRight,
                    child: CreateTeamDrawer(onClose: controller.closeCreateDrawer),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
