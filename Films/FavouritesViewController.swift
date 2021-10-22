//
//  FavouritesViewController.swift
//  Films
//
//  Created by Francis Suarez on 22/10/21.
//

import Foundation
import UIKit

class FavouritesViewController: UITableViewController {
    
    var favSoundList: NSMutableArray = []
    

    override func viewWillAppear(_ animated: Bool) {

super.viewWillAppear(animated)

        if UserDefaults.standard.object(forKey: "favList") != nil {

            favSoundList = NSMutableArray.init(array: UserDefaults.standard.object(forKey: "favList") as! NSMutableArray)

print(favSoundList)

self.tableView.reloadData()

       }

}

override func viewDidLoad() {

    super.viewDidLoad()

     }

    override func didReceiveMemoryWarning() {

    super.didReceiveMemoryWarning()

    // Dispose of any resources that can be recreated.
  
    }



 func numberOfSectionsInTableView(tableView: UITableView) -> Int {

    // #warning Incomplete implementation, return the number of sections

    return 1

}

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    // #warning Incomplete implementation, return the number of rows

    return favSoundList.count
    }
    
    
override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    

}

 func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "aFav", for: indexPath as IndexPath)

    cell.textLabel?.text = favSoundList.object(at: indexPath.row) as? String

    return cell

      }
}

