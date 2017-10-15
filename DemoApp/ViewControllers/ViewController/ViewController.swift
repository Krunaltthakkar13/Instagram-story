//
//  ViewController.swift
//  DemoApp
//
//  Created by krunal thakkar on 05/10/17.
//  Copyright © 2017 krunal thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageTableView: UITableView!
    var storedOffsets = [Int: CGFloat]()

    var images = ["images1.png","images2.png","images3.png","images4.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTableView.estimatedRowHeight = 500
        imageTableView.rowHeight = UITableViewAutomaticDimension

        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func thumbsUpButtonPressed() {
        print("thumbs up button pressed")
    }
    
    
    override func viewDidLayoutSubviews() {
    }
}

extension ViewController : UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return images.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = imageTableView.dequeueReusableCell(withIdentifier: "Cell") as! ImageCell!
        cell?.cellImage.image = UIImage(named: images[indexPath.row])
        return cell!
    }
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = imageTableView.dequeueReusableCell(withIdentifier: "headerCell") as! CustomHeaderCell!
        return headerCell!
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}


