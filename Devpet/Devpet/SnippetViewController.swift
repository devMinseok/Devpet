//
//  SnippetViewController.swift
//  Devpet
//
//  Created by 강민석 on 2020/10/07.
//

import Cocoa

class SnippetViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension SnippetViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> SnippetViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier("SnippetViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SnippetViewController else {
            fatalError("Check Main.storyboard")
        }
        return viewcontroller
    }
}
