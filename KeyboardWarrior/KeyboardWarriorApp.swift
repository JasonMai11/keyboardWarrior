//
//  KeyboardWarriorApp.swift
//  KeyboardWarrior
//
//  Created by Jason Mai on 8/22/26.
//

import SwiftUI

@main
struct KeyboardWarriorApp: App {
    
    init() {
        #if DEBUG
        runTypeEngineManualTest()
        #endif
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
