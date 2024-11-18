import Buffer "mo:base/Buffer"
actor Simple_Todo_App{

  type Todo ={
    ID:Nat;
    item:Text;

  };

  // init id value
  var itemID: Nat = 0;
  type Buffer<x> = Buffer.Buffer<Todo>;
  let todoList: Buffer<Todo> = Buffer.Buffer<Todo>(100);

// Function to add to the list
  public func addToLIst(_item : Text) {
  todoList.add({
      ID = itemID;
      item = _item;
    });
    itemID +=1;
  };

// Function to fetch the data stored in the list
public query func fetch(): async Text {
  var result: Text = "To-DOs";
  for(todo:Todo in todoList.vals()){
    result #= "\n" # todo.item;
  };
  result # "\n"
}
};
