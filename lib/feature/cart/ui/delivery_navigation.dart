import 'package:flutter/material.dart';
import 'package:office_shopping_mall/feature/cart/data/product.dart';
import 'package:office_shopping_mall/feature/cart/data/product_list.dart';

class DeliveryNavigation extends StatefulWidget {
  final int selectIndex;
  final Function(int) onTap;
  const DeliveryNavigation({super.key, required this.selectIndex, required this.onTap,});

  @override
  State<StatefulWidget> createState() => _DeliveryNavigationState();
}

class _DeliveryNavigationState extends State<DeliveryNavigation> {

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
              TextButton(onPressed:() => widget.onTap(0),
                style: TextButton.styleFrom(
                  // padding: EdgeInsets.all(16),
                  minimumSize: Size(65, 65),
                  backgroundColor: widget.selectIndex == 0 ? Color(0x8270AEFF) : Color(0xFFf7f2fa),
                  shape: CircleBorder(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("3", style: TextStyle(fontSize: 25, color: widget.selectIndex == 0 ? Colors.black : Colors.black54, fontWeight: FontWeight.bold),),
                    Text("장바구니", style: TextStyle(fontSize: 10, color: widget.selectIndex == 0 ? Colors.black : Colors.black54,),),
                  ],
                ),
              ),
              TextButton(onPressed:() => widget.onTap(1),
                style: TextButton.styleFrom(
                    minimumSize: Size(65, 65),
                    backgroundColor: widget.selectIndex == 1 ? Color(0x8270AEFF) : Color(0xFFf7f2fa),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(60),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("3", style: TextStyle(fontSize: 25, color: widget.selectIndex == 1 ? Colors.black : Colors.black54, fontWeight: FontWeight.bold),),
                    Text("결제 완료", style: TextStyle(fontSize: 10, color: widget.selectIndex == 1 ? Colors.black : Colors.black54,),),
                  ],
                ),
              ),
              TextButton(onPressed:() => widget.onTap(2),
                style: TextButton.styleFrom(
                    minimumSize: Size(65, 65),
                    backgroundColor: widget.selectIndex == 2 ? Color(0x8270AEFF) : Color(0xFFf7f2fa),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(60),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("1", style: TextStyle(fontSize: 25, color: widget.selectIndex == 2 ? Colors.black : Colors.black54, fontWeight: FontWeight.bold),),
                    Text("배송 중", style: TextStyle(fontSize: 10, color: widget.selectIndex == 2 ? Colors.black : Colors.black54,),),
                  ],
                ),
              ),
              TextButton(onPressed:() => widget.onTap(3),
                style: TextButton.styleFrom(
                    minimumSize: Size(65, 65),
                    backgroundColor: widget.selectIndex == 3 ? Color(0x8270AEFF) : Color(0xFFf7f2fa),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(60),
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("1", style: TextStyle(fontSize: 25, color: widget.selectIndex == 3 ? Colors.black : Colors.black54, fontWeight: FontWeight.bold),),
                    Text("배송 완료", style: TextStyle(fontSize: 10, color: widget.selectIndex == 3 ? Colors.black : Colors.black54,),),
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