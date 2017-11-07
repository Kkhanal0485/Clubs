//
//  TableViewController.swift
//  PHSClubsApp
//
//  Created by apcs2 on 10/30/17.
//  Copyright © 2017 apcs2. All rights reserved.
// DZN empty coco pod

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
   
    @IBOutlet weak var clubsTableView: UIView!
    
    //"id": "3",
//    "name": "Test Club",
//    "author": "root",
//    "sponsor": "root",
//    "location": "PHS",
//    "time": "4:00-5:00",
//    "type": "Development",
//    "desc": "Very fun! Make new friends!"

    var namesList = [String!]()
    var authorList = [String!]()
    var sponsorList = [String!]()
    var locationList = [String!]()
    var timeList = [String!]()
    var typeList = [String!]()
    var descList = [String!]()
    
    var arrayList: [String?] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        parseJSON()
    }
        func parseJSON()
        {
            let url = URL(string: "https://api.hoogleyboogley.com/apcs2/clubs")!
            let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let JSONObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary
                {
                    self.namesList = [String]()
                    let arrayList = JSONObject.object(forKey:"clubs") as! NSDictionary
                    for index in 0..<arrayList.count
                    {
                        let clubsArray = arrayList[index]
                        let clubName = (clubsArray as AnyObject!).object(forKey: "name")
                        let clubAuthor = (clubsArray as AnyObject!).object(forKey: "author")
                        let clubSponsor = (clubsArray as AnyObject!).object(forKey:"sponsor")
                        let clubLocation = (clubsArray as AnyObject!).object(forKey: "location")
                        let clubTime = (clubsArray as AnyObject!).object(forKey: "time")
                        let clubType = (clubsArray as AnyObject!).object(forKey: "type")
                        let clubDescription = (clubsArray as AnyObject!).object(forKey: "desc")
                        
                        self.namesList.append("\(clubName)")
                        self.authorList.append("\(clubAuthor)")
                        self.sponsorList.append("\(clubSponsor)")
                        self.locationList.append("\(clubLocation)")
                        self.timeList.append("\(clubTime)")
                        self.typeList.append("\(clubType)")
                        self.descList.append("\(clubDescription)")
                    }
                    OperationQueue.main.addOperation
                        {
                        self.clubsTableView.reloadData()
                        }
            }
                session.resume()
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
        func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            let nvc = segue.destination as! SecondViewController
            let indexPath = tableView.indexPathForSelectedRow!
            nvc.selectedSeason = seasonsArray[(indexPath.row)]
        }
    

}
