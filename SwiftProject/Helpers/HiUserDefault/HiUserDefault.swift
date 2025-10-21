//
//  HiUserDefault.swift
//  SwiftProject
//
//  Created by stone on 2025/10/21.
//

class HiUserDefault {
    // 单例模式
    static let shared = HiUserDefault()
    
    private init() {} // 私有初始化，防止外部直接创建实例
    
    private let userDefaults = UserDefaults.standard
    
    // 封装设置和获取方法
    func setValue<T>(_ value: T, forKey key: String) {
        userDefaults.setValue(value, forKey: key)
    }
    
    func value<T>(forKey key: String) -> T? {
        return userDefaults.value(forKey: key) as? T
    }
    
    // 特定类型的便捷方法
    func setString(_ string: String, forKey key: String) {
        userDefaults.set(string, forKey: key)
    }
    
    func string(forKey key: String) -> String? {
        return userDefaults.string(forKey: key)
    }
    
    func setInteger(_ integer: Int, forKey key: String) {
        userDefaults.set(integer, forKey: key)
    }
    
    func integer(forKey key: String) -> Int? {
        return userDefaults.integer(forKey: key)
    }
    
    func setBool(_ string: Bool, forKey key: String) {
        userDefaults.set(string, forKey: key)
    }
    
    func boolean(forKey key: String) -> Bool? {
        return userDefaults.bool(forKey: key)
    }
    
    // 类似地，可以添加其他类型的方法：如 setBool, bool, setDouble, double 等。
}
