# Intro

[![Version](https://img.shields.io/cocoapods/v/Intro.svg?style=flat)](http://cocoapods.org/pods/Intro)
[![License](https://img.shields.io/cocoapods/l/Intro.svg?style=flat)](http://cocoapods.org/pods/Intro)
[![Platform](https://img.shields.io/cocoapods/p/Intro.svg?style=flat)](http://cocoapods.org/pods/Intro)

![demo](Screenshots/Raise.gif)
![demo](Screenshots/Rotate.gif)

## Overview

Intro is a simple animated walkthrough / intro / tutorial.

## Requirements

* iOS8

## Installation with CocoaPods

Intro is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod "Intro"
```

## Usage

```Swift
import Intro

let vc = IntroViewController()
vc.items = [
    ("text", UIImage(named: "1")),
    ("text", UIImage(named: "2")),
    ("text", UIImage(named: "3"))
]
vc.animationType = .rotate
vc.titleColor = .black
vc.titleFont = .systemFont(ofSize: 20)
vc.imageContentMode = .scaleAspectFit
vc.closeTitle = "READY"
vc.closeColor = .white
vc.closeBackgroundColor = .black
vc.closeBorderWidth = 0
vc.closeBorderColor = UIColor.black.cgColor
vc.closeCornerRadius = 2
vc.didClose = {
    self.showButton.setTitle("Show again", for: .normal)
}
present(vc, animated: true, completion: nil)

```

### Available animation types

```Swift
public enum IntroAnimationType {
    case raise
    case rotate
}

```

## Example Project

An example project is included with this repo.  To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Author

Nurdaulet, b.nurdaulet.b@gmail.com

## License

Intro is available under the MIT license. See the LICENSE file for more info.
