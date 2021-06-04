//
//  ViewController.swift
//  test
//
//  Created by brian on 6/3/21.
//

import Cocoa

class MainController: NSViewController {
    let gridItemIdentifier: NSUserInterfaceItemIdentifier = NSUserInterfaceItemIdentifier(rawValue: "gridItem")
    
    let data1 = [[
        "title": "title11",
        "date": "date11",
        "description": "yes, only the dynamic height for the table cells from the existing works you have done, no need the pop-up page, yes, only the dynamic height for the table cells from the existing works you have done, no need the pop-up page, yes, only the dynamic height for the table cells from the existing works you have done, no need the pop-up page"
    ],
    [
        "title": "title12",
        "date": "date12",
        "description": "description12 yes, only the dynamic height for the table cells from the existing works you have done, no need the pop-up page"
    ],
    [
        "title": "title13",
        "date": "date13",
        "description": "description13"
    ]]
    
    let data2 = [[
        "title": "title21",
        "date": "date21",
        "description": "description21"
    ],
    [
        "title": "title22",
        "date": "date22",
        "description": "description22"
    ],
    [
        "title": "title23",
        "date": "date23",
        "description": "description23"
    ]]
    
    let data3 = [[
        "title": "title31",
        "date": "date31",
        "description": "description31"
    ],
    [
        "title": "title32",
        "date": "date32",
        "description": "description32"
    ],
    [
        "title": "title33",
        "date": "date33",
        "description": "description33"
    ]]
    
    var tableData = [[String: Any]]()
    
    @IBOutlet weak var collectionView: NSCollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.isSelectable = true
            collectionView.allowsMultipleSelection = false
            
            collectionView.register(NSNib(nibNamed: "GridItem", bundle: nil), forItemWithIdentifier: gridItemIdentifier)
        }
    }
    
    @IBOutlet weak var tableView: NSTableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.cell?.isBordered = true
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableData = data1
        tableView.reloadData()
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    

    @IBAction func actionNext(_ sender: Any) {
        let alert = NSAlert()
        
        alert.informativeText = ""
        alert.messageText = ""
        alert.icon.size = CGSize(width: 0,height: 0)
        alert.addButton(withTitle: "Save")
        alert.addButton(withTitle: "Close")
        let textfield = NSTextField(frame: NSRect(x: 0.0, y: 0.0, width: 200.0, height: 60.0))
        textfield.alignment = .left
        alert.accessoryView = textfield
        
//        let response = alert.runModal()
        
        alert.beginSheetModal(for: self.view.window!) { (response) in
         
                }
        
//        if response == .alertFirstButtonReturn {
//
//        } else if response == .alertSecondButtonReturn {
//
//        }
    }
    
}

extension MainController: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
            return 3
        }
    
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "tableCell")
        guard let cell = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TableCell else { return 0 }
        let book = Book(fromDictionary: tableData[row])
        let desHeight = cell.lbDescription.bestheight(text: book.description!, width: 511)
        print(desHeight)
            return 63 + desHeight
        }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
//        let currentPurchase = viewModel.purchases[row]
        
        let book = Book(fromDictionary: tableData[row])
        let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "tableCell")
        guard let cell = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? TableCell else { return nil }
        cell.lbDate.stringValue = book.date!
        cell.lbDescription.stringValue = book.description!
        
        cell.lbTitle.stringValue = book.title!
//        cell.layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
//        cell.layer?.borderWidth = 1
//        cell.layer?.borderColor = .white
        return cell
        
    }
}

extension MainController: NSCollectionViewDataSource, NSCollectionViewDelegate  {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        guard let item = collectionView.makeItem(withIdentifier: gridItemIdentifier, for: indexPath) as? GridItem else {
            return NSCollectionViewItem()
            
        }
        item.selectView = {() in
            print(indexPath.item)
            
            switch indexPath.item {
            case 0:
                self.tableData = self.data1
                break
            case 1:
                self.tableData = self.data2
                break
            case 2:
                self.tableData = self.data3
                break
            default:
                self.tableData = self.data1
            }
            
            self.tableView.reloadData()
        }
        
        item.textField?.stringValue = "Cell\(indexPath.item+1)"
        
        return item
    }
}
