//
//  DetailViewController.swift
//  DemoApp
//
//  Created by krunal thakkar on 08/10/17.
//  Copyright © 2017 krunal thakkar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
var gameTimer: Timer!
    var total : Int = 250
    var counter : Int = 0
    var imageCount : Int = 0
    var progressBar = UIProgressView()

    var images = ["Storyimage1","Storyimage2","Storyimage3","Storyimage4"]
    @IBOutlet var imageProgress: UIProgressView!
    @IBOutlet weak var storyImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.storyImageView.image = UIImage(named: self.images[imageCount])

        self.navigationController?.isNavigationBarHidden = true
        gameTimer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(dismissVC), userInfo: nil, repeats: true)
    }
    @objc func dismissVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            // code to remove your view
            UIView.animate(withDuration: 1, animations: { () -> Void in
                self.counter = self.counter + 1
                self.storyImageView.image = UIImage(named: self.images[self.imageCount])
                self.imageProgress.setProgress(Float(self.counter)/Float(self.total), animated: false)
                
            })
            if self.total == self.counter {
                if self.imageCount >= self.images.count{
                        self.navigationController?.popViewController(animated: true)
                    }
                    else{
                    self.imageCount = self.imageCount + 1
                    self.gameTimer.invalidate()
                    self.progressBar.setProgress(0.00, animated: false)
                    }
            }
        }
    }
    @IBAction func btnClose(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
