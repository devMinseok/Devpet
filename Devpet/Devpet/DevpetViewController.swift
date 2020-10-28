//
//  DevpetViewController.swift
//  Devpet
//
//  Created by 강민석 on 2020/10/21.
//

import Cocoa

class DevpetViewController: NSViewController {

}

extension DevpetViewController {
    // MARK: Storyboard instantiation
    static func freshController() -> DevpetViewController {
        //1.
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        //2.
        let identifier = NSStoryboard.SceneIdentifier("DevpetViewController")
        //3.
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? SampleViewController else {
            fatalError("Why cant i find SampleViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}
