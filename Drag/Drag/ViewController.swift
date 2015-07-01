//
//  ViewController.swift
//  Drag
//
//  Created by Roc on 15/7/1.
//  Copyright © 2015年 Roc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIAlertViewDelegate {

    @IBOutlet weak var tSlider: UISlider! //目标
    @IBOutlet weak var mSlider: UISlider! //可以拖动
    @IBOutlet weak var scoreLabel: UILabel! //分数
    @IBOutlet weak var roundLabel: UILabel! //回合
    @IBOutlet weak var clickBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    
    var targetValue = 0
    var currentValue = 0
    var score = 0;
    var round = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _creatViews()
        updateData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //更新界面方法
    func updateData() {
        
        //随机目标值
        targetValue = Int(1 + arc4random()%100)
        tSlider.value = Float(targetValue)
        //重置滑块
        mSlider.value = 1
        scoreLabel.text = "分数:".stringByAppendingString(String(score))
        round++
        roundLabel.text = "回合:".stringByAppendingString(String(round))
        
    }
    
    //设置滑块图片
    func _creatViews() {
        
        let leftImg = UIImage(named: "SliderTrackLeft")?.stretchableImageWithLeftCapWidth(14, topCapHeight: 0)
        let rightImg = UIImage(named: "SliderTrackRight")?.stretchableImageWithLeftCapWidth(14, topCapHeight: 0)
        tSlider.setThumbImage(UIImage(named: "SliderThumb-Normal"), forState: UIControlState.Normal)
        tSlider.setThumbImage(UIImage(named: "SliderThumb-Highlighted"), forState: UIControlState.Highlighted)
        tSlider.setMinimumTrackImage(leftImg, forState: UIControlState.Normal)
        tSlider.setMaximumTrackImage(rightImg, forState: UIControlState.Normal)
        mSlider.setThumbImage(UIImage(named: "SliderThumb-Normal"), forState: UIControlState.Normal)
        mSlider.setThumbImage(UIImage(named: "SliderThumb-Highlighted"), forState: UIControlState.Highlighted)
        mSlider.setMinimumTrackImage(leftImg, forState: UIControlState.Normal)
        mSlider.setMaximumTrackImage(rightImg, forState: UIControlState.Normal)
        
        clickBtn.setBackgroundImage(UIImage(named: "Button-Highlighted"), forState: UIControlState.Highlighted)
        restartBtn.setBackgroundImage(UIImage(named: "Button-Highlighted"), forState: UIControlState.Highlighted)
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if buttonIndex == 1 {
            
            updateData()
        }
    }

    @IBAction func sliderChanged(sender: UISlider) {
        
    }

    @IBAction func clickAction(sender: UIButton) {
        
        currentValue = Int(mSlider.value)
        score = 100 - abs(currentValue - targetValue)
        var message = ""
        switch(score) {
    
        case 100:
            message = "太厉害了，您的得分是满分100分"
        case 90..<100:
            message = "非常好，您的得分是:\(score)"
        case 80..<90:
            message = "您的得分是:\(score)"
        default:
            message = "您的眼力还有待提高，只有\(score)分"
        }
        let alert = UIAlertView(title: nil, message: message, delegate: self, cancelButtonTitle: "确定")
        alert.addButtonWithTitle("继续")
        alert.show()
    }
    
    @IBAction func ruleAction(sender: UIButton) {
        
        let RVC = RuleViewController(nibName: "RuleViewController", bundle: nil);
        self.presentViewController(RVC, animated: true, completion: nil)
    }
    
    @IBAction func restartAction(sender: UIButton) {
        
        currentValue = 0
        round = 0
        score = 0
        updateData()
    }
}


