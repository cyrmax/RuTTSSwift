import Foundation
import CRuTTS

public typealias CRuTTSCallBackType = @convention(c) (UnsafeMutableRawPointer?, Int, UnsafeMutableRawPointer?) -> Int32

public func CRuTTSCallBack(buffer: UnsafeMutableRawPointer?, bufferSize: Int, userData: UnsafeMutableRawPointer?) -> Int32 {
  print("callback called")
  print("Size is \(bufferSize)")
  print("Buffer is: ")
  print(buffer)
  let data = Data(bytes: buffer!, count: bufferSize)
  print(data)
  print(data.debugDescription)
  return 1
}


public class RuTTSWrapper {
  private let waveBufferSize: Int = 4096
  var waveBuffer: UnsafeMutableRawPointer
  var speechCallback: CRuTTSCallBackType

  public init(callback: @escaping CRuTTSCallBackType) {
    self.waveBuffer = UnsafeMutableRawPointer.allocate(byteCount: waveBufferSize, alignment: 1)
    self.speechCallback = callback
  }

public func makeSpeech(str: String) {
ru_tts_transfer(str, waveBuffer, waveBufferSize, speechCallback, nil, 1, 1, 1, 1, 1)
}


  deinit {
    waveBuffer.deallocate()
  }
}
