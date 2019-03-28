//
//  AppDelegate.swift
//  Quiz 2
//
//  Created by Salsha Armenia Amosea on 30/03/19.
//  Copyright © 2019 Salsha Armenia Amosea. All rights reserved.
//

import Cocoa

enum Cell {
    case empty
    case blocked
    case start
    case goal
    case path
    func color() -> CGColor {
        switch (self) {
        case .empty: return NSColor.white.cgColor
        case .blocked: return NSColor.black.cgColor
        case .start: return NSColor.green.cgColor
        case .goal: return NSColor.red.cgColor
        case .path: return NSColor.yellow.cgColor
        }
    }
}

struct Point: Hashable {
    let x: Int
    let y: Int
}

func == (lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}


//class MazeView: NSView {
//    
//}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    @IBOutlet weak var window: NSWindow!
    
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    
}


