//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Vicky Tang on 2/23/17.
//  Copyright © 2017 Vicky Tang. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController {

    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var postTextField: UITextField!
    
    var posts: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postButtonPressed(_ sender: Any) {
        var newPost = PFObject(className:"Message")
        newPost["text"] = postTextField.text

        newPost.saveInBackground {
            (success: Bool, error: Error?) -> Void in
            if (success) {
                print("Success: Message has been successfully saved!")
            } else {
                // There was a problem, check error.description
            }
        }
    }
    
    func onTimer() {
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: "onTimer", userInfo: nil, repeats: true)
        
        var query = PFQuery(className:"Message")
        //query.whereKey("playerName", equalTo:"Sean Plott")
        query.findObjectsInBackground {
            (objects: [PFObject]?, error: Error?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                // Do something with the found objects
                if let objects = objects {
                    for object in objects {
                        
                        print(object.objectId)
                    }
                }
            } else {
                // Log details of the failure
                //print("Error: \(error!) \(error!.userInfo)")
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
