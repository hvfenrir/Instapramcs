//
//  PhotoDetailsViewController.swift
//  Instagram
//
//  Created by Charles Lee on 11/11/15.
//  Copyright © 2015 HV Fenrir. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var photo: NSDictionary?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = UITableViewCell()
            cell.textLabel?.text = photo?.valueForKeyPath("user.username") as? String
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("photoDetailCell") as! PhotoDetailTableViewCell
        
        let imgUrl = photo!.valueForKeyPath("images.standard_resolution.url") as! String
        cell.detailImageView.setImageWithURL(NSURL(string: imgUrl)!)
        
        return cell

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 100
        }
        return 320
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
