//
//  EventChannelManager.swift
//  SwiftProject
//
//  Created by stone on 2023/12/9.
//

import Flutter
import Foundation

class EventChannelManager: NSObject {
  var channel: FlutterEventChannel
  var eventSink: FlutterEventSink?
  var count = 0
  var timer: Timer?
  init(messager: FlutterBinaryMessenger) {
    channel = FlutterEventChannel(name: "hi_flutter_module_iOS_to_flutter", binaryMessenger: messager)
  }
  func config() {
    channel.setStreamHandler(self)
  }
  func startTimer() {
   timer = Timer(timeInterval: TimeInterval(2), target: self, selector: #selector(triggerEventChannel), userInfo: nil, repeats: true)
    RunLoop.current.add(timer!, forMode: .common)
  }
  @objc func triggerEventChannel() {
    count += 1
    eventSink?("当时数值为：\(count)")
  }
}
extension EventChannelManager : FlutterStreamHandler {
  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = events
    startTimer()
    return nil
  }
  func onCancel(withArguments arguments:Any?) -> FlutterError? {
    return nil
  }
}
