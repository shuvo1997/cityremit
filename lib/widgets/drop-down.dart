import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../mydrop-down-class.dart';

class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({Key? key}) : super(key: key);

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  MyDropDownItem item1 =
      MyDropDownItem(itemCode: '+880', itemImage: 'assets/images/flag.png');
  MyDropDownItem item2 =
      MyDropDownItem(itemCode: '+91', itemImage: 'assets/images/flag1.png');
  MyDropDownItem item3 =
      MyDropDownItem(itemCode: '+61', itemImage: 'assets/images/flag2.png');

  MyDropDownItem? _dropDownValue;
  List<MyDropDownItem>? myDropDownItemList;

  @override
  void initState() {
    super.initState();
    _dropDownValue = item1;
    myDropDownItemList = [
      item1,
      item2,
      item3,
    ];
  }

  // List<Map> menuItems = [
  //   {
  //     'id': '1',
  //     'image': 'assets/images/flag.png',
  //     'country_code': '+880',
  //   },
  //   {
  //     'id': '2',
  //     'image': 'assets/images/flag1.png',
  //     'country_code': '+61',
  //   },
  //   {
  //     'id': '3',
  //     'image': 'assets/images/flag2.png',
  //     'country_code': '+91',
  //   },
  // ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<MyDropDownItem>(
        value: _dropDownValue,
        onChanged: (value) {
          setState(() {
            _dropDownValue = value!;
          });
        },
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        selectedItemBuilder: (BuildContext context) {
          return myDropDownItemList!.map<Widget>((MyDropDownItem item) {
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0.r),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(item.itemImage),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12.0.w),
                  child: Text(
                    item.itemCode,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          }).toList();
        },
        items: myDropDownItemList
            ?.map((MyDropDownItem value) => DropdownMenuItem<MyDropDownItem>(
                value: value,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(value.itemImage),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0.w),
                      child: Text(
                        value.itemCode,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                )))
            .toList(),
      ),
    );
  }
}
