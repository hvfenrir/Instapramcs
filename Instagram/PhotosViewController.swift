//
//  PhotosViewController.swift
//  Instagram
//
//  Created by Charles Lee on 11/11/15.
//  Copyright © 2015 HV Fenrir. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    var photos = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        }
        
        task.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
