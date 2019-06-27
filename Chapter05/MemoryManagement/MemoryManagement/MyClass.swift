//
//  MyClass.swift
//  MemoryManagement
//
//  Created by Jon Hoffman on 5/6/19.
//  Copyright © 2019 Jon Hoffman. All rights reserved.
//

import Foundation

class MyClass {
    var name = ""
    init(name: String) {
        self.name = name
        print("Initializing class with name \(self.name)")
    }
    deinit {
        print("Releasing class with name \(self.name)")
    }
}
