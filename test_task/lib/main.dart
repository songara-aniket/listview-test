import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

//class needs to extend StatefulWidget since we need to make changes to the bottom app bar according to the user clicks
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  bool clickedCentreFAB =
      false; //boolean used to handle container animation which expands from the FAB
  int selectedIndex =
      0; //to handle which item is currently selected in the bottom app bar
  String text = "Home";

  //call this method on click of each bottom app bar item to update the screen
  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: FractionalOffset.center,
            //in this demo, only the button text is updated based on the bottom app bar clicks
            child: TextButton(
              child: Text(text),
              onPressed: () {},
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                blurRadius: 10.0,
                color: Colors.grey.shade300
              ),
            ],
          ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //specify the location of the FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Centre FAB",
        elevation: 4.0,
        backgroundColor: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: const Icon(Icons.add,color: Colors.black,),
        ),
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0), ),
          child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        elevation: 10,

        //color of the BottomAppBar
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                //update the bottom app bar view each time an item is clicked
                onPressed: () {
                  updateTabSelection(0, "Home");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.home,
                  //darken the icon if it is selected or else give it a different color
                  color: selectedIndex == 0
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(1, "Outgoing");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_made,
                  color: selectedIndex == 1
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              const SizedBox(
                width: 50.0,
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(2, "Incoming");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.call_received,
                  color: selectedIndex == 2
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  updateTabSelection(3, "Settings");
                },
                iconSize: 27.0,
                icon: Icon(
                  Icons.settings,
                  color: selectedIndex == 3
                      ? Colors.blue.shade900
                      : Colors.grey.shade400,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
