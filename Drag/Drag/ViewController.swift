//
//  ViewController.swift
//  Drag
//
//  Created by Roc on 15/7/1.
//  Copyright © 2015年 Roc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tSlider: UISlider! //目标
    @IBOutlet weak var mSlider: UISlider! //可以拖动
    @IBOutlet weak var scoreLabel: UILabel! //分数
    @IBOutlet weak var roundLabel: UILabel! //回合
    
    var targetValue = 0
    var currentValue = 0
    var score = 0;
    var round = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderChanged(sender: UISlider) {
    }

    @IBAction func clickAction(sender: UIButton) {
    }
    
    @IBAction func roleAction(sender: UIButton) {
    }
    
    @IBAction func restartAction(sender: UIButton) {
    }
}


