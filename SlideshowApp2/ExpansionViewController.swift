//
//  ExpansionViewController.swift
//  SlideshowApp2
//
//  Created by akikohatayama on 2016/02/24.
//  Copyright © 2016年 AkikoHatayama. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageBackButton: UIButton!
    @IBOutlet weak var baseView: UIImageView!
    
    let photos: [String]  = ["photo1.jpg", "photo2.jpg", "photo3.jpg", "photo4.png"]
    
    var indexNum: Int = 0
    let pageBack: UIImage? = UIImage(named: "pageBack.jpg")
    let bigFruit: UIImage? = UIImage(named: "bigFruit.jpg")
    let control = Control()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //次へボタン画像表示
        control.ButtonDisplay(pageBack!, Button: pageBackButton)
        
        //画像表示
        var photoImage: UIImage?
        photoImage = UIImage(named: photos[indexNum])
        imageView.image = photoImage
        
        baseView.image = bigFruit
        self.view.addSubview(baseView)
        self.view.sendSubviewToBack(baseView)
        
        
        //ハイライト非表示
        control.highlight(pageBackButton)

    }
    
    //画面遷移したとき
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        //let viewController: ViewController = segue.destinationViewController as! ViewController
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
