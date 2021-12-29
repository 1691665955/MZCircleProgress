//
//  MZCircleProgress.swift
//  MZCircleProgress
//
//  Created by 曾龙 on 2021/12/18.
//

import UIKit

open class MZCircleProgress: UIView {
    
    /// 底条颜色
    public var backLineColor: UIColor = .lightGray
    
    /// 底条宽度
    public var backLineWidth: CGFloat = 6.0
    
    /// 进度条颜色
    public var progressColor: UIColor = .brown
    
    /// 进度条宽度
    public var progressWidth: CGFloat = 6.0
    
    /// 进度比例（0～1）
    public var ratio: CGFloat = 0 {
        didSet {
            var newValue = ratio
            if newValue < 0 {
                newValue = 0
            } else if (newValue > 1) {
                newValue = 1
            }
            self.lineLayer?.strokeEnd  = newValue
        }
    }
    
    /// 开始弧度
    public var startAngle: CGFloat = CGFloat(-(Double.pi / 2))
    
    /// 结束弧度
    public var endAngle: CGFloat = CGFloat(Double.pi / 2 * 3)
    
    /// 中间文本框
    public lazy private(set) var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .brown
        textLabel.textAlignment = .center
        textLabel.font = .systemFont(ofSize: 50)
        return textLabel
    }()
    
    private var lineLayer: CAShapeLayer?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        self.backgroundColor = .clear
        addSubview(textLabel)
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let radius: CGFloat = ((self.frame.size.width > self.frame.size.height ? self.frame.size.height : self.frame.size.width)-(self.backLineWidth > self.progressWidth ? self.backLineWidth : self.progressWidth))*0.5;
        
        let path = UIBezierPath()
        let centerPoint = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
        path.addArc(withCenter: centerPoint, radius: radius, startAngle: self.startAngle, endAngle: self.endAngle, clockwise: true)
        
        let backLayer = CAShapeLayer()
        backLayer.frame = self.bounds
        backLayer.fillColor = UIColor.clear.cgColor
        backLayer.lineWidth = self.backLineWidth
        backLayer.strokeColor = self.backLineColor.cgColor
        backLayer.strokeStart = 0
        backLayer.strokeEnd = 1
        backLayer.lineCap = .round
        backLayer.path = path.cgPath
        self.layer.addSublayer(backLayer)
        
        let lineLayer = CAShapeLayer()
        lineLayer.frame = self.bounds
        lineLayer.fillColor = UIColor.clear.cgColor
        lineLayer.lineWidth = self.progressWidth
        lineLayer.strokeColor = self.progressColor.cgColor
        lineLayer.strokeStart = 0
        lineLayer.strokeEnd = self.ratio
        lineLayer.lineCap = .round
        lineLayer.path = path.cgPath
        self.layer.addSublayer(lineLayer)
        self.lineLayer = lineLayer
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel.frame = CGRect(x: 0, y: 0, width: self.bounds.size.width * 0.8, height: self.bounds.size.height * 0.5)
        self.textLabel.center = CGPoint(x: self.bounds.size.width * 0.5, y: self.bounds.size.height * 0.5)
    }
}
