import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskName = TextEditingController();
  TextEditingController status = TextEditingController();
  List all = [];
  List pending = [];
  List complete = [];
  bool switch01 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color(0xff467BB9),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text("All", style: TextStyle(color: Colors.white54)),
                Text("Pending", style: TextStyle(color: Colors.white54)),
                Text("Completed", style: TextStyle(color: Colors.white54)),
              ],
            ),
            backgroundColor: const Color(0xff103C78),
            elevation: 15,
            title: const Text("Home Page",
                style: TextStyle(color: Colors.white54)),
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
          ),
          body: Stack(children: [
            Image.asset("assets/images/Sky_Blue_Wallpaper.jpeg",
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill),
            TabBarView(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20.0, top: 20, left: 20, right: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: all.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          endActionPane:
                          ActionPane(motion: ScrollMotion(), children: [
                            SlidableAction(
                              onPressed: (context) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                          "are you sure you want to delete?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            all.removeAt(index);
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: Text("yes"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.pop(context);
                                          },
                                          child: Text("no"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ]),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            height: 70,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(children: [
                              Text(all[index]["task"]),
                              Switch(
                                value: switch01,
                                onChanged: (value) {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                            "are you sure you want to compelete?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              complete.add({
                                                "task": "$taskName",
                                                "status": "$status"
                                              });
                                              switch01 = value!;
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: Text("yes"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              switch01 = value!;
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: Text("no"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  print(value);
                                },
                              )
                            ]),
                          ),
                        );
                      },
                    )),
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20.0, top: 20, left: 20, right: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: all.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ]),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(children: [
                                  Text(""),
                                  Switch(
                                    value: switch01,
                                    onChanged: (value) {
                                      switch01 = value!;
                                      setState(() {});
                                    },
                                  )
                                ]),
                              ),
                            );
                          },
                        )),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 20.0, top: 20, left: 20, right: 20),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: all.length,
                          itemBuilder: (context, index) {
                            return Slidable(
                              endActionPane:
                              ActionPane(motion: ScrollMotion(), children: [
                                SlidableAction(
                                  onPressed: (context) {

                                  },
                                  backgroundColor: Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',

                                ),
                              ]),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.all(10),
                                height: 70,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(children: [
                                  Text(""),
                                  Switch(
                                    value: switch01,
                                    onChanged: (value) {
                                      switch01 = value!;
                                      setState(() {});
                                    },
                                  )
                                ]),
                              ),
                            );
                          },
                        )),
                  ],
                ),
              ],
            )
          ]),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return Container(
                      height: 340,
                      padding: EdgeInsets.only(
                          top: 30, bottom: 30, right: 40, left: 40),
                      decoration: BoxDecoration(
                        color: Color(0xff89C2FE).withOpacity(0.70),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Task name",
                                style: TextStyle(
                                  color: Color(0xff103C78),
                                  fontSize: 16,
                                )),
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 10, bottom: 15),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter Email address";
                                  }
                                },
                                controller: taskName,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Color(0xff103C78),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff103C78)),
                                        borderRadius:
                                        BorderRadius.circular(35)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff103C78)
                                                .withOpacity(0.60)),
                                        borderRadius:
                                        BorderRadius.circular(35)),
                                    hintText: " please enter task name",
                                    hintStyle: TextStyle(
                                      color: Color(0xff103C78),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                    )),
                              ),
                            ),
                            Text("Status",
                                style: TextStyle(
                                  color: Color(0xff103C78),
                                  fontSize: 16,
                                )),
                            Padding(
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter your status";
                                  }
                                },
                                controller: status,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: Color(0xff103C78),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff103C78)),
                                        borderRadius:
                                        BorderRadius.circular(35)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff103C78)
                                                .withOpacity(0.60)),
                                        borderRadius:
                                        BorderRadius.circular(35)),
                                    hintText: " please enter status",
                                    hintStyle: TextStyle(
                                      color: Color(0xff103C78),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                    )),
                              ),
                              padding:
                              const EdgeInsets.only(top: 10, bottom: 15),
                            ),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  left: 100, right: 100, top: 20),
                              padding:
                              const EdgeInsets.only(top: 15, bottom: 13),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xff2B5287),
                                  Color(0xff2B5287),
                                  Color(0xff89C2FE),
                                  Color(0xff2B5287)
                                ]),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    all.add({
                                      "task": "$taskName",
                                      "status": "$status"
                                    });
                                    status == true
                                        ? complete.add({
                                      "task": "$taskName",
                                      "status": "$status"
                                    })
                                        : pending.add({
                                      "task": "$taskName",
                                      "status": "$status"
                                    });

                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                    );
                  },
                );
              },
              backgroundColor: Color(0xff103C78),
              elevation: 20,
              child: Icon(Icons.add, color: Colors.white54)),
        ),
      ),
    );
  }
}
