import 'dart:math' as mth;
import 'package:bndemo/core/utils/methods.dart';
import 'package:bndemo/core/utils/responsive_utils.dart';
import 'package:bndemo/core/values/strings.dart';
import 'package:bndemo/features/home/presentation/controller/team_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamsContent extends StatelessWidget {
  final VoidCallback onCreate;

  TeamsContent({required this.onCreate});

  TeamController controller = Get.find<TeamController>();

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final padding = isMobile
        ? 16.0
        : isTablet
            ? 24.0
            : 20.0;

    final searchWidth = isMobile
        ? 80.0
        : isTablet
            ? 150.0
            : 250.0;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: padding, right: padding, bottom: 0),
          child: _layoutChanger(isMobile, searchWidth),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: padding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Obx(
              () => _teamList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _layoutChanger(isMobile, searchWidth) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey)),
          child: const Icon(
            Icons.splitscreen_outlined,
            size: 14,
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey)),
          child: const Icon(Icons.vertical_split_outlined, size: 16),
        ),
        const Spacer(),
        SizedBox(
          height: 32,
          width: searchWidth,
          child: _searchField(),
        ),
        const SizedBox(width: 16),
        const Icon(
          Icons.info_outline,
          size: 16,
          color: Color(0xFF5B5FC7),
        ),
        const SizedBox(width: 10),
        const Icon(
          Icons.ondemand_video_outlined,
          size: 16,
          color: Colors.red,
        ),
        const SizedBox(width: 16),
        SizedBox(
          height: 32,
          child: _createButton(isMobile),
        ),
      ],
    );
  }

  Widget _searchField() {
    return TextField(
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      cursorHeight: 15,
      decoration: InputDecoration(
        hintText: 'Search Teams',
        prefixIcon: const Icon(
          Icons.search,
          size: 16,
        ),
        hintStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFF5F6FA),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
      ),
    );
  }

  Widget _teamList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: controller.teamsList.length,
      itemBuilder: (context, index) {
        final team = controller.teamsList[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 36,
                width: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: getRandomColor(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  team.name.toString()[0],
                  style: const TextStyle(
                      color: Color(0xFF5B5FC7), fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
              title: Text(team.name,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11)),
              subtitle: Text(
                '${team.members} members',
                style: const TextStyle(fontSize: 10),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete_outline, size: 16, color: Colors.red),
                onPressed: () {
                  controller.teamsList.removeAt(index);
                },
              ),
              onTap: () {},
            ),
            const Divider(height: 0.5, thickness: 1, color: Color(0xFFF5F6FA)),
          ],
        );
      },
    );
  }

  Widget _createButton(isMobile) {
    return ElevatedButton.icon(
      onPressed: onCreate,
      icon: const Icon(Icons.add, size: 14),
      label: Text(
        isMobile ? create : createNewTeam,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF5B5FC7),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 20),
        textStyle: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
