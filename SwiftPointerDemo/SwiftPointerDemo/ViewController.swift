//
//  ViewController.swift
//  SwiftPointerDemo
//
//  Created by longjianjiang on 2017/10/30.
//  Copyright © 2017年 Jiang. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    func incrementor(pointer: UnsafeMutablePointer<Int>) {
        pointer.pointee += 1 // *num += 1
    }
    
    func incrementorArray(arr: UnsafeMutableBufferPointer<Int>) {
        let first = arr.baseAddress
        first?.pointee += 1
        let nextpointer = first?.successor() // 如果指针越界此时指向的是一个垃圾值
        nextpointer?.pointee += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 简单的取指针指向的值并改变
        var num = 5
        incrementor(pointer: &num)
        print("num = \(num)")
        incrementor(pointer: &num)
        print("num = \(num)")
        
        // 直接进行指针操作, 和通过上面的调用方法效果是相同的
        var a = 5
        a = withUnsafeMutablePointer(to: &a, { (ptr: UnsafeMutablePointer<Int>) -> Int in
            ptr.pointee += 2
            return ptr.pointee
        })
        print("a = \(a)")
        
        // 创建一个指针
        var pointer: UnsafeMutablePointer<Int>? = UnsafeMutablePointer<Int>.allocate(capacity: 1) // 申请内存
        pointer?.initialize(to: 10) // 初始化指针指向内容
        print("pointer -> \(String(describing: pointer?.pointee))")
        pointer?.deinitialize() // 销毁指针对象
        pointer?.deallocate(capacity: 1)
        pointer = nil // Swift 中如何表示空指针NULL
//        let x: Int = nil
        
        
        // 创建一个数组指针
        var arr = [1, 2, 3]
        let arrayPointer = UnsafeMutableBufferPointer(start: &arr, count: arr.count)
        incrementorArray(arr: arrayPointer)
        print(arr)
        
        // 将指针强制的转换为目标类型
        var count = 100
        let voidPtr = withUnsafePointer(to: &count) { (ptr: UnsafePointer<Int>) -> UnsafeRawPointer in
            return UnsafeRawPointer(ptr)
        }
        
        let intPtr = unsafeBitCast(voidPtr, to: UnsafePointer<Int>.self)
        print("count = \(intPtr.pointee)")
        
        
        // **
        var error = NSError()
        give(&error)
        print("========")
        print(error)
        
    }

    func give(_ error: UnsafeMutablePointer<NSError>) {
        error.pointee = NSError.init(domain: "TestDomain", code: 0, userInfo: ["name" : "testErrorInfo"])
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


