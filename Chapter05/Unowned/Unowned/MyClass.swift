//
//  MyClass.swift
//  Unowned
//
//  Created by Jon Hoffman on 5/6/19.
//  Copyright © 2019 Jon Hoffman. All rights reserved.
//

import Foundation

class MyClass1_Unowned {
    var name = ""
    unowned let class2: MyClass2_Unowned
    init(name: String, class2: MyClass2_Unowned) {
        self.name = name
        self.class2 = class2
        print("Initializing class1_Unowned with name \(self.name)")
    }
    deinit {
        print("Releasing class1_Unowned with name \(self.name)")
    }
    
}

class MyClass2_Unowned {
    var name = ""
    var class1: MyClass1_Unowned?
    init(name: String) {
        self.name = name
        print("Initializing class2_Unowned with name \(self.name)")
    }
    deinit {
        print("Releasing class2_Unowned with name \(self.name)")
    }
}

func myFunc() {
    let class2 = MyClass2_Unowned(name: "Class2_Unowned")
    let class1: MyClass1_Unowned? = MyClass1_Unowned(name: "class1_Unowned",
                                                     class2: class2)
    class2.class1 = class1
    print("Classes going out of scope")
}
