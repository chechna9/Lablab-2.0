part of 'content_cubit.dart';

sealed class ContentState extends Equatable {
  const ContentState();

  @override
  List<Object> get props => [];
}

final class ContentInitial extends ContentState {}

final class ContentLoading extends ContentState {}

final class ContentLoaded extends ContentState {
  final List<ContentModel> listContent;
  const ContentLoaded(this.listContent);
  @override
  List<Object> get props => [listContent];
}

final class ContentSelected extends ContentState {
  final List<ContentModel> listContent;
  final ContentModel content;
  const ContentSelected(this.content, this.listContent);
  @override
  List<Object> get props => [content, listContent];
}

final class ContentError extends ContentState {
  final String message;
  const ContentError(this.message);
  @override
  List<Object> get props => [message];
}
