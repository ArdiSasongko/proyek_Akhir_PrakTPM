import 'package:flutter/material.dart';

import 'API/model.dart';
import 'API/services.dart';

class Searchfood extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return[
      IconButton(
          onPressed: (){
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        Navigator.pop(context);
      },
    );
  }
  GetData _getdata = GetData();

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: FutureBuilder<List<MexicanFood>>(
        future: _getdata.getList(query: query),
        builder: (context, snapshot){
          var data = snapshot.data;
          return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(data![index].id.toString()),
                        subtitle: Text(
                          data[index].title.toString(),
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16.0)
                      ),
                      Image.network(data[index].image.toString(), width: 250, fit: BoxFit.cover,),
                      Padding(
                          padding: const EdgeInsets.all(16.0)
                      )
                    ],
                  ),
                );
              }
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search Food"),
    );
  }
}