//
//  NSViewController.swift
//  Devpet
//
//  Created by 강민석 on 2020/12/05.
//

import Cocoa

extension NSViewController {
    // MARK: Storyboard instantiation
    static func instantiateViewController<T: NSViewController>(_ identifier: String, storyboardName: String = "Main") -> T {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(storyboardName), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier(identifier)
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? T else {
            fatalError("Check Main.storyboard")
        }
        return viewcontroller
    }
}
