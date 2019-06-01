import 'package:flutter/material.dart';


class GetAppBar extends StatefulWidget implements PreferredSizeWidget{
  @override
  _GetAppBarState createState() => _GetAppBarState();
  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight+20);
  String language;
  Function(String) callback;
  GetAppBar(this.language, this.callback);
}

class _GetAppBarState extends State<GetAppBar> {
  String newValue;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
          ],
        ),
        title: Align(
            alignment: Alignment.centerRight,
            child: Theme(
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(child: new Text('Java'), value: 'Java'),
                  DropdownMenuItem(child: new Text('Python'), value: 'Python'),
                ],
                hint: Text('Language'),
                value: newValue,
                
                onChanged: (String value) {
                  newValue = value;
                  setState(() {
                  });
                  widget.callback(newValue);
                },
              )),
              data: ThemeData.dark(),
            )));
  }
}
