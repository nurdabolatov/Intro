//
//  IntroCollectionViewCellAnimatable.swift
//  Pods
//
//  Created by Nurdaulet Bolatov on 12/22/16.
//
//

protocol IntroCollectionViewCellAnimatable {

    var textLabel: UILabel { get set }
    var imageView: UIImageView { get set }
    var closeButton: UIButton { get set }
    var isCloseButtonHidden: Bool { get set }

    func animateLeft(progress: CGFloat)
    func animateRight(progress: CGFloat)

}
