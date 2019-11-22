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
      itemBuilder: (BuildContext context, int index) {
        return _buildCredentialItem(crList[index]);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  /***********************
   * Credential List Item
   ***********************/
  Container _buildCredentialItem(Credential credential) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: credential.icon,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(credential.name,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(167, 113, 239, 1),
                    )),
                Text(
                  credential.issuer,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(43, 43, 43, 1),
                  ),
                ),
                Text('유효기간 ' + credential.expire,
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(138, 138, 138, 1),
                    )
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.arrow_forward_ios),
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
