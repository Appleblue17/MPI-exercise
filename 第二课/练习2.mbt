fn 平均数(i1 : Int, i2 : Int) -> Int {
  let i1 = i1
  let i2 = i2
  //I am doing my homework.
  // 请在此完成练习
  // 请将abort开头的代码行替换为你对i1与i2进行平均数计算的表达式，小心溢出
  let i1_64 = i1.to_int64()
  let i2_64 = i2.to_int64()
  ((i1_64+i2_64)/2).to_int()
}

// -----请忽略以下内容-----

test "第二课练习2" {
  assert_eq!(平均数(0, 0), 0)
  assert_eq!(平均数(2, 2), 2)
  assert_eq!(平均数(4, 6), 5)
  assert_eq!(平均数(2, 2147483646), 1073741824)
  assert_eq!(平均数(2147483646, 2147483646), 2147483646)
}
