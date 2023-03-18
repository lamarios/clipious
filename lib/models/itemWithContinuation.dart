abstract class ItemtWithContinuation<T>{
  String? continuation;


  ItemtWithContinuation(this.continuation);

  List<T> getItems();
}