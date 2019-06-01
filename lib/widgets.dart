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
            Tab(icon: Icon(Icons.assignment)),
            Tab(icon: Icon(Icons.assessment)),
            Tab(icon: Icon(Icons.person))
          ],
        ),
        title: Align(
            alignment: Alignment.centerRight,
            child: Theme(
              child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(child: new Text('Flutter(Dart)', style:TextStyle(fontFamily: 'GoogleSans')), value: 'Flutter(Dart)'),
                  DropdownMenuItem(child: new Text('Java', style: TextStyle(fontFamily: 'GoogleSans'),), value: 'Java'),
                  DropdownMenuItem(child: new Text('Python', style:TextStyle(fontFamily: 'GoogleSans')), value: 'Python'),
                  DropdownMenuItem(child: new Text('React', style:TextStyle(fontFamily: 'GoogleSans')), value: 'React'),
  
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
