//
//  PhotosViewController.swift
//  Instagram
//
//  Created by Charles Lee on 11/11/15.
//  Copyright © 2015 HV Fenrir. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var photoTableView: UITableView!
    var photos = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoTableView.delegate = self
        photoTableView.dataSource = self
        photoTableView.rowHeight = 320
        // Do any additional setup after loading the view.
        let clientId = "3d48106601d1433cb3e9c0d78940124e"
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!) { (data, response, error) -> Void in
            guard error == nil else {
                print("error loading from URL", error!)
                return
            }
            let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
            self.photos = json["data"] as! [NSDictionary]
            print("photos",self.photos)
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.photoTableView.reloadData()
            })
        }
        
        task.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = photoTableView.dequeueReusableCellWithIdentifier("photoCell") as! PhotoTableViewCell
        let photo = photos[indexPath.row]
        let imgUrl = photo.valueForKeyPath("images.standard_resolution.url") as! String
        cell.photoImageView.setImageWithURL(NSURL(string: imgUrl)!)
        return cell
    }

}
