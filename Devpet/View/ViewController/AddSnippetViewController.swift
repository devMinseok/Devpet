//
//  AddSnippetViewController.swift
//  Devpet
//
//  Created by 강민석 on 2020/12/05.
//

import Cocoa
import Sourceful
import RealmSwift

class AddSnippetViewController: NSViewController {
    
    @IBOutlet weak var nameField: NSTextField!
    @IBOutlet weak var languageField: NSTextField!
    @IBOutlet weak var descriptionField: NSTextField!
    
    @IBOutlet weak var syntaxTextView: SyntaxTextView!
    
    let lexer = SwiftLexer()
    var rootPopover: NSPopover?
    var rootTableView: NSTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syntaxTextView.delegate = self
        syntaxTextView.theme = DefaultSourceCodeTheme()
        
        syntaxTextView.text = """
                            // Write your code.
                            """
    }
    
    override func awakeFromNib() {
        self.view.wantsLayer = true
        if self.view.layer != nil {
            self.view.layer?.backgroundColor = NSColor.white.cgColor
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        let snippet = Snippet(name: self.nameField.stringValue,
                              language: languageField.stringValue,
                              description: descriptionField.stringValue,
                              data: syntaxTextView.text)
        
        DatabaseManager.shared.add(snippet)
        rootTableView?.reloadData()
        rootPopover?.performClose(sender)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        rootPopover?.performClose(sender)
    }
}

extension AddSnippetViewController: SyntaxTextViewDelegate {
    func lexerForSource(_ source: String) -> Lexer {
        return lexer
    }
}
