
import 'dart:core';

main() {
  var a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  var val = a.where((element) => element < 5);
  print(val);
  ////////////////////////////////////
  var b = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  var c = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  var valu = [];
  for(int i =0 ; i< c.length; i++){
    for(int x = 0 ; x<b.length ; x++){
      if(b[x]==c[i]){
        print(c[i]);
        valu.add(c[i]);
        //return (c[i]) ;

      }
    }
  }
  print(valu.toSet().toList());
  //////////////////////////////////////////////////////////////
  var d = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
  var value = d.where((element) => element % 2 == 0);
  var List = value.toList();
  print(List);
  /////////////////////////////////////////////////
  var e = [5, 10, 15, 20, 25];
  // var y (var List){
  //   var newe = List<int>.empty(growable:true)..length=2;
  //     return (newe[0]=List.first,
  //     newe[1]=List.last);
  //   }
  // y (e);
  var newe = List<int>.empty(growable:true)..length=2;
  newe[0]=e.first;
  newe[1]=e.last;
}