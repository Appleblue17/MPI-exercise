enum List[T] {
  Nil
  Cons(T, List[T])
} derive(Show, Eq)

fn reverse(list : List[Int]) -> List[Int] {
  // 请完成reverse函数，定义一个将列表翻转的函数
  fn solve(list1: List[Int], list2: List[Int]){
    match (list1,list2){
      (Nil,list2) => list2
      (Cons(head,rest), list2) => solve(rest,Cons(head,list2))
    }
  }
  solve(list,Nil)
}

// -----请忽略以下内容-----

test "第三课练习1" {
  assert_eq!(reverse(Nil), Nil)
  assert_eq!(reverse(Cons(1, Nil)), Cons(1, Nil))
  assert_eq!(reverse(Cons(2, Cons(1, Nil))), Cons(1, Cons(2, Nil)))
}
