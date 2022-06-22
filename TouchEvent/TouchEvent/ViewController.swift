//
//  ViewController.swift
//  TouchEvent
//
//  Created by iOSTeam on 10/06/2022.
//

import UIKit

class ViewController: UIViewController {
    var box = UIView()
    let path = UIBezierPath()
    var firstLocation = CGPoint.zero
    var shapeLayer = CAShapeLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        box = UIView(frame: CGRect(x: 50, y: 50, width: 150, height: 150))
        box.backgroundColor = .red
        view.addSubview(box)
        setupView()
    }
    func setupView() {
        view.layer.addSublayer(shapeLayer)
        self.shapeLayer.lineWidth = 2
        self.shapeLayer.strokeColor = UIColor.blue.cgColor
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == view {
                let currentPoint = touch.location(in: view)
                print("Touch Point: \(currentPoint.x) and \(currentPoint.y)")
            }

            if touch.view == box {
                let currentPointInRedBox = touch.location(in: box)
                print("Touch Point In Red Box \(currentPointInRedBox.x) and \(currentPointInRedBox.y)")
            }
        }
        if let location = touches.first?.location(in: view) {
            firstLocation = location
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == box {
                let location = touch.location(in: box)
                box.center = location
            }
        }
        if let location = touches.first?.location(in: view) {
            path.removeAllPoints()
            path.move(to: firstLocation)
            path.addLine(to: location)
            shapeLayer.path = path.cgPath
        }
    }

}

