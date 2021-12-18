//
//  ViewController.swift
//  MZCircleProgress
//
//  Created by 曾龙 on 2021/12/18.
//

import UIKit

let SCREEN_WIDHT = UIScreen.main.bounds.size.width

class ViewController: UIViewController {

    lazy var circleProgress: MZCircleProgress = {
        let view = MZCircleProgress(frame: CGRect(x: (SCREEN_WIDHT - 200) / 2, y: 100, width: 200, height: 200))
        return view
    }()
    @IBOutlet weak var otherProgress: MZCircleProgress!
    
    var countDown: Int = 600
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(circleProgress)
        
        otherProgress.backLineColor = .red
        otherProgress.backLineWidth = 10
        otherProgress.progressColor = .orange
        otherProgress.progressWidth = 10
        otherProgress.textLabel.textColor = .orange
        otherProgress.startAngle = CGFloat(-Double.pi / 4 * 5)
        otherProgress.endAngle = CGFloat(Double.pi / 4)
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timeFun), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
    }


    @objc func timeFun() {
        countDown -= 2
        circleProgress.ratio = CGFloat(600 - countDown) / 600.0
        otherProgress.ratio = CGFloat(600 - countDown) / 600.0
        circleProgress.textLabel.text = "\(Int(ceil(Double(countDown) / 10.0)))"
        otherProgress.textLabel.text = "\(Int(ceil(Double(countDown) / 10.0)))"
        if countDown == 0 {
            if timer != nil {
                timer!.invalidate()
                timer = nil
            }
        }
    }
}

