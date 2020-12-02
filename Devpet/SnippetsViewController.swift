//
//  SnippetsViewController.swift
//  Devpet
//
//  Created by 강민석 on 2020/10/21.
//

import Cocoa

class SnippetsViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = NSColor.white.cgColor
        }
    }
    
}

extension SnippetsViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> SnippetsViewController {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("SnippetsViewController")
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SnippetsViewController else {
            fatalError("Check Main.storyboard")
        }
        return viewcontroller
    }
}
