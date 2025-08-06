import 'package:bndemo/core/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final searchWidth = isMobile
        ? 80.0
        : isTablet
        ? 150.0
        : 250.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 30,
            height: 30,
            child: Icon(Icons.group, size: 16, color: Colors.grey[600]),
          ),
          const SizedBox(width: 5),
          const Text('Teams', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          const Spacer(),
          Container(
            width: searchWidth,
            height: 35,
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            child: TextField(
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              cursorHeight: 15,
              decoration: InputDecoration(
                hintText: 'Search for Incidents, Services, and more...',
                hintStyle:
                const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.black),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 13,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFF5F6FA),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              ),
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.notifications_none,
              size: 16,
            ),
            onPressed: () {},
          ),
          IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.event_note_outlined,
              size: 16,
            ),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 16, color: Color(0xFF5B5FC7)),
            ),
          ),
        ],
      ),
    );
  }
}