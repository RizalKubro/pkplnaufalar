import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Timer _timer;

  List<List<String>> inProcess = [];
  List<List<String>> finished = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      refreshData();
    });
    refreshData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _timer.cancel(); // Cancel the timer to prevent setState() after dispose
    super.dispose();
  }

  Future<void> refreshData() async {
    final prefs = await SharedPreferences.getInstance();
    final inProcessList = prefs.getStringList('inProcess') ?? [];
    final finishedList = prefs.getStringList('finished') ?? [];
    setState(() {
      inProcess = inProcessList.map((item) => item.split(',')).toList();
      finished = finishedList.map((item) => item.split(',')).toList();
    });
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('inProcess');
    await prefs.remove('finished');
    refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.yellow,
          tabs: [
            Tab(text: 'In Process'),
            Tab(text: 'Finished'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildItemList(inProcess),
          buildItemList(finished),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: clearHistory,
        child: Icon(Icons.delete),
      ),
    );
  }

  Widget buildItemList(List<List<String>> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final currentDate = DateTime.now();
        final additionalInfo = items == inProcess
            ? 'Tanggal: ${currentDate.toString().substring(0, 10)}'
            : 'Pesanan telah diterima';
        final deliveryDate = currentDate.add(Duration(days: 3)).toString().substring(0, 10);

        return ListTile(
          leading: Image.asset(
            "images/${item[0]}.png",
            width: 100,
            height: 100,
          ),
          title: Text(item[1]),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item[2]),
              Text('Delivery Date: $deliveryDate'),
              Text(additionalInfo),
            ],
          ),
          onTap: () {
            // Add logic if you want to handle when an item is tapped
          },
        );
      },
    );
  }
}


