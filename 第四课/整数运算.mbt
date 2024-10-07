enum ComputeResult {
  Success(Int)
  Overflow
  DivideByZero
} derive(Show, Eq)

// 请基于上述数据类型，定义整数的四则运算

fn plus_int(a : Int, b : Int) -> ComputeResult {
  // 请定义整数加法
  let res = a+b
  let correct_res: Int64 = a.to_int64()+b.to_int64()
  if res.to_int64() == correct_res {Success(res)}
  else {Overflow}
}

fn minus_int(a : Int, b : Int) -> ComputeResult {
  // 请定义减法
  let res = a-b
  let correct_res: Int64 = a.to_int64()-b.to_int64()
  if res.to_int64() == correct_res {Success(res)}
  else {Overflow}
}

fn multiply_int(a : Int, b : Int) -> ComputeResult {
  // 请定义乘法
  let res = a*b
  let correct_res: Int64 = a.to_int64()*b.to_int64()
  if res.to_int64() == correct_res {Success(res)}
  else {Overflow}
}

fn divide_int(a : Int, b : Int) -> ComputeResult {
  // 请定义除法
  if b == 0 {DivideByZero}
  else{
    let res = a/b
    Success(res)
  }
}

// 我们发现，这样定义的四则运算并不方便嵌套，因此我们另外定义一套基于运算结果再次运算的函数
// 如果已经出现错误，则保留错误；否则，继续进行运算

fn plus(self : ComputeResult, b : Int) -> ComputeResult {
  // 请定义基于计算结果的加法
  match (self,b){
    (Success(x), y) => plus_int(x,y)
    (err,_) => err
  }
}

fn minus(self : ComputeResult, b : Int) -> ComputeResult {
  // 请定义基于计算结果的减法
  match (self,b){
    (Success(x), y) => minus_int(x,y)
    (err,_) => err
  }
}

fn multiply(self : ComputeResult, b : Int) -> ComputeResult {
  // 请定义基于计算结果的乘法
  match (self,b){
    (Success(x), y) => multiply_int(x,y)
    (err,_) => err
  }
}

fn divide(self : ComputeResult, b : Int) -> ComputeResult {
  // 请定义基于计算结果的除法
  match (self,b){
    (Success(x), y) => divide_int(x,y)
    (err,_) => err
  }
}

// -----请忽略以下内容-----

test "第四课练习2" {
  assert_eq!(plus_int(1, 2), Success(3))
  assert_eq!(minus_int(0, 1), Success(-1))
  assert_eq!(plus_int(2_147_483_647, 1), Overflow)
  assert_eq!(minus_int(-2_147_483_648, 100000), Overflow)
  assert_eq!(divide_int(100, 0), DivideByZero)
  assert_eq!(ComputeResult::Overflow.plus(1), Overflow)
  assert_eq!(ComputeResult::DivideByZero.minus(100), DivideByZero)
}
