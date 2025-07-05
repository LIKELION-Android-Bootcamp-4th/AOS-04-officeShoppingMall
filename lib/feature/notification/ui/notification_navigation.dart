import 'package:flutter/material.dart';

class NotificationNavigation extends StatefulWidget {
  final int selectNotiIndex;
  final Function(int) onTap;

  const NotificationNavigation({super.key, required this.selectNotiIndex, required this.onTap});

  @override
  State<StatefulWidget> createState() => _NotificationNavigationState();
}

class _NotificationNavigationState extends State<NotificationNavigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: SizedBox(
        height: 75,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(60)),
          // clipBehavior: Clip.antiAlias,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () => widget.onTap(0),
                style: TextButton.styleFrom(
                  minimumSize: Size(65, 65),
                  backgroundColor: widget.selectNotiIndex == 0 ? Color(0x8270AEFF) : Colors.white,
                  shape: CircleBorder(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "전체 알림",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: widget.selectNotiIndex == 0 ? Colors.black : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => widget.onTap(1),
                style: TextButton.styleFrom(
                  minimumSize: Size(65, 65),
                  backgroundColor: widget.selectNotiIndex == 1 ? Color(0x8270AEFF) : Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "공지사항",
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.selectNotiIndex == 1 ? Colors.black : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => widget.onTap(2),
                style: TextButton.styleFrom(
                  minimumSize: Size(65, 65),
                  backgroundColor: widget.selectNotiIndex == 2 ? Color(0x8270AEFF) : Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "배송 알림",
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.selectNotiIndex == 2 ? Colors.black : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => widget.onTap(3),
                style: TextButton.styleFrom(
                  minimumSize: Size(65, 65),
                  backgroundColor: widget.selectNotiIndex == 3 ? Color(0x8270AEFF) : Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(60)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "광고",
                      style: TextStyle(
                        fontSize: 12,
                        color: widget.selectNotiIndex == 3 ? Colors.black : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}