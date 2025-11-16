part of 'generic_list_cubit.dart';

@immutable
sealed class GenericListState extends Equatable {}

final class GenericListInitial extends GenericListState {
  @override
  List<Object?> get props => [];


}
final class GenericListLoading extends GenericListState {

  GenericListLoading();
  @override
  List<Object?> get props => [];

}
final class GenericListLoaded extends GenericListState {
  final List<String> list;
  final int type;
  GenericListLoaded(this.list,this.type);
  @override
  List<Object?> get props => [list,type];
}
