import 'package:flutter/material.dart';
import 'package:flutter_pratice1/data/Credential.dart';
import 'package:flutter_pratice1/manager/CredentialManager.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //makeTestData();
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
                  child: _buildTabWidget('내가만든쯩'),
                ),
                Tab(
                  child: _buildTabWidget('추가'),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: _tabMyCredentials(),
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

  /*******************
   * ListView
   ********************/
  Widget _tabMyCredentials() {
    List<Credential> crList = CredentialManager().credentialList;
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: crList.length,
      itemBuilder: (BuildContext, int index) {
        return _buildCredentialItem(crList[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Container _buildCredentialItem(Credential credential) {
    return Container(
      child: Row(
        children: [
          credential.icon,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  credential.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )
                ),
                Text(credential.type),
                Text('유효기간 ' + credential.expire),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /**
   * 상단의 Tab Name
   * '내가만든쯩', '추가'
   */
  Widget _buildTabWidget(String tabName) {
    return Container(
      alignment: Alignment.bottomLeft,
      constraints: BoxConstraints.expand(),
      child: Text(
        tabName,
        style: TextStyle(color: Colors.black87, fontSize: 18),
      ),
    );
  }

  List<Credential> makeTestData() {
    List<Credential> crList = Credential.makeTestData();

    var stream = Stream.fromIterable(crList);
    stream.forEach(print);
    return crList;
  }
}
