//
//  ViewController.swift
//  SlideshowApp
//
//  Created by cpcadmin on 2024/02/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var saiseibuttonname: UIButton!
    @IBOutlet weak var susumubutton: UIButton!
    @IBOutlet weak var modorubutton: UIButton!
    
    let imageName = ["gazo1","gazo2","gazo3"]
    var changeimageNo = 0
    var timer:Timer!
    var count = 0
    var saiseistate = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @objc func updateTimer(_ timer: Timer){
        if saiseistate == 1{
            self.count += 1
            if count == 2 {
                count = 0
                if changeimageNo == 0 {
                    changeimageNo = 1
                }else if changeimageNo == 1 {
                    changeimageNo = 2
                }else if changeimageNo == 2 {
                    changeimageNo = 0
                }
                let name = imageName[changeimageNo]
                image.image=UIImage(named:name)
            }
        }else if saiseistate == 0{
            count = 0
            saiseistate = 0
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    @IBAction func saisei(_ sender: Any) {
        if saiseistate == 0{
            saiseistate = 1
            saiseibuttonname.setTitle("停止", for:.normal)
            susumubutton.isUserInteractionEnabled = false
            modorubutton.isUserInteractionEnabled = false
        }else if saiseistate == 1{
            saiseistate = 0
            saiseibuttonname.setTitle("再生", for:.normal)
            susumubutton.isUserInteractionEnabled = true
            modorubutton.isUserInteractionEnabled = true
        }
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector: #selector(updateTimer(_:)), userInfo:nil, repeats:true)
        }
    }
    
    @IBAction func susumu(_ sender: Any) {
        if changeimageNo == 0 {
            changeimageNo = 1
        }else if changeimageNo == 1 {
            changeimageNo = 2
        }else if changeimageNo == 2 {
            changeimageNo = 0
        }
        let name = imageName[changeimageNo]
        image.image=UIImage(named:name)
    }
    @IBAction func mdooru(_ sender: Any) {
        if changeimageNo == 0 {
            changeimageNo = 2
        }else if changeimageNo == 1 {
            changeimageNo = 0
        }else if changeimageNo == 2 {
            changeimageNo = 1
        }
        let name = imageName[changeimageNo]
        image.image=UIImage(named:name)
    }
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }

}

