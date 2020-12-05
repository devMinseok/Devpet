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
    var addSnippetViewController: AddSnippetViewController!
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        self.snippets = DatabaseManager.shared.searchByType(type: Snippet())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.wantsLayer = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        addSnippetViewController = AddSnippetViewController.instantiateViewController("AddSnippetViewController")
        popover.contentViewController = addSnippetViewController
        popover.behavior = .semitransient
    }
    
    override func awakeFromNib() {
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = NSColor.white.cgColor
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        if popover.isShown {
            popover.performClose(sender)
        } else {
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
}
