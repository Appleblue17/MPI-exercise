enum List[T] {
  Nil
  Cons(T, List[T])
} derive(Show, Eq)

fn contains(item : Int, list : List[Int]) -> Bool {
  // 请完成contains函数，定义一个判断列表中是否有特定item的函数
  match list{
    Cons(head,rest) => 
      if head == item {true} else {contains(item,rest)}
    Nil => false
  }
}

// -----请忽略以下内容-----

test "第三课练习2" {
  assert_eq!(contains(1, Nil), false)
  assert_eq!(contains(1, Cons(1, Nil)), true)
  assert_eq!(contains(3, Cons(1, Cons(2, Cons(3, Nil)))), true)
}
