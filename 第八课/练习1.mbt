// 请实现一个尾递归的奇偶性判断函数
// 输入均为自然数

fn check(value: Int, typ: Bool) -> Bool{
  if value == 0 { not(typ) }
  else {check(value-1, not(typ))}
}

fn 是偶数(value : Int) -> Bool {
  // 请实现偶数判断函数并使用奇数判断函数
  check(value, false)
}

fn 是奇数(value : Int) -> Bool {
  // 请实现奇数判断函数并使用偶数判断函数
  check(value, true)
}

test "第八课练习1" {
  assert_false!(是偶数(2147483647))
  assert_true!(是偶数(0))
  assert_true!(是奇数(1001))
  assert_false!(是奇数(114514))
}
