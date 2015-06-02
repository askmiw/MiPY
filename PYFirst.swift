//
//  PYFirst.swift
//  获取拼音首字母，支持取一句话中每字拼音首字母
//  Created by 周蜜(mrzhou@miw.cn) on 2015/6/1(儿童节).
//  Copyright (c) 2015年 www.miw.cn. All rights reserved.
//

import Foundation

func PYFirst(string:String?, _ allFirst:Bool=false)->String{
    var py="#"
    if let s = string {
        if s == "" {
            return py
        }
        var str = CFStringCreateMutableCopy(nil, 0, s)
        CFStringTransform(str, nil, kCFStringTransformToLatin, Boolean(0))
        CFStringTransform(str, nil, kCFStringTransformStripCombiningMarks, Boolean(0))
        py = ""
        if allFirst {
            for x in (str as String).componentsSeparatedByString(" ") {
                py += PYFirst(x)
            }
        } else {
            py  = (str as NSString).substringToIndex(1).uppercaseString
        }
    }
    return py
}
/*
//调用示例，返回#
var s :String?
PYFirst(s)

s = "中华人民共和国@hi wor\r\nld."
//调用示例，返回ZHRMGHGW
PYFirst(s,true)

//调用示例，返回Z
PYFirst(s)
*/

