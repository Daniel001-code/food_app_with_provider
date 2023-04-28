import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;
  DetailScreen(
      {required this.heroTag, required this.foodName, required this.foodPrice});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var selectedCard = 'WEIGHT';
  int itmcount = 0;

  void add() {
    setState(() {
      itmcount++;
    });
  }

  void subtract() {
    setState(() {
      if (itmcount >= 1) {
        itmcount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff7A9BEE),
        appBar: AppBar(
          backgroundColor: Color(0xff7A9BEE),
          title: Text(
            'Details',
            style: TextStyle(fontSize: 25),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(Icons.more_horiz_outlined),
            )
          ],
        ),
        body: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: 620,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 225,
                      ),
                      Text(
                        widget.foodName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.foodPrice,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(),
                            Container(
                              height: 40,
                              width: 2,
                              color: Color.fromARGB(255, 206, 202, 202),
                            ),
                            Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromARGB(255, 46, 134, 206),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        subtract();
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    itmcount.toString(),
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        add();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 45),
                      Container(
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            properties(
                              'WEIGHT',
                              '0.2',
                              'Kg',
                            ),
                            properties(
                              'CALORIES',
                              '100',
                              'CAL',
                            ),
                            properties(
                              'VITAMIN',
                              'A, B5',
                              'VIT',
                            ),
                            properties(
                              'OIL',
                              '0.01',
                              'Kg',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 10, bottom: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                widget.foodPrice,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 20,
              child: Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 230,
                  width: 230,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(widget.heroTag),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 204, 193, 193),
                        offset: Offset(6, 5),
                        blurRadius: 20,
                        spreadRadius: 0.1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget properties(
    String ppt,
    String value,
    String unit,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          selectCard(ppt);
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.linear,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
              style: BorderStyle.solid,
            ),
            color: selectedCard == ppt ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ppt,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: selectedCard == ppt ? Colors.white : Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: selectedCard == ppt ? Colors.white : Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  unit,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: selectedCard == ppt ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void selectCard(ppt) {
    setState(() {
      selectedCard = ppt;
    });
  }
}
