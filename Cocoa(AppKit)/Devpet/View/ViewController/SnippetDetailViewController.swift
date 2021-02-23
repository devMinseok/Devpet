//
//  SnippetDetailViewController.swift
//  Devpet
//
//  Created by 강민석 on 2020/12/05.
//

import Cocoa
import Sourceful

class SnippetDetailViewController: NSViewController {
    
    @IBOutlet weak var nameLabel: NSTextField!
    @IBOutlet weak var languageLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var favoriteButton: NSButton!
    
    @IBOutlet weak var syntaxTextView: SyntaxTextView!
    
    var snippetData: Snippet?
    var rootTableView: NSTableView?
    let lexer = SwiftLexer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        syntaxTextView.delegate = self
        syntaxTextView.theme = DefaultSourceCodeTheme()
        
        setData()
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(self)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        guard let data = snippetData else { return }
        DatabaseManager.shared.remove(data)
        rootTableView?.reloadData()
        self.dismiss(self)
    }
    
    func setData() {
        self.nameLabel.stringValue = snippetData?.name ?? ""
        self.languageLabel.stringValue = snippetData?.language ?? ""
        self.descriptionLabel.stringValue = snippetData?.snippetDescription ?? ""
        self.syntaxTextView.text = snippetData?.data ?? ""
        
        if snippetData?.isFavorite ?? false {
//            self.favoriteButton.image = NSImage(systemSymbolName: <#T##String#>, accessibilityDescription: <#T##String?#>)
        } else {
            
        }
    }
}

extension SnippetDetailViewController: SyntaxTextViewDelegate {
    func lexerForSource(_ source: String) -> Lexer {
        return lexer
    }
}
