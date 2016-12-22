//
//  IntroCollectionViewCell.swift
//  Pods
//
//  Created by Nurdaulet Bolatov on 12/22/16.
//
//

import UIKit

public class IntroRotateCollectionViewCell: UICollectionViewCell, IntroCollectionViewCellAnimatable {

    static let identifier = "IntroRotateCollectionViewCell"

    var textLabel = UILabel()
    var imageView = UIImageView()
    var closeButton = UIButton(type: .system)
    var isCloseButtonHidden = true {
        didSet {
            closeButton.isHidden = isCloseButtonHidden
            textLabel.frame.size.height = imageView.frame.origin.y - 20
                + (isCloseButtonHidden ? 0 : -44)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
        configureTextLabel()
        configureCloseButton()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func prepareForReuse() {
        super.prepareForReuse()
        imageView.transform = CGAffineTransform(rotationAngle: 0)
    }

    fileprivate func configureCloseButton() {
        closeButton.isHidden = true
        contentView.addSubview(closeButton)
        var frame = imageView.frame
        frame.origin.x += 30
        frame.origin.y -= 44
        frame.size.width = contentView.frame.width - 60
        frame.size.height = 44
        closeButton.frame = frame
    }

    fileprivate func configureTextLabel() {
        textLabel.textAlignment = .center
        textLabel.numberOfLines = 0
        var frame = contentView.frame
        frame.origin.x += 30
        frame.origin.y += 20
        frame.size.width = contentView.frame.width - 60
        frame.size.height = imageView.frame.origin.y - 20
        textLabel.frame = frame
        contentView.addSubview(textLabel)
    }

    fileprivate func configureImageView() {
        var frame = contentView.frame
        frame.origin.x = (contentView.frame.width - frame.width) / 2
        frame.origin.y = contentView.frame.maxY
        imageView.frame = frame
        imageView.layer.anchorPoint = CGPoint(x: 0.5, y: 1.2)
        contentView.clipsToBounds = true
        contentView.addSubview(imageView)
    }

    func animateLeft(progress: CGFloat) {
        let angle = progress * -30 / 100
        imageView.transform = CGAffineTransform(rotationAngle: angle * CGFloat(M_PI) / 180)
    }

    func animateRight(progress: CGFloat) {
        let angle = 30 + progress * -30 / 100
        imageView.transform = CGAffineTransform(rotationAngle: angle * CGFloat(M_PI) / 180)
    }
    
}
