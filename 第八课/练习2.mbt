// 请实现一个利用Option[T]的循环队列

struct Queue[T] {}

fn Queue::make[T]() -> Queue[T] {
  Queue::{}
}

fn Queue::push[T](queue : Queue[T], value : T) -> Queue[T] {
  queue
}

fn Queue::pop[T](queue : Queue[T]) -> Queue[T] {
  queue
}

fn Queue::peek[T](queue : Queue[T]) -> T? {
  None
}

fn Queue::length[T](queue : Queue[T]) -> Int {
  0
}

test "第八课练习2" {
  let queue : Queue[String] = Queue::make()
  queue.push("a").push("s").push("d").push("f") |> ignore
  assert_eq!(queue.length(), 4)!
  assert_eq!(queue.peek(), Some("a"))!
  queue.pop().pop().pop().push("x") |> ignore
  assert_eq!(queue.length(), 2)!
  assert_eq!(queue.peek(), Some("f"))!
  queue.pop().pop().pop() |> ignore
  assert_eq!(queue.length(), 0)!
  assert_eq!(queue.peek(), None)!
}
