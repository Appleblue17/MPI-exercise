// 尝试进行输入输出操作
// 尝试输出以下图形

// *
// **
// ***
// ****
// *****
fn 输出星星(println : (String) -> Unit) -> Unit {
  // 使用 变量 while 循环
  let mut i = 0
  while i < 5 {
    // 该怎么做呢？
    i = i + 1
    let mut str: String = ""
    for j=1; j<=i; j=j+1 { str = str+"*" }
    println(str)
  }
}

test "第七课练习1" {
  let buffer = Buffer::new()
  fn println(content : String) -> Unit {
    buffer.write_string(content)
    buffer.write_char('\n')
  }

  输出星星(println)
  inspect!(
    buffer.to_string(),
    content=
      #|*
      #|**
      #|***
      #|****
      #|*****
      #|
    ,
  )
}
