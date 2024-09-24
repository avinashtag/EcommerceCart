//
//  SectionHeaderView.swift
//  EcommerceCart
//
//  Created by Bhavya on 22/09/24.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    let titleLabel = UILabel()
    let viewAllButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeader()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupHeader() {
        // Title Label setup
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        // View All Button setup
        viewAllButton.setTitle("View All", for: .normal)
        viewAllButton.setTitleColor(.systemBlue, for: .normal)
        viewAllButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(viewAllButton)
        
        // Set constraints
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewAllButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
}

