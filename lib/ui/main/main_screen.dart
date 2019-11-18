import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 100),
            child: TabBar(
              indicatorColor: Colors.black87,
              tabs: <Tab>[
                Tab(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    constraints: BoxConstraints.expand(),
                    color: Colors.white10,
                    child: Text(
                      "내가만든쯩",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    constraints: BoxConstraints.expand(),
                    child: Text(
                      '추가',
                      style: TextStyle(color: Colors.black87, fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Text('1111111'),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text('22222222', style: TextStyle(fontSize: 50)),
                ),
              ],
            ), //co
          ), // ntroller: _tabController,
        ],
      ),
    );
  }


  Widget _tabMyCredentials() {

    return null;
  }
}
