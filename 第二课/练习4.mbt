let ex4_value1 : Int = 1 + 2 * 3

// 请将下方代码替换为你对其上方表达式简化值的预测
let ex4_value1的值 : Int = 7

let ex4_value2 : Int = 1 / 2

// 请将下方代码替换为你对其上方表达式简化值的预测
let ex4_value2的值 : Int = 0

let ex4_value3 : Int64 = 2147483647L + 2147483647L

// 请将下方代码替换为你对其上方表达式简化值的预测
let ex4_value3的值 : Int64 = 4294967294L

let ex4_value4 : Int = 2147483647 + 1

// 请将下方代码替换为你对其上方表达式简化值的预测
let ex4_value4的值 : Int = -2147483648

let ex4_value5 : Bool = 0 != 0 || 0 == 1 && true

// 请将下方代码替换为你对其上方表达式简化值的预测
let ex4_value5的值 : Bool = false

let ex4_value6 : Bool = (true || false) && true || false != true

// 请将下方代码替换为你对其上方表达式简化值的预测
let ex4_value6的值 : Bool = true

// -----请忽略以下内容-----
test "第二课练习4" {
  assert_eq!(ex4_value1, ex4_value1的值)
  assert_eq!(ex4_value2, ex4_value2的值)
  assert_eq!(ex4_value3, ex4_value3的值)
  assert_eq!(ex4_value4, ex4_value4的值)
  assert_eq!(ex4_value5, ex4_value5的值)
  assert_eq!(ex4_value6, ex4_value6的值)
}
