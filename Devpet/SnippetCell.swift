//
//  SnippetCell.swift
//  Devpet
//
//  Created by 강민석 on 2020/12/04.
//

import Cocoa

class SnippetCell: NSTableCellView {
    
    @IBOutlet weak var snippetNameLabel: NSTextField!
    @IBOutlet weak var languageLabel: NSTextField!
    
    var snippetData: String?
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        // Drawing code here.
    }
    
    override func mouseDown(with event: NSEvent) {

        let pasteboardItem = NSPasteboardItem()
        pasteboardItem.setDataProvider(self, forTypes: [.string])

        let draggingItem = NSDraggingItem(pasteboardWriter: pasteboardItem)
        draggingItem.setDraggingFrame(self.bounds, contents: snapshot())

        beginDraggingSession(with: [draggingItem], event: event, source: self)
    }
    
    @IBAction func favoriteButton(_ sender: Any) {
        
    }
}

extension SnippetCell: NSDraggingSource {
    func draggingSession(_ session: NSDraggingSession, sourceOperationMaskFor context: NSDraggingContext) -> NSDragOperation {
        return .generic
    }
}

extension SnippetCell: NSPasteboardItemDataProvider {
    func pasteboard(_ pasteboard: NSPasteboard?, item: NSPasteboardItem, provideDataForType type: NSPasteboard.PasteboardType) {
        if let pasteboard = pasteboard,type == .string {
            pasteboard.setString(snippetData ?? "", forType: type)
        }
    }
}
