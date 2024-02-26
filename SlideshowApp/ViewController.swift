//
//  ViewController.swift
//  SlideshowApp
//
//  Created by cpcadmin on 2024/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    let imageName = ["gazo1","gazo2","gazo3"]
    var imageNo = 0
    var timer:Timer!
    var count = 0
    var playState = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @objc func updateTimer(_ timer: Timer){
        if playState == 1{
            self.count += 1
            if count == 2 {
                count = 0
                if imageNo == 0 {
                    imageNo = 1
                }else if imageNo == 1 {
                    imageNo = 2
                }else if imageNo == 2 {
                    imageNo = 0
                }
                let name = imageName[imageNo]
                image.image=UIImage(named:name)
            }
        }else if playState == 0{
            count = 0
            playState = 0
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    @IBAction func saisei(_ sender: Any) {
        if playState == 0{
            playState = 1
            playButton.setTitle("停止", for:.normal)
            nextButton.isEnabled = false
            backButton.isEnabled = false
        
        }else if playState == 1{
            playState = 0
            playButton.setTitle("再生", for:.normal)
            nextButton.isEnabled = true
            backButton.isEnabled = true
        }
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateTimer(_:)), userInfo:nil, repeats:true)
        }
    }
    
    @IBAction func susumu(_ sender: Any) {
        if imageNo == 0 {
            imageNo = 1
        }else if imageNo == 1 {
            imageNo = 2
        }else if imageNo == 2 {
            imageNo = 0
        }
        let name = imageName[imageNo]
        image.image=UIImage(named:name)
    }
    @IBAction func mdooru(_ sender: Any) {
        if imageNo == 0 {
            imageNo = 2
        }else if imageNo == 1 {
            imageNo = 0
        }else if imageNo == 2 {
            imageNo = 1
        }
        let name = imageName[imageNo]
        image.image=UIImage(named:name)
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }

}

