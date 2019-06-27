//
//  MyClass.swift
//  weak
//
//  Created by Jon Hoffman on 5/6/19.
//  Copyright © 2019 Jon Hoffman. All rights reserved.
//

import Foundation

class MyClass1_Weak {
    var name = ""
    var class2: MyClass2_Weak?
    init(name: String) {
        self.name = name
        print("Initializing class1_Weak with name \(self.name)")
    }
    deinit {
        print("Releasing class1_Weak with name \(self.name)")
    }
}

class MyClass2_Weak {
    var name = ""
    weak var class1: MyClass1_Weak?
    init(name: String) {
        self.name = name
        print("Initializing class2_Weak with name \(self.name)")
    }
    deinit {
        print("Releasing class2_Weak with name \(self.name)")
    }
}

func myFunc() {
    let class1: MyClass1_Weak? = MyClass1_Weak(name: "Class1_Weak")
    let class2: MyClass2_Weak? = MyClass2_Weak(name: "Class2_Weak")
    
    class1?.class2 = class2
    class2?.class1 = class1
    
    print("Classes going out of scope")

}
