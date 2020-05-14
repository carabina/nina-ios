//
//  InitialCollectionViewCell.swift
//  Nina
//
//  Created by Emannuel Carvalho on 12/05/20.
//  Copyright © 2020 Emannuel Carvalho. All rights reserved.
//

import UIKit

class InitialCollectionViewCell: UICollectionViewCell {
        
    lazy var circleView = UIView().notTranslating()
    
    lazy var label: UILabel = {
        let label = UILabel().notTranslating()
        if let font = Font.smallRegular {
            label.font = font
        }
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView().notTranslating()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let gradientLayer = CAGradientLayer()
    let borderLayer = CAShapeLayer()
    let progressLayer = CAShapeLayer()
    
    func setup(data: String, done: Bool) {
        imageView.image = UIImage(named: data)
        label.text = data
        setupLayer(done: done)
        setupBorderLayer()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupViews() {
        backgroundColor = .white
        contentView.backgroundColor = .white
        circleView.constraintSquare(side: 80)
        imageView.fill(view: circleView, margin: 20)
        contentView.fill(with: [circleView, label], spacing: 8)
    }
    
    fileprivate func setupLayer(done: Bool) {
        gradientLayer.frame = circleView.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        gradientLayer.cornerRadius = gradientLayer.frame.width / 2
        if gradientLayer.superlayer == nil {
            circleView.layer.insertSublayer(gradientLayer, at: 0)
        }
        if done {
            gradientLayer.colors = [#colorLiteral(red: 0.2257917876, green: 0.1092537814, blue: 0.8549019694, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)].map { $0.cgColor }
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        } else {
            gradientLayer.colors = [#colorLiteral(red: 0.3568934043, green: 0.3844436305, blue: 0.425847616, alpha: 1), #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6677761884)].map { $0.cgColor }
            gradientLayer.startPoint = CGPoint(x: 1, y: 1)
            gradientLayer.endPoint = CGPoint(x: -1.3, y: -1.3)
        }
    }
    
    fileprivate func setupProgress(value: Double, color: UIColor) {
        let path = UIBezierPath(ovalIn: bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)))
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = color.cgColor
        progressLayer.lineWidth = 6
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = CGFloat(value)
        progressLayer.path = path.cgPath
        if progressLayer.superlayer == nil {
            contentView.layer.addSublayer(progressLayer)
        }
    }
    
    fileprivate func setupBorderLayer() {
        circleView.layer.cornerRadius = circleView.frame.width / 2
        circleView.layer.borderColor = Color.secondary.cgColor
        circleView.layer.borderWidth = 10
    }
    
}

