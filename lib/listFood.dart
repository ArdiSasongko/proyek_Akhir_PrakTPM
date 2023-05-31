// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mexican_food/API/model.dart';
import 'package:mexican_food/bottomNav.dart';
import 'package:mexican_food/search.dart';
import 'API/services.dart';

class ListFood extends StatefulWidget {
  const ListFood({Key? key}) : super(key: key);

  @override
  State<ListFood> createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  GetData _getdata = GetData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Mexican Foods",
          style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: Searchfood());
              },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: FutureBuilder<List<MexicanFood>>(
          future: _getdata.getList(),
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
                        ),
                        Text(data[index].difficulty.toString()),
                      ],
                    ),
                  );
                }
            );
          },
        ),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}
