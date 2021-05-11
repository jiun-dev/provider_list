import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_list/provider/list_provider.dart';

class PeopleList extends StatelessWidget {
  PeopleList peopleList = PeopleList();

  PeopleInfoProvider _peopleInfoProvider;

  ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    _peopleInfoProvider = Provider.of<PeopleInfoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: AppBar(
              leading: IconButton(
                icon: Image.asset(
                  "images/icon_arrow_left.png",
                  width: 24,
                  height: 24,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0.0,
              title: Text(
                '목록',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              centerTitle: true,
            ),
          ),
          body: Consumer<PeopleInfoProvider>(
            builder: (context, provider, widget) {
              if (provider.peopleModel != null && provider.peopleModel.length > 0) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Container(
                        width: 400,
                        height: 400,
                        margin: EdgeInsets.only(top: 16),
                        child: Expanded(
                          child: ListView.builder(
                            controller: _controller,
                            itemCount: provider.peopleModel.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 18, left: 16),
                                        height: 20,
                                        child: Text(
                                          provider.peopleModel[index].name + ' (' + provider.peopleModel[index].birth +')',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      )
                                    ],
                                  ),

                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  child: Center(child: Text('대기'),),
                );
              }
            },
          )),
    );
  }




}