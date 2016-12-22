//
//  IntroRaiseCollectionViewCell.swift
//  Pods
//
//  Created by Nurdaulet Bolatov on 12/22/16.
//
//

import UIKit

public class IntroRaiseCollectionViewCell: UICollectionViewCell {

    static let identifier = "IntroRaiseCollectionViewCell"

    let imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
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

    fileprivate func configureImageView() {
        imageView.image = UIImage(named: "diana")
        imageView.contentMode = .scaleAspectFit
        var frame = contentView.frame
        frame.origin.x = (contentView.frame.width - frame.width) / 2
        frame.origin.y = contentView.frame.maxY - (frame.height / 2)
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
