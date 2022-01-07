import 'package:flutter/material.dart';
import 'package:test_app/data/model/user.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/screens/second_screen.dart';

class ThirdScreen extends StatefulWidget {
  static const String routeId = 'third_screen';

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  final RefreshController refreshController = RefreshController(initialRefresh: true);
  int currPage = 1;
  List<Datum> users = [];
  late int totalUsers;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Third Screen',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getUsers(isRefresh: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getUsers();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child:
          ListView.separated(
              itemBuilder: (context, index) {
                final user = users[index];
                return ListTile(
                  leading: CircleAvatar(
                  radius: 18,
                  child: ClipOval(
                    child: Image.network(
                      user.avatar,
                    ),
                  ),
                ),
                  title: Text(user.firstName),
                  subtitle: Text(user.email),
                  onTap: () async { 
                },
                 
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: users.length,
            ),
          )
        );
  }

   
  Future<bool> getUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      currPage = 1;
    } else {
      if (currPage >= totalUsers) {
        refreshController.loadNoData();
        return false;
      }
    }

    final Uri uri = Uri.parse("https://reqres.in/api/users?page=$currPage&per_page=10");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = userFromJson(response.body);

      if (isRefresh) {
        users = result.data;
      } else {
        users.addAll(result.data);
      }
      currPage++;
      totalUsers = result.total;
      setState(() 
      { 
      });
      return true;
    } else {
      return false;
    }
  }  
}


