import Foundation
import CRuTTS


public func makeSpeech(str: String) {
  let cfstr = str as CFString


  CRuTTS.ru_tts_transfer(, <#T##wave_buffer: UnsafeMutableRawPointer!##UnsafeMutableRawPointer!#>, <#T##wave_buffer_size: Int##Int#>, <#T##wave_consumer: ru_tts_callback!##ru_tts_callback!##(UnsafeMutableRawPointer?, Int, UnsafeMutableRawPointer?) -> Int32#>, <#T##user_data: UnsafeMutableRawPointer!##UnsafeMutableRawPointer!#>, <#T##voice: Int32##Int32#>, <#T##rate: Int32##Int32#>, <#T##pitch: Int32##Int32#>, <#T##gap_factor: Int32##Int32#>, <#T##intonation: Int32##Int32#>)
}
