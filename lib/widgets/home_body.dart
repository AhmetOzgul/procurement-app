import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection('shared_product').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Some error occurred ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          QuerySnapshot querySnapshot = snapshot.data;
          List<QueryDocumentSnapshot> documents = querySnapshot.docs;
          List<Map> items = documents
              .map((e) => {
                    'id': e.id,
                    'image': e['image'],
                    'name': e['name'],
                    'quantity': e['quantity'],
                    'userid': e['userID'],
                    'description': e['description'],
                    'date': e['date'],
                    'userEmail': e['userEmail']
                  })
              .toList();
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              Map thisItem = items[index];
              int epochDate = int.parse(thisItem['date']);
              final DateTime timeStamp =
                  DateTime.fromMillisecondsSinceEpoch(epochDate);
              final formattedDate =
                  '${timeStamp.day}-${timeStamp.month}-${timeStamp.year} (${timeStamp.hour}:${timeStamp.minute})';

              return Container(
                decoration: const BoxDecoration(
                    color: Color(0xffEEF5FF),
                    border: Border(
                        bottom: BorderSide(
                      color: Color(0xff176B87),
                    ))),
                height: 350,
                padding: const EdgeInsets.all(0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(
                        Icons.account_circle,
                        color: Color(0xff176B87),
                        size: 35,
                      ),
                      title: Text(
                        "${thisItem['userEmail']}",
                        style: const TextStyle(
                            color: Color(0xff176B87),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      trailing: const Icon(
                        Icons.more_vert,
                        color: Color(0xff176B87),
                      ),
                    ),
                    Row(
                      children: [
                        thisItem.containsKey('image')
                            ? Image.network(
                                '${thisItem['image']}',
                                width: 200,
                                height: 250,
                              )
                            : const SizedBox(
                                width: 250,
                              ),
                        Column(
                          children: [
                            Text(
                              "${thisItem['name']}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Color(0xff176B87),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                              height: 162,
                              width: 185,
                              child: Text(
                                "${thisItem['description']}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff176B87),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: const Color(0xff176B87),
                                      borderRadius: BorderRadius.circular(10)),
                                  width: 80,
                                  height: 60,
                                  child: Center(
                                    child: Text(
                                      "${thisItem['quantity']} item(s) in stock",
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                        color: Colors.red[900],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 60,
                                    width: 80,
                                    child: const Center(
                                        child: Text(
                                      "Request Product",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    )),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 40,
                      width: 350,
                      child: Text(formattedDate,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Color(0xff176B87),
                              fontWeight: FontWeight.w500,
                              fontSize: 17)),
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
