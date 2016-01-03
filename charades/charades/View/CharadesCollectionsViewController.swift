//
//  ViewController.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import UIKit

class CharadesCollectionsViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var datasource = ["Famosos do Mundo", "Países", "Expressões Populares"]
    var kCellIdentifier = "CharadeCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CharadesCollectionsViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(kCellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = self.datasource[indexPath.row]
        return cell
    }
    
}

extension CharadesCollectionsViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
}