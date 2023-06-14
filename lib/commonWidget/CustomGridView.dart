import 'package:flutter/material.dart';

class CustomGridView{
  int length;
  int parentIndex = -1;
  Function gridItem;
  int gridCount;
  bool shrinkWrap;
  double padding;
  ScrollController scrollController;

  CustomGridView(this.length, this.gridItem, this.gridCount, this.shrinkWrap, this.padding, this.scrollController, {this.parentIndex = -1});

  Widget buildGridView(){
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: padding),
      itemBuilder: _buildItem,
      itemCount: length,
      shrinkWrap: shrinkWrap,
      physics: shrinkWrap ? ClampingScrollPhysics() : null,
      controller: scrollController,
    );
  }

  Widget? _buildItem(BuildContext context, int index){
    if(gridCount == 2){
      return _buildTwoGridListItem(context, index);
    }
    else if(gridCount == 3){
      return _buildThreeGridListItem(context, index);
    }
    else if(gridCount == 4){
      return _buildFourGridListItem(context, index);
    }
    else if(gridCount == 5){
      return _buildFiveGridListItem(context, index);
    }
    else if(gridCount == 6){
      return _buildSixGridListItem(context, index);
    }
    else if(gridCount > 6){
      return _buildMoreThenSixGridListItem(context, index);
    }

  }

  Widget _buildTwoGridListItem(BuildContext context, int index){
    int firstIndex = (index * gridCount);
    int secondIndex = (index * gridCount) + 1;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: firstIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(firstIndex, parentIndex) : gridItem(firstIndex),
          ),
          Expanded(
            child: secondIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(secondIndex, parentIndex) : gridItem(secondIndex),
          ),
        ],
      ),
    );
  }
  
  Widget _buildThreeGridListItem(BuildContext context, int index){
    int firstIndex = (index * gridCount);
    int secondIndex = (index * gridCount) + 1;
    int thirdIndex = (index * gridCount) + 2;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: firstIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(firstIndex, parentIndex) : gridItem(firstIndex),
          ),
          Expanded(
            child: secondIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(secondIndex, parentIndex) : gridItem(secondIndex),
          ),
          Expanded(
            child: thirdIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(thirdIndex, parentIndex) : gridItem(thirdIndex),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFourGridListItem(BuildContext context, int index){
    int firstIndex = (index * gridCount);
    int secondIndex = (index * gridCount) + 1;
    int thirdIndex = (index * gridCount) + 2;
    int fourthIndex = (index * gridCount) + 3;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: firstIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(firstIndex, parentIndex) : gridItem(firstIndex),
          ),
          Expanded(
            child: secondIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(secondIndex, parentIndex) : gridItem(secondIndex),
          ),
          Expanded(
            child: thirdIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(thirdIndex, parentIndex) : gridItem(thirdIndex),
          ),
          Expanded(
            child: fourthIndex > length - 1 ? Container() : parentIndex != -1 ? gridItem(fourthIndex, parentIndex) : gridItem(fourthIndex),
          ),
        ],
      ),
    );
  }
  
  Widget _buildFiveGridListItem(BuildContext context, int index){
    int firstIndex = (index * gridCount);
    int secondIndex = (index * gridCount) + 1;
    int thirdIndex = (index * gridCount) + 2;
    int fourthIndex = (index * gridCount) + 3;
    int fifthIndex = (index * gridCount) + 4;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: firstIndex > length - 1 ? Container() : gridItem(firstIndex),
          ),
          Expanded(
            child: secondIndex > length - 1 ? Container() : gridItem(secondIndex),
          ),
          Expanded(
            child: thirdIndex > length - 1 ? Container() : gridItem(thirdIndex),
          ),
          Expanded(
            child: fourthIndex > length - 1 ? Container() : gridItem(fourthIndex),
          ),
          Expanded(
            child: fifthIndex > length - 1 ? Container() : gridItem(fifthIndex),
          ),
        ],
      ),
    );
  }
  
  Widget _buildSixGridListItem(BuildContext context, int index){
    int firstIndex = (index * gridCount);
    int secondIndex = (index * gridCount) + 1;
    int thirdIndex = (index * gridCount) + 2;
    int fourthIndex = (index * gridCount) + 3;
    int fifthIndex = (index * gridCount) + 4;
    int sixthIndex = (index * gridCount) + 5;
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: firstIndex > length - 1 ? Container() : gridItem(firstIndex),
          ),
          Expanded(
            child: secondIndex > length - 1 ? Container() : gridItem(secondIndex),
          ),
          Expanded(
            child: thirdIndex > length - 1 ? Container() : gridItem(thirdIndex),
          ),
          Expanded(
            child: fourthIndex > length - 1 ? Container() : gridItem(fourthIndex),
          ),
          Expanded(
            child: fifthIndex > length - 1 ? Container() : gridItem(fifthIndex),
          ),
          Expanded(
            child: sixthIndex > length - 1 ? Container() : gridItem(sixthIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreThenSixGridListItem(BuildContext context, int index){
    return Text(
      'This Grid View Only Supports Upto 6 Items Per Row.',
    );
  }

}