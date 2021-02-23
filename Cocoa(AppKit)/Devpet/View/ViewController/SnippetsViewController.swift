//
//  SnippetsViewController.swift
//  Devpet
//
//  Created by 강민석 on 2020/10/21.
//

import Cocoa
import RealmSwift

class SnippetsViewController: NSViewController {
    
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var addButton: NSButton!
    
    var snippets: Results<Snippet>?
    let popover = NSPopover()
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.snippets = DatabaseManager.shared.searchByType(type: Snippet())
    }
    
    override func awakeFromNib() {
        self.view.wantsLayer = true
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = NSColor.white.cgColor
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
            let viewController: AddSnippetViewController =  AddSnippetViewController.instantiateViewController("AddSnippetViewController")
            
            viewController.rootPopover = self.popover
            viewController.rootTableView = self.tableView
            
            popover.contentViewController = viewController
            popover.behavior = .semitransient
            
            popover.show(relativeTo: addButton.bounds, of: addButton, preferredEdge: .minX)
        }
    }
}

extension SnippetsViewController: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return self.snippets?.count ?? 0
    }
    
    // 셀에 데이터 넣기
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "SnippetCell"), owner: self) as? SnippetCell else { return nil }
        cell.setData(snippet: self.snippets?[row] ?? Snippet())
        return cell
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let selectedRow = notification.object as! NSTableView
        tableView.deselectRow(selectedRow.selectedRow)
    }
    
    func tableView(_ tableView: NSTableView, shouldSelectRow row: Int) -> Bool {
        
        let viewController: SnippetDetailViewController = SnippetDetailViewController.instantiateViewController("SnippetDetailViewController")

        viewController.snippetData = self.snippets?[row]
        viewController.rootTableView = self.tableView
        
        self.presentAsModalWindow(viewController)
        return true
    }
}
