//
//  Primitives.swift
//  LanaUI
//
//  Created by Emannuel Carvalho on 09/04/20.
//  Copyright © 2020 Emannuel Carvalho. All rights reserved.
//

import UIKit

struct Margin {
    static let `default` = CGFloat(20)
    static let big = CGFloat(60)
}

struct Color {
    static let primary = UIColor(named: "PrimaryText") ?? UIColor.label
    static let primaryButton = UIColor(named: "PrimaryButton") ?? UIColor.blue
    static let secondary = UIColor(named: "PrimaryBackground") ?? UIColor.systemBackground
    static let terciary = UIColor.placeholderText
    static let white = UIColor(named: "RealWhite") ?? UIColor.systemBackground
    static let green = #colorLiteral(red: 0.2187611534, green: 0.8774287565, blue: 0.5336593363, alpha: 1)
    static let gradientButton = UIColor(named: "ButtonGradient") ?? UIColor.blue
    static let border = UIColor(named: "Border") ?? UIColor.gray
}

struct Font {
    
    static let regular = UIFont.preferredFont(forTextStyle: .body)
    static let smallRegular = UIFont.preferredFont(forTextStyle: .caption1)
    static let bold = UIFont.preferredFont(forTextStyle: .title1)
}

struct Radius {
    static let normal = CGFloat(10)
    static let big = CGFloat(20)
    static let huge = CGFloat(40)
}

struct Images {
    static let check = UIImage(named: "check")
    static let arrowDown = UIImage(named: "arrow-down")
}

class Label: UILabel {
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        font = Font.regular
    }
    
}

class BoldLabel: Label {
    
    override init() {
        super.init()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        font = Font.bold
    }
    
}
