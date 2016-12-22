//
//  IntroRaiseCollectionViewCell.swift
//  Pods
//
//  Created by Nurdaulet Bolatov on 12/22/16.
//
//

import UIKit

public class IntroRaiseCollectionViewCell: UICollectionViewCell, IntroCollectionViewCellAnimatable {

    static let identifier = "IntroRaiseCollectionViewCell"

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
        var transform = CATransform3DIdentity
        transform.m34 = CGFloat(-1) / imageView.frame.width
        transform = CATransform3DRotate(transform, 0, 1, 0, 0)
        imageView.layer.transform = transform
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
        imageView.contentMode = .scaleAspectFit
        var frame = contentView.frame
        frame.origin.x = (contentView.frame.width - frame.width) / 2
        frame.origin.y = contentView.frame.maxY - (frame.height * 0.2)
        imageView.frame = frame
        imageView.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        contentView.addSubview(imageView)
    }

    func animateLeft(progress: CGFloat) {
        let progress = abs(progress)
        let angle = progress * 90 / 100
        var transform = CATransform3DIdentity
        transform.m34 = CGFloat(-1) / imageView.frame.width
        transform = CATransform3DRotate(transform, angle * CGFloat(M_PI) / 180, 1, 0, 0)
        imageView.layer.transform = transform
    }

    func animateRight(progress: CGFloat) {
        let angle: CGFloat = 90 - progress * 90 / 100
        var transform = CATransform3DIdentity
        transform.m34 = CGFloat(-1) / imageView.frame.width
        transform = CATransform3DRotate(transform, angle * CGFloat(M_PI) / 180, 1, 0, 0)
        imageView.layer.transform = transform
    }
    
}
