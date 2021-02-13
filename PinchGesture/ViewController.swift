//
//  ViewController.swift
//  PinchGesture
//
//  Created by 이충현 on 2021/02/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtPinch: UILabel!
    
    //글자 크기 변수 선언
    var initialFontSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        // 핀치 제스처 등록하기
        // 핀치 제스처는 UIPinchGestureRecognizer 클래스 안에서 인식된다
        // 따라서 UIPinchGestureRecognizer 이 클래스를 선언하고 핀치 클래스를 등록해야한다
        
        // UIPinchGestureRecognizer클래스 상수 pinch 선언
        // 액션 인수는 핀치 제스처가 인식 되었을 때 실행할 메서드를 의미한다.
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        //뷰 객체의 addGestureRecognizer 메서드를 사용해 핀치 제스처를 등록
        self.view.addGestureRecognizer(pinch)
        
        
    }
    
    //액션메서드 구현
    // 핀치 제스처가 처음 시작하는 상태라면 현재 글자 크기를 저장, 핀치제스처가 계속 진행 중이라면 저장된 글자 크기를 확대하거나 축소 할 것이므로 if문 사용
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        // 우선 핀치 제스처의 상태를 state 속성을 사용하여 확인
        if (pinch.state == UIGestureRecognizer.State.began) {
            // 핀치 제스처의 상태가 시작이면 앞에서 선언한 initialFontSize 변수에 현재 텍스트의 글자 크기를 저장
            initialFontSize = txtPinch.font.pointSize
        } else {
            // 만일 핀치 제스처의 상태가 시작이 아니라 핀치 제스처가 계속 진행 중이면
            // initialFontSize에 저장해 둔 글자 크기 값에 scale 속성을 곱하여 텍스트의 글자 크기에 반영
            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
        }
    }


}

