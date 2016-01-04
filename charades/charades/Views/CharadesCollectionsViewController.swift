//
//  ViewController.swift
//  charades
//
//  Created by Talita Lopes on 1/3/16.
//  Copyright © 2016 Talita Lopes. All rights reserved.
//

import UIKit

enum CharadesCellSetup {
    case Odd, Even
    
    init(index: Int) {
        if (index % 2 == 0) {
            self = .Even
            return
        }
        self = .Odd
    }
    
    func setup(cell: CharadeCell) {
        cell.titleLabel.backgroundColor = UIColor.charadesCollectionColor()
        cell.titleLabel.textColor = UIColor.charadesCollectionTextColor()
        
        cell.clipsToBounds = false
        cell.titleLabel.layer.shadowColor = UIColor.shadowColor().CGColor
        cell.titleLabel.layer.shadowOffset = CGSizeMake(0, 3)
        cell.titleLabel.layer.shadowOpacity = 0.5
        
        cell.backgroundColor = UIColor.mainBackgoundColor()
    }
}

class CharadesCollectionsViewController: UIViewController {

    @IBOutlet weak var tableView : UITableView!
    
    var datasource = ["Famosos do Mundo", "Países", "Expressões Populares"]
    var kCellIdentifier = "CharadeCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor.mainBackgoundColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Charades"
        self.navigationController?.navigationBarHidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let title = sender as? String
        
        if let destinationViewController = segue.destinationViewController as? GameRoundViewController {
            destinationViewController.title = title
        }
        
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
        
        if let charadeCell = cell as? CharadeCell {
            charadeCell.titleLabel?.text = self.datasource[indexPath.row]
            CharadesCellSetup(index: indexPath.row).setup(charadeCell)
        }
        
        return cell
    }
    
}

extension CharadesCollectionsViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        self.performSegueWithIdentifier("CharadeSegue", sender: self.datasource[indexPath.row])
    }
    
}