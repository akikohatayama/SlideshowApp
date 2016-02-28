//
//  Control.swift
//  SlideshowApp2
//
//  Created by akikohatayama on 2016/02/25.
//  Copyright © 2016年 AkikoHatayama. All rights reserved.
//

import UIKit

class Control: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //ボタン画像表示
    func ButtonDisplay(image: UIImage, Button: UIButton){
        Button.setImage(image , forState: .Normal)
    }
    //タップしたときにハイライト表示させない
    func highlight(Button: UIButton){
        Button.adjustsImageWhenHighlighted = false
    }

}
