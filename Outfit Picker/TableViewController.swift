//
//  TableViewController.swift
//  Traveler2
//
//  Created by TJ on 2/13/18.
//  Copyright © 2018 TJ. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    //Variables for views
    var outfits = [Outfit]()
    var outfitIndex = 0
    var row = Int()
    
    func initializeOutfits() {
        //date formatter
        let outfitName = "Daily"
        let topImageName = "nikehoodie.jpg"
        let bottomImageName = "trouser.jpeg"
        let shoeImageName = "jordan4"
        
        let fit = Outfit(outfitName: outfitName, topImage: topImageName, bottomImage: bottomImageName, shoeImage: shoeImageName)
        outfits.append(fit)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        initializeOutfits()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return outfits.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "outfitCell", for: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = outfits[row].outfitName
        // Configure the cell...
        
        return cell
    }
    
    //sending information to the AddTripView
    /
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //let secondVC = segue.destination as! AddTripViewController
        //secondVC.tripNum = self.trips.count + 1
        if (segue.identifier == "toHanger") //added because crashed when pressed add
        {
            let outfitDetail = segue.destination as! ViewController
            outfitDetail.outfits = self.outfits
            outfitDetail.tripIndex = self.row
        }
    }
    */
    /
    @IBAction func unwindFromSecondView (sender: UIStoryboardSegue) { //grabbing information from addTripViewController
        let secondVC = sender.source as! AddTripViewController
        //self.saveFlag = secondVC.saveFlag
        if (secondVC.saveFlag == true)
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let newTrip = Trip(destinationName: secondVC.newDestination, startDate: secondVC.newStartDate, endDate: secondVC.newEndDate)
            trips.append(newTrip)
            tripIndex = trips.count - 1
            self.tableView.reloadData()
            //displayTrip()
        }
    }*/
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            outfits.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    //touching a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.row = indexPath.row // retain for prepareForSegue
        performSegue(withIdentifier: "toHanger", sender: nil)
    }
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
