//: A UIKit based Playground for presenting user interface

import UIKit
import SpriteKit
import PlaygroundSupport

let navigationController = UINavigationController(rootViewController: StartViewController())
navigationController.addChild(StartViewController())
PlaygroundPage.current.liveView = navigationController
