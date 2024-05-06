//
//  MainViewCell.swift
//  UniversityInformation
//
//  Created by Hakan Hardal on 6.05.2024.
//

import Foundation
import UIKit

class MainViewCell : UITableViewCell{
    // MARK: - Properties
    var viewModel : MainViewCellModel?{
        didSet{configure()
            
        }
    }
    
    
    private let universityImage : UIImageView = {
        let image = UIImage(named: "university")
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = image
        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        
        
        return imageView
        
    }()
    
    private let universityNameLabel : UILabel = {
       let label = UILabel()
        
        label.text = "Fırat University"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var stackView : UIStackView!
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("-----")
    }
}


// MARK: - Helpers

extension MainViewCell{
    private func setup(){
        stackView = UIStackView(arrangedSubviews: [universityImage,universityNameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func layout(){
        addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        
        
        ])
    }
    private func configure(){
        guard let viewModel = self.viewModel else {return}
        universityNameLabel.text = viewModel.name
        
    }
}
