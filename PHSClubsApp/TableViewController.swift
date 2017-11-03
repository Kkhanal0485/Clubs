//
//  TableViewController.swift
//  PHSClubsApp
//
//  Created by apcs2 on 10/30/17.
//  Copyright © 2017 apcs2. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var clubTableVIew: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            //cell.textLabel.text = [indexPath.row]
            //cell.detailTextLabel.text = [indexPath.row]
            //cell.imageView.image = [indexPath.row]
            return cell
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            let nvc = segue.destination as! ViewController
            let indexPath = clubTableVIew.indexPathForSelectedRow!
            //                                                                                                                          nvc.selectedSeason = seasonsArray[(indexPath.row)]
        }
    }
    


