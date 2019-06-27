//
//  MyClass.swift
//  StrongReferenceCycle
//
//  Created by Jon Hoffman on 5/6/19.
//  Copyright © 2019 Jon Hoffman. All rights reserved.
//

import Foundation

class MyClass1_Strong {
    var name = ""
    var class2: MyClass2_Strong?
    init(name: String) {
        self.name = name
        print("Initializing class1_Strong with name \(self.name)")
    }
    deinit {
        print("Releasing class1_Strong with name \(self.name)")
    }
}

class MyClass2_Strong {
    var name = ""
    var class1: MyClass1_Strong?
    init(name: String) {
        self.name = name
        print("Initializing class2_Strong with name \(self.name)")
    }
    deinit {
        print("Releasing class2_Strong with name \(self.name)")
    }
}


func myFunc() {
    var class1: MyClass1_Strong? = MyClass1_Strong(name: "Class1_Strong")
    var class2: MyClass2_Strong? = MyClass2_Strong(name: "Class2_Strong")
    
    class1?.class2 = class2
    class2?.class1 = class1
    
    print("Setting classes to nil")
    class2 = nil
    class1 = nil
}
