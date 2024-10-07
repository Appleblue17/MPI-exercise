// 现有如下AVL树定义
enum AVLTree {
  Node(Int, AVLTree, AVLTree, Int, Int) // 树中的数据、左子树、右子树、高度、大小
  Empty // 空树
} derive(Eq, Show)

// 现在，请实现向AVL树中添加元素的操作
fn max[T: Compare](x: T,y: T) -> T{
  if x>y {x} else {y}
}
// fn min[T: Compare](x: T,y: T) -> T{
//   if x<y {x} else {y}
// }
fn height(tree: AVLTree) -> Int{
  match tree{
    Empty => -1
    Node(_, _, _, height, _) => height
  }
}
fn size(tree: AVLTree) -> Int{
  match tree{
    Empty => 0
    Node(_, _, _, _, size) => size
  }
}
fn construct(value: Int, left_son: AVLTree, right_son: AVLTree) -> AVLTree{
  let height = max(height(left_son),height(right_son))+1
  let size = size(left_son)+size(right_son)+1
  Node(value, left_son, right_son, height, size)
}
fn insert(tree : AVLTree, value : Int) -> AVLTree {
  // 请实现向AVL树中添加元素的函数
  fn insert(tree: AVLTree) -> AVLTree{
    match tree{
      Empty => Node(value, Empty, Empty, 0, 1)
      Node(node_value, left_son, right_son, _, _) =>{
        if value == node_value {tree}
        else if value < node_value {
          construct(node_value,insert(left_son),right_son)
        }
        else{
          construct(node_value,left_son,insert(right_son))
        }
      }
    }
  }
  insert(tree)
}

// 现在，请查找树中第k小的元素
// 从1开始计数
fn kth_smallest(tree : AVLTree, k : Int) -> Int? {
  // 请实现查找树中第k小的元素的函数
  // if k <= 0 {None}
  // else{
    fn kth_smallest(tree : AVLTree, k : Int) -> Int?{
      match tree{
        Empty => None
        Node(value, left_son, right_son, _, _) =>{
          let ls_size = size(left_son)
          if k == ls_size+1 { Some(value) }
          else if k <= ls_size { kth_smallest(left_son, k) }
          else { kth_smallest(right_son, k-ls_size-1) }
        }
      }
    }
    kth_smallest(tree, k)
  // }
}

// -----请忽略以下内容-----

fn contains(self : AVLTree, target : Int) -> Bool {
  match self {
    Empty => false
    Node(value, left, right, _, _) =>
      value == target || value > target && left.contains(target) || value < target &&
      right.contains(target)
  }
}

fn is_balanced(self : AVLTree) -> Bool {
  match self {
    Empty => true
    Node(_, Empty, Empty, _, _) => true
    Node(_, Node(_, _, _, h, _) as left, Empty, _, _) => h <= 2 && left.is_balanced()
    Node(_, Empty, Node(_, _, _, h, _) as right, _, _) =>
      h <= 2 && right.is_balanced()
    Node(_, Node(_, _, _, h1, _) as left, Node(_, _, _, h2, _) as right, _, _) =>
      h1 >= h2 - 2 && h1 <= h2 + 2 && left.is_balanced() && right.is_balanced()
  }
}

test "第五课练习2 AVL树的添加" {
  let tree = [1, 2, 3, 0, -5, -8, 100, 2048].fold(
    insert,
    init=AVLTree::Empty,
  )
  assert_true!(tree.contains(3))
  assert_true!(tree.contains(0))
  assert_true!(tree.contains(2048))
  assert_true!(tree.is_balanced())
}

test "第五课练习2 查找第k小的值" {
  let tree = [1, 2, 3, 0, -5, -8, 100, 2048].fold(
    insert,
    init=AVLTree::Empty,
  )
  assert_eq!(kth_smallest(tree, 1), Some(-8))
  assert_eq!(kth_smallest(tree, 2), Some(-5))
  assert_eq!(kth_smallest(tree, 3), Some(0))
  assert_eq!(kth_smallest(Empty, 3), None)
}
