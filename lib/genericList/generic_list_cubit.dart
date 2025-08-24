import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'generic_list_state.dart';

class GenericListCubit extends Cubit<GenericListState> {
  GenericListCubit() : super(GenericListLoading());
  void getData(int tabNumber) async{
    emit(GenericListLoading());
    await Future.delayed(const Duration(seconds: 2));
   switch(tabNumber){
     case 1 :
       emit(GenericListLoaded(["ahmed","mohamed","tarek"],1));
     case 2 :
       emit(GenericListLoaded(["you","me","i"],2));
     case 3 :
       emit(GenericListLoaded(["let's","go","tarek"],3));

   }
  }
}
