//
//  SnippetsViewController.swift
//  Devpet
//
//  Created by 강민석 on 2020/10/21.
//

import Cocoa

class SnippetsViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    
    let snippets = [
        ["name":"MVVM", "language":"Swift", "isFavorite":true, "data":"test1"],
        ["name":"MVC", "language":"Swift", "isFavorite":false, "data":"test2"],
        ["name":"MVP", "language":"Swift", "isFavorite":false, "data":"test3"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = NSColor.white.cgColor
        }
    }
}

extension SnippetsViewController: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.snippets.count
    }
    
    // 셀에 데이터 넣기
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let snippetCell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SnippetCell"), owner: self) as? SnippetCell else { return nil }
        
        snippetCell.snippetNameLabel.stringValue = self.snippets[row]["name"] as! String
        snippetCell.languageLabel.stringValue = self.snippets[row]["language"] as! String
        snippetCell.snippetData = self.snippets[row]["data"] as? String
        
        return snippetCell
    }
    
//    func tableView(_ tableView: NSTableView, didClick tableColumn: NSTableColumn) {
//        tableView.deselectRow(tableView.selectedRow)
//    }
    func tableViewSelectionDidChange(_ notification: Notification) {
        let selectedRow = notification.object as! NSTableView
        tableView.deselectRow(selectedRow.selectedRow)
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
