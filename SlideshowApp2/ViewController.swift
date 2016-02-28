//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by akikohatayama on 2016/02/22.
//  Copyright © 2016年 AkikoHatayama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var baseView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    let photos: [String]  = ["photo1.jpg", "photo2.jpg", "photo3.jpg", "photo4.png"]
    var indexNum: Int = 0

    weak var timer: NSTimer?
    var moveFlag: Bool = true
    let start: UIImage? = UIImage(named: "start.jpg")
    let stop: UIImage? = UIImage(named: "stop.jpg")
    let next: UIImage? = UIImage(named: "next.jpg")
    let back: UIImage? = UIImage(named: "back.jpg")
    let fruit: UIImage? = UIImage(named: "fruit.jpg")
    
    let control = Control()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        //スライド画像表示
        imageDisplay()
        
        //画像表示
        baseView.image = fruit
        self.view.addSubview(baseView)
        self.view.sendSubviewToBack(baseView)
        
        //次へボタン画像表示
        control.ButtonDisplay(next!, Button: nextButton)
        
        //前へボタン画像表示
        control.ButtonDisplay(back!, Button: backButton)
        
        //画像タップ設定
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imageTapped:"))
        
        //ハイライト非表示
        control.highlight(nextButton)
        control.highlight(backButton)
        control.highlight(playButton)
    }
    
    //画面遷移したとき
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

        let expansionViewController: ExpansionViewController = segue.destinationViewController as! ExpansionViewController
        
        expansionViewController.indexNum = indexNum
    }

    //スライド画像表示
    func imageDisplay(){
        var photoImage: UIImage?
        photoImage = UIImage(named: photos[indexNum])
        imageView.image = photoImage
        self.view.addSubview(imageView)
    }

    //進むボタンが押されたとき
    @IBAction func nextButton(sender: AnyObject) {

        if indexNum < photos.count-1 {
            indexNum++
        } else if indexNum == photos.count-1 {
            indexNum = 0
        }
        
        //スライド画像表示
        imageDisplay()
    }

    //戻るボタンが押されたとき
    @IBAction func backButton(sender: AnyObject) {
        
        if indexNum != 0 {
            indexNum--
        } else if indexNum == 0 {
            indexNum = photos.count-1
        }
        
        //スライド画像表示
        imageDisplay()
    }
    
    //再生ボタンが押されたとき
    @IBAction func playButton(sender: AnyObject) {

        if moveFlag == true{
            
            //タイマースタート
            startTimer()
            moveFlag = false
            
        } else if moveFlag == false {
            
            //タイマーストップ
            stopTimer()
            moveFlag = true
        }

    }

    //画像をタップしたとき
    func imageTapped(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("ExpansionViewController",sender: nil)
        
        if moveFlag == false {
            
            //タイマーストップ
            stopTimer()
            moveFlag = true
        }
    }
    
    //タイマースタート
    func startTimer() {
        timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "photoMove:", userInfo: nil, repeats: true)
        
        //ボタンタップ不可
        buttonTap(0.3,enabled: false)
        
        //停止表示
        control.ButtonDisplay(stop!, Button: playButton)
    }
    
    //タイマーストップ
    func stopTimer() {
        timer?.invalidate()
        
        //ボタンタップ可
        buttonTap(1.0,enabled: true)
        
        //再生表示
        control.ButtonDisplay(start!, Button: playButton)
    }
    
    //タイマー機能
    @objc func photoMove(timer: NSTimer) {
        
        if indexNum < photos.count-1 {
            indexNum++
        } else if indexNum == photos.count-1 {
            indexNum = 0
        }
        
        //スライド画像表示
        imageDisplay()
    }
    
    //ボタンタップ可・不可
    func buttonTap(alpha: CGFloat,enabled: Bool){
        nextButton.alpha = alpha
        nextButton.enabled = enabled
        backButton.alpha = alpha
        backButton.enabled = enabled
    }
    
    //他の画面から戻るボタンを押したとき
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


















