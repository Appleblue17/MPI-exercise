// 在这个练习中，你将尝试创建一个代表数学表达式的数据结构
// 同时你需要实现一些相关函数

enum Expression{
  Number(Int)
  Add(Expression,Expression)
  Mult(Expression,Expression)
} // 请将此处替换为你所定义的Expression类型

// 这个类型应当实现如下几个方法

fn literal(i : Int) -> Expression {
  // 请实现一个从整数创建表达式的函数
  Number(i)
}

fn add(self : Expression, expr2 : Expression) -> Expression {
  // 请实现一个表达式相加的函数
  Add(self,expr2)
}

fn multiply(self : Expression, expr2 : Expression) -> Expression {
  // 请实现一个表达式相乘的函数
  Mult(self,expr2)
}

fn eval(expr : Expression) -> Int {
  // 请实现一个对表达式化简获得它所代表的值的函数
  match expr{
    Number(x) => x
    Add(x,y) => eval(x)+eval(y)
    Mult(x,y) => eval(x)*eval(y)
  }
}

// -----请忽略以下内容-----

test "第四课练习1" {
  assert_eq!(eval(add(literal(1), literal(0))), 1)
  assert_eq!(eval(literal(1).multiply(literal(10))), 10)
  assert_eq!(
    eval(literal(1).add(literal(0)).multiply(literal(2).multiply(literal(5)))),
    10,
  )
}
