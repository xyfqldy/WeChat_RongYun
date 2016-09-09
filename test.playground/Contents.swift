//: Playground - noun: a place where people can play

import UIKit

struct Inputs:OptionSetType{
    let rawValue: Int
    static let user = Inputs(rawValue: 1)
    static let pass = Inputs(rawValue: 1 << 1)
    static let mail = Inputs(rawValue: 1 << 2)
}

//判断是否全部输入
extension Inputs{
    func isAllOk() -> Bool {
//        return self == [.user,.pass,.mail]
//        return self.rawValue == 0b111
    //选项的数目
    let count = 3
    //找到几项
    var found = 0
//    for time in 0...count{
//        if self.contains(Inputs(rawValue:1 << time)) {
//            found += 1
//        }
//    }
    //swift中的高级用法 for循环直接过滤！
    for time in 0...count where self.contains(Inputs(rawValue:1 << time)) {
        
            found += 1
        
    }
    //是否全部找到
    return found == count
    }
}
extension Inputs:BooleanType{
     var boolValue:Bool{
        return self.rawValue == 0b111
    }
}
//只有声明了optionsettype类型的结构体才可以写下面的形式
let possibleInputs:Inputs = [.user,.pass]
possibleInputs.isAllOk()
possibleInputs.contains(.user)



struct People {
    let name:String
}

let xiaowang = People.init(name: "wang")
let xiaohong:People = People(name: "hong")
print(xiaowang.name)
print(xiaohong.name)







