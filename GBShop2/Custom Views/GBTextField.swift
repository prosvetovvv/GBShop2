//
//  GBTextField.swift
//  GBShop2
//
//  Created by Vitaly Prosvetov on 07.05.2021.
//

import UIKit

class GBTextField: UITextField {

    // MARK: - Init
    
    init(placeholder: String?) {
        super.init(frame: .zero)
        self.placeholder = placeholder
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func setup() {
        layer.cornerRadius = 10.0
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.systemGray.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
