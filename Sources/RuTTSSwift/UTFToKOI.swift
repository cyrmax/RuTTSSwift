import Foundation

class KOIConvertor {
static let koi: [UInt8] =
  {
    0xE1, 0xE2, 0xF7, 0xE7, 0xE4, 0xE5, 0xF6, 0xFA,
    0xE9, 0xEA, 0xEB, 0xEC, 0xED, 0xEE, 0xEF, 0xF0,
    0xF2, 0xF3, 0xF4, 0xF5, 0xE6, 0xE8, 0xE3, 0xFE,
    0xFB, 0xFD, 0xFF, 0xF9, 0xF8, 0xFC, 0xE0, 0xF1,
    0xC1, 0xC2, 0xD7, 0xC7, 0xC4, 0xC5, 0xD6, 0xDA,
    0xC9, 0xCA, 0xCB, 0xCC, 0xCD, 0xCE, 0xCF, 0xD0,
    0xD2, 0xD3, 0xD4, 0xD5, 0xC6, 0xC8, 0xC3, 0xDE,
    0xDB, 0xDD, 0xDF, 0xD9, 0xD8, 0xDC, 0xC0, 0xD1
  }

// Additional character codes
static let blank: UInt8 = 0x20
static let koi_uc_yo: UInt8 = 0xB3
static let koi_lc_yo: UInt8 = 0xA3
static let utf_uc_yo: UInt16 = 0x0401
static let utf_lc_yo: UInt16 = 0x0451

// Code bases for Russian letters
static let utf_codebase: Int32 = 0x0410
static let extended_codebase: Int32 = 0x80


static public func convert(str: String) -> Data {
    for (int i = 0; i < textsize; i++)
      switch (utftext[i])
        {
        case utf_uc_yo:
          textbuffer.content[i] = koi_uc_yo;
          break;
        case utf_lc_yo:
          textbuffer.content[i] = koi_lc_yo;
          break;
        default:
          if ((utftext[i] >= utf_codebase) && (utftext[i] < (utf_codebase + sizeof(koi))))
            textbuffer.content[i] = koi[utftext[i] - utf_codebase];
          else if ((utftext[i] < extended_codebase) && (utftext[i] > blank))
            textbuffer.content[i] = utftext[i];
          else textbuffer.content[i] = blank;
        }

}
}