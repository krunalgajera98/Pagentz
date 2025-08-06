import 'package:bndemo/features/home/presentation/controller/team_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Sidebar extends StatelessWidget {
  TeamController controller = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _SidebarIcon(icon: Icons.warning_amber_rounded, text: 'Incidents'),
                  _SidebarIcon(icon: Icons.notifications, text: 'Alerts'),
                  _SidebarIcon(icon: Icons.group, text: 'Teams'),
                  const SizedBox(height: 12),
                  const Divider(thickness: 0.2, height: 0, color: Colors.grey),
                  _SidebarIcon(icon: Icons.analytics, text: 'Analytics'),
                  _SidebarIcon(icon: Icons.task, text: 'Task'),
                  _SidebarIcon(icon: Icons.person, text: 'User'),
                  const SizedBox(height: 12),
                  const Divider(thickness: 0.2, height: 0, color: Colors.grey),
                  _SidebarIcon(icon: Icons.settings, text: 'Setup'),
                  _SidebarIcon(icon: Icons.phone_in_talk, text: 'Oncall'),
                  _SidebarIcon(icon: Icons.settings_suggest, text: 'Workflows'),
                ],
              ),
            ),
          ),
          _SidebarIcon(icon: Icons.feedback, text: 'Feedback'),
          _SidebarIcon(icon: Icons.more_horiz, text: 'More'),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _SidebarIcon({required IconData icon, required String text}) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 4),
              width: 30,
              height: 30,
              decoration: controller.selectedString.value == text
                  ? BoxDecoration(
                      color: const Color(0xFFE6E7FA),
                      borderRadius: BorderRadius.circular(12),
                    )
                  : null,
              child: InkWell(
                  onTap: () {
                    controller.selectedString.value = text;
                  },
                  child: Icon(icon,
                      size: 16,
                      color: controller.selectedString.value == text
                          ? const Color(0xFF5B5FC7)
                          : Colors.grey[600])),
            ),
          ),
          text.isEmpty
              ? const SizedBox()
              : Text(text, style: const TextStyle(color: Colors.black, fontSize: 8)),
        ],
      );
}
