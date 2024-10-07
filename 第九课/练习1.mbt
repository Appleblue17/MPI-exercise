// 此练习参考Rust By Practice(https://practice.course.rs)

// 现对农场的动物做如下抽象：一个动物应当有名字，且会发出某种特定的叫声
trait Animal {
  get_name(Self) -> String // 获得动物名字
  get_noise(Self) -> String // 获得动物叫声
}

// 于是，我们可以说，一个动物会发出某种叫声
fn talk[T : Animal](animal : T) -> String {
  let name = animal.get_name()
  let noise = animal.get_noise()
  "\{name}发出了叫声：\{noise}"
}

// 现在牧场中养了一些羊
struct Sheep {
  // 请实现羊的数据结构
  name: String
  noise: String
}
// 并且实现接口
fn get_name(self: Sheep) -> String{
  self.name
}
fn get_noise(self: Sheep) -> String{
  self.noise
}
fn panic() -> Sheep{
  {name: "绵羊", noise: "咩"}
}

test "第九课练习1" {
  let animal : Animal = (panic() : Animal)
  inspect!(talk(animal), content="绵羊发出了叫声：咩")
}
