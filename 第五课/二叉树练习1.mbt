// 现有如下二叉树定义
enum IntTree {
  Node(Int, IntTree, IntTree) // 树中的数据、左子树、右子树
  Empty // 空树
} derive(Eq, Show)

// 请尝试从数组构建一个二叉树，定义同课程PPT第七页，即
// 以第n个元素为根节点的树的值存储在第n位
// 左子树为以第n * 2 + 1个元素为根节点的树
// 右子树为以第n * 2 + 2个元素为根节点的树（从零开始计数）
// 例如，[0, 1, 2, 3, 4, 5, 6]应当构成
//         0
//       /   \
//      1     2
//     / \   / \
//    3   4 5   6
// 我们用Option中的None表示该处为空树
// 对于一个数组`array`，你可以通过`let x = array[n]`获得第n位的数据
// 你也可以通过`array.length()`获得数组的长度
// fn array_to_tree(array : Array[Int?]) -> IntTree {
//   // 你可能会需要下方这个辅助函数
//   let length = array.length()
//   fn build(n: Int, array: Array[Int?]) -> IntTree {
//     if n >= length {Empty}
//     else{
//       match array[n]{
//         None => Empty
//         Some(value) => Node(value,build(n*2+1,array),build(n*2+2,array))
//       }
//     }
//   }
//   // 请实现数组转二叉树的函数
//   build(0,array)
// }
fn array_to_tree(array : Array[Int?]) -> IntTree {
  // 你可能会需要下方这个辅助函数
  let length = array.length()
  fn build(n: Int, array: Array[Int?]) -> IntTree {
    if n >= length || array[n] == None {Empty}
    else{
      let Some(value) = array[n]
      Node(value,build(n*2+1,array),build(n*2+2,array))
    }
  }
  // 请实现数组转二叉树的函数
  build(0,array)
}


// 现在，请尝试判断一棵树是否为二叉搜索树
// 事实上，只需要一次中序遍历，判断数字是否从小到大递增即可完成
fn is_binary_search_tree(tree : IntTree) -> Bool {
  // 你可能会需要下方这个辅助函数
  let mut previous_number: Int = -1
  fn check(tree: IntTree) -> Bool {
    match tree{
      Empty => true
      Node(value,left_son,right_son) => {
        if not(check(left_son)) || value <= previous_number{
          false
        }
        else{
          previous_number = value
          check(right_son)
        }
      }
    }
  }
  // 请实现判断二叉搜索树的函数
  check(tree)
}

// 现在，请实现从二叉搜索树中删除元素的函数
// 删除拥有两个子树的根节点时请用左子树最大值替换根节点
fn remove_element(tree : IntTree, n : Int) -> IntTree {
  // 请实现从二叉搜索树中删除元素的函数
  fn find_and_remove_max_element(tree: IntTree) -> (IntTree, Int){
    match tree{
      Node(value, left_son, Empty) => (left_son, value)
      Node(value, left_son, right_son) =>{
        let (ret_right_son, max_element) = find_and_remove_max_element(right_son)
        (Node(value,left_son,ret_right_son), max_element)
      }
      _ => (Empty, 0)
    }
  }
  fn remove_element(tree: IntTree, n: Int) -> IntTree{
    match tree{
      Empty => Empty
      Node(value, left_son, right_son) =>{
        if n == value {
          if left_son == Empty {
            right_son
          }
          else{
            let (ret_left_son, ls_max_element) = find_and_remove_max_element(left_son)
            Node(ls_max_element, ret_left_son, right_son)
          }
        }
        else if n < value {
          Node(value, remove_element(left_son, n), right_son)
        }
        else{
          Node(value, left_son, remove_element(right_son, n))
        }
      }
    }
  }
  remove_element(tree, n)
}

test "test" {
  // let bst = array_to_tree(
  //   [Some(5), Some(2), Some(7), Some(1), Some(4), Some(6), None],
  // )
}


// -----请忽略以下内容-----

test "第五课练习1 数组转二叉树" {
  assert_eq!(array_to_tree([]), Empty)
  assert_eq!(array_to_tree([Some(0)]), Node(0, Empty, Empty))
  assert_eq!(
    array_to_tree([Some(0), None, Some(1)]),
    Node(0, Empty, Node(1, Empty, Empty)),
  )
  assert_eq!(
    array_to_tree([Some(0), Some(1), Some(2), Some(3), Some(4)]),
    Node(
      0,
      Node(1, Node(3, Empty, Empty), Node(4, Empty, Empty)),
      Node(2, Empty, Empty),
    ),
  )
}

test "第五课练习1 判断二叉搜索树" {
  assert_eq!(is_binary_search_tree(array_to_tree([])), true)
  assert_eq!(is_binary_search_tree(array_to_tree([Some(0)])), true)
  assert_eq!(
    is_binary_search_tree(array_to_tree([Some(0), Some(1), Some(2)])),
    false,
  )
  assert_eq!(
    is_binary_search_tree(array_to_tree([Some(2), Some(0), Some(3)])),
    true,
  )
}

test "第五课练习1 二叉搜索树元素删除" {
  let bst = array_to_tree(
    [Some(5), Some(2), Some(7), Some(1), Some(4), Some(6), None],
  )
  assert_eq!(remove_element(bst, 10), bst)
  assert_eq!(
    remove_element(bst, 1),
    array_to_tree([Some(5), Some(2), Some(7), None, Some(4), Some(6), None]),
  )
  assert_eq!(
    remove_element(bst, 7),
    array_to_tree([Some(5), Some(2), Some(6), Some(1), Some(4)]),
  )
  assert_eq!(
    remove_element(bst, 5),
    array_to_tree([Some(4), Some(2), Some(7), Some(1), None, Some(6), None]),
  )
}

