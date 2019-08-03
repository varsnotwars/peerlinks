// DO NOT EDIT.
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: VowLink/messages.proto
//
// For information on using the generated types, please see the documenation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Proto_Hello {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var version: Int32 = 0

  /// maximum number of messages per hour
  var rateLimit: Int32 = 0

  /// encryption nonce
  var nonce: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Proto_Link {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var tbs: Proto_Link.TBS {
    get {return _storage._tbs ?? Proto_Link.TBS()}
    set {_uniqueStorage()._tbs = newValue}
  }
  /// Returns true if `tbs` has been explicitly set.
  var hasTbs: Bool {return _storage._tbs != nil}
  /// Clears the value of `tbs`. Subsequent reads from it will return its default value.
  mutating func clearTbs() {_uniqueStorage()._tbs = nil}

  var signature: Data {
    get {return _storage._signature}
    set {_uniqueStorage()._signature = newValue}
  }

  /// The field below MUST not be sent when the link is presented as a part of
  /// the chain in the message. However, it SHOULD be used when storing the
  /// link.
  var stored: Proto_Link.Stored {
    get {return _storage._stored ?? Proto_Link.Stored()}
    set {_uniqueStorage()._stored = newValue}
  }
  /// Returns true if `stored` has been explicitly set.
  var hasStored: Bool {return _storage._stored != nil}
  /// Clears the value of `stored`. Subsequent reads from it will return its default value.
  mutating func clearStored() {_uniqueStorage()._stored = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  struct Stored {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// Public key of link's issuer. Needed for construction of the chain.
    var issuerPubKey: Data = SwiftProtobuf.Internal.emptyData

    /// Public key of the channel
    var channelPubKey: Data = SwiftProtobuf.Internal.emptyData

    /// Hash of the root message on the channel
    var channelRoot: Data = SwiftProtobuf.Internal.emptyData

    /// Human-readable name of the link
    var label: String = String()

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  struct TBS {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var trusteePubKey: Data = SwiftProtobuf.Internal.emptyData

    var expiration: Double = 0

    /// NOTE: This MUST be filled either by sender/recipient before
    /// generating/verifying the signature below.
    var channelID: Data = SwiftProtobuf.Internal.emptyData

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Proto_EncryptedLink {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var box: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Proto_LinkRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var peerID: String = String()

  var trusteePubKey: Data = SwiftProtobuf.Internal.emptyData

  var boxPubKey: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Proto_ChannelMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var channelID: Data = SwiftProtobuf.Internal.emptyData

  /// NOTE: can be empty only in the root message
  var parents: [Data] = []

  /// 32 random bytes
  var nonce: Data = SwiftProtobuf.Internal.emptyData

  /// height = max(p.height for p in parents)
  var height: UInt64 = 0

  /// NOTE: encryption key = HASH(channel_id ++ parents ++ nonce,
  ///   'vow-link-symmetric')
  var encryptedContent: Data = SwiftProtobuf.Internal.emptyData

  var unknownFields = SwiftProtobuf.UnknownStorage()

  struct Content {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var tbs: Proto_ChannelMessage.Content.TBS {
      get {return _storage._tbs ?? Proto_ChannelMessage.Content.TBS()}
      set {_uniqueStorage()._tbs = newValue}
    }
    /// Returns true if `tbs` has been explicitly set.
    var hasTbs: Bool {return _storage._tbs != nil}
    /// Clears the value of `tbs`. Subsequent reads from it will return its default value.
    mutating func clearTbs() {_uniqueStorage()._tbs = nil}

    var signature: Data {
      get {return _storage._signature}
      set {_uniqueStorage()._signature = newValue}
    }

    var unknownFields = SwiftProtobuf.UnknownStorage()

    struct TBS {
      // SwiftProtobuf.Message conformance is added in an extension below. See the
      // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
      // methods supported on all messages.

      /// Link chain that leads from the channel's public key to the signer of
      /// this message
      var chain: [Proto_Link] = []

      /// Floating point unix time
      var timestamp: Double = 0

      /// JSON content of the message
      var json: String = String()

      var unknownFields = SwiftProtobuf.UnknownStorage()

      init() {}
    }

    init() {}

    fileprivate var _storage = _StorageClass.defaultInstance
  }

  init() {}
}

struct Proto_Sync {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var channelID: Data = SwiftProtobuf.Internal.emptyData

  var minHeight: UInt64 = 0

  /// Optional, used when walking through past messages
  var maxHeight: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Proto_SyncResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var channelID: Data = SwiftProtobuf.Internal.emptyData

  var messages: [Proto_ChannelMessage] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Proto_Packet {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var content: OneOf_Content? {
    get {return _storage._content}
    set {_uniqueStorage()._content = newValue}
  }

  var link: Proto_EncryptedLink {
    get {
      if case .link(let v)? = _storage._content {return v}
      return Proto_EncryptedLink()
    }
    set {_uniqueStorage()._content = .link(newValue)}
  }

  var message: Proto_ChannelMessage {
    get {
      if case .message(let v)? = _storage._content {return v}
      return Proto_ChannelMessage()
    }
    set {_uniqueStorage()._content = .message(newValue)}
  }

  var sync: Proto_Sync {
    get {
      if case .sync(let v)? = _storage._content {return v}
      return Proto_Sync()
    }
    set {_uniqueStorage()._content = .sync(newValue)}
  }

  var syncResponse: Proto_SyncResponse {
    get {
      if case .syncResponse(let v)? = _storage._content {return v}
      return Proto_SyncResponse()
    }
    set {_uniqueStorage()._content = .syncResponse(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_Content: Equatable {
    case link(Proto_EncryptedLink)
    case message(Proto_ChannelMessage)
    case sync(Proto_Sync)
    case syncResponse(Proto_SyncResponse)

  #if !swift(>=4.1)
    static func ==(lhs: Proto_Packet.OneOf_Content, rhs: Proto_Packet.OneOf_Content) -> Bool {
      switch (lhs, rhs) {
      case (.link(let l), .link(let r)): return l == r
      case (.message(let l), .message(let r)): return l == r
      case (.sync(let l), .sync(let r)): return l == r
      case (.syncResponse(let l), .syncResponse(let r)): return l == r
      default: return false
      }
    }
  #endif
  }

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

struct Proto_Identity {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var publicKey: Data = SwiftProtobuf.Internal.emptyData

  var secretKey: Data = SwiftProtobuf.Internal.emptyData

  var links: [Proto_Link] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Proto_Subscription {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var publicKey: Data = SwiftProtobuf.Internal.emptyData

  var label: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Proto_SubscriptionList {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var subscriptions: [Proto_Subscription] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "proto"

extension Proto_Hello: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Hello"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "version"),
    2: .standard(proto: "rate_limit"),
    3: .same(proto: "nonce"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularInt32Field(value: &self.version)
      case 2: try decoder.decodeSingularInt32Field(value: &self.rateLimit)
      case 3: try decoder.decodeSingularBytesField(value: &self.nonce)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.version != 0 {
      try visitor.visitSingularInt32Field(value: self.version, fieldNumber: 1)
    }
    if self.rateLimit != 0 {
      try visitor.visitSingularInt32Field(value: self.rateLimit, fieldNumber: 2)
    }
    if !self.nonce.isEmpty {
      try visitor.visitSingularBytesField(value: self.nonce, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Hello, rhs: Proto_Hello) -> Bool {
    if lhs.version != rhs.version {return false}
    if lhs.rateLimit != rhs.rateLimit {return false}
    if lhs.nonce != rhs.nonce {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Link: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Link"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tbs"),
    2: .same(proto: "signature"),
    3: .same(proto: "stored"),
  ]

  fileprivate class _StorageClass {
    var _tbs: Proto_Link.TBS? = nil
    var _signature: Data = SwiftProtobuf.Internal.emptyData
    var _stored: Proto_Link.Stored? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _tbs = source._tbs
      _signature = source._signature
      _stored = source._stored
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._tbs)
        case 2: try decoder.decodeSingularBytesField(value: &_storage._signature)
        case 3: try decoder.decodeSingularMessageField(value: &_storage._stored)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._tbs {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._signature.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._signature, fieldNumber: 2)
      }
      if let v = _storage._stored {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Link, rhs: Proto_Link) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._tbs != rhs_storage._tbs {return false}
        if _storage._signature != rhs_storage._signature {return false}
        if _storage._stored != rhs_storage._stored {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Link.Stored: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Proto_Link.protoMessageName + ".Stored"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "issuer_pub_key"),
    2: .standard(proto: "channel_pub_key"),
    3: .standard(proto: "channel_root"),
    4: .same(proto: "label"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.issuerPubKey)
      case 2: try decoder.decodeSingularBytesField(value: &self.channelPubKey)
      case 3: try decoder.decodeSingularBytesField(value: &self.channelRoot)
      case 4: try decoder.decodeSingularStringField(value: &self.label)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.issuerPubKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.issuerPubKey, fieldNumber: 1)
    }
    if !self.channelPubKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.channelPubKey, fieldNumber: 2)
    }
    if !self.channelRoot.isEmpty {
      try visitor.visitSingularBytesField(value: self.channelRoot, fieldNumber: 3)
    }
    if !self.label.isEmpty {
      try visitor.visitSingularStringField(value: self.label, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Link.Stored, rhs: Proto_Link.Stored) -> Bool {
    if lhs.issuerPubKey != rhs.issuerPubKey {return false}
    if lhs.channelPubKey != rhs.channelPubKey {return false}
    if lhs.channelRoot != rhs.channelRoot {return false}
    if lhs.label != rhs.label {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Link.TBS: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Proto_Link.protoMessageName + ".TBS"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "trustee_pub_key"),
    2: .same(proto: "expiration"),
    3: .standard(proto: "channel_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.trusteePubKey)
      case 2: try decoder.decodeSingularDoubleField(value: &self.expiration)
      case 3: try decoder.decodeSingularBytesField(value: &self.channelID)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.trusteePubKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.trusteePubKey, fieldNumber: 1)
    }
    if self.expiration != 0 {
      try visitor.visitSingularDoubleField(value: self.expiration, fieldNumber: 2)
    }
    if !self.channelID.isEmpty {
      try visitor.visitSingularBytesField(value: self.channelID, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Link.TBS, rhs: Proto_Link.TBS) -> Bool {
    if lhs.trusteePubKey != rhs.trusteePubKey {return false}
    if lhs.expiration != rhs.expiration {return false}
    if lhs.channelID != rhs.channelID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_EncryptedLink: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EncryptedLink"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "box"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.box)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.box.isEmpty {
      try visitor.visitSingularBytesField(value: self.box, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_EncryptedLink, rhs: Proto_EncryptedLink) -> Bool {
    if lhs.box != rhs.box {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_LinkRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".LinkRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "peer_id"),
    2: .standard(proto: "trustee_pub_key"),
    3: .standard(proto: "box_pub_key"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.peerID)
      case 2: try decoder.decodeSingularBytesField(value: &self.trusteePubKey)
      case 3: try decoder.decodeSingularBytesField(value: &self.boxPubKey)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.peerID.isEmpty {
      try visitor.visitSingularStringField(value: self.peerID, fieldNumber: 1)
    }
    if !self.trusteePubKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.trusteePubKey, fieldNumber: 2)
    }
    if !self.boxPubKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.boxPubKey, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_LinkRequest, rhs: Proto_LinkRequest) -> Bool {
    if lhs.peerID != rhs.peerID {return false}
    if lhs.trusteePubKey != rhs.trusteePubKey {return false}
    if lhs.boxPubKey != rhs.boxPubKey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_ChannelMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ChannelMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "channel_id"),
    2: .same(proto: "parents"),
    3: .same(proto: "nonce"),
    4: .same(proto: "height"),
    5: .standard(proto: "encrypted_content"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.channelID)
      case 2: try decoder.decodeRepeatedBytesField(value: &self.parents)
      case 3: try decoder.decodeSingularBytesField(value: &self.nonce)
      case 4: try decoder.decodeSingularUInt64Field(value: &self.height)
      case 5: try decoder.decodeSingularBytesField(value: &self.encryptedContent)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.channelID.isEmpty {
      try visitor.visitSingularBytesField(value: self.channelID, fieldNumber: 1)
    }
    if !self.parents.isEmpty {
      try visitor.visitRepeatedBytesField(value: self.parents, fieldNumber: 2)
    }
    if !self.nonce.isEmpty {
      try visitor.visitSingularBytesField(value: self.nonce, fieldNumber: 3)
    }
    if self.height != 0 {
      try visitor.visitSingularUInt64Field(value: self.height, fieldNumber: 4)
    }
    if !self.encryptedContent.isEmpty {
      try visitor.visitSingularBytesField(value: self.encryptedContent, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_ChannelMessage, rhs: Proto_ChannelMessage) -> Bool {
    if lhs.channelID != rhs.channelID {return false}
    if lhs.parents != rhs.parents {return false}
    if lhs.nonce != rhs.nonce {return false}
    if lhs.height != rhs.height {return false}
    if lhs.encryptedContent != rhs.encryptedContent {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_ChannelMessage.Content: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Proto_ChannelMessage.protoMessageName + ".Content"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tbs"),
    2: .same(proto: "signature"),
  ]

  fileprivate class _StorageClass {
    var _tbs: Proto_ChannelMessage.Content.TBS? = nil
    var _signature: Data = SwiftProtobuf.Internal.emptyData

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _tbs = source._tbs
      _signature = source._signature
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1: try decoder.decodeSingularMessageField(value: &_storage._tbs)
        case 2: try decoder.decodeSingularBytesField(value: &_storage._signature)
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._tbs {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if !_storage._signature.isEmpty {
        try visitor.visitSingularBytesField(value: _storage._signature, fieldNumber: 2)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_ChannelMessage.Content, rhs: Proto_ChannelMessage.Content) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._tbs != rhs_storage._tbs {return false}
        if _storage._signature != rhs_storage._signature {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_ChannelMessage.Content.TBS: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Proto_ChannelMessage.Content.protoMessageName + ".TBS"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "chain"),
    2: .same(proto: "timestamp"),
    3: .same(proto: "json"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.chain)
      case 2: try decoder.decodeSingularDoubleField(value: &self.timestamp)
      case 3: try decoder.decodeSingularStringField(value: &self.json)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.chain.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.chain, fieldNumber: 1)
    }
    if self.timestamp != 0 {
      try visitor.visitSingularDoubleField(value: self.timestamp, fieldNumber: 2)
    }
    if !self.json.isEmpty {
      try visitor.visitSingularStringField(value: self.json, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_ChannelMessage.Content.TBS, rhs: Proto_ChannelMessage.Content.TBS) -> Bool {
    if lhs.chain != rhs.chain {return false}
    if lhs.timestamp != rhs.timestamp {return false}
    if lhs.json != rhs.json {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Sync: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Sync"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "channel_id"),
    2: .standard(proto: "min_height"),
    3: .standard(proto: "max_height"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.channelID)
      case 2: try decoder.decodeSingularUInt64Field(value: &self.minHeight)
      case 3: try decoder.decodeSingularUInt64Field(value: &self.maxHeight)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.channelID.isEmpty {
      try visitor.visitSingularBytesField(value: self.channelID, fieldNumber: 1)
    }
    if self.minHeight != 0 {
      try visitor.visitSingularUInt64Field(value: self.minHeight, fieldNumber: 2)
    }
    if self.maxHeight != 0 {
      try visitor.visitSingularUInt64Field(value: self.maxHeight, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Sync, rhs: Proto_Sync) -> Bool {
    if lhs.channelID != rhs.channelID {return false}
    if lhs.minHeight != rhs.minHeight {return false}
    if lhs.maxHeight != rhs.maxHeight {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_SyncResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SyncResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "channel_id"),
    2: .same(proto: "messages"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.channelID)
      case 2: try decoder.decodeRepeatedMessageField(value: &self.messages)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.channelID.isEmpty {
      try visitor.visitSingularBytesField(value: self.channelID, fieldNumber: 1)
    }
    if !self.messages.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.messages, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_SyncResponse, rhs: Proto_SyncResponse) -> Bool {
    if lhs.channelID != rhs.channelID {return false}
    if lhs.messages != rhs.messages {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Packet: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Packet"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "link"),
    2: .same(proto: "message"),
    3: .same(proto: "sync"),
    4: .standard(proto: "sync_response"),
  ]

  fileprivate class _StorageClass {
    var _content: Proto_Packet.OneOf_Content?

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _content = source._content
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        switch fieldNumber {
        case 1:
          var v: Proto_EncryptedLink?
          if let current = _storage._content {
            try decoder.handleConflictingOneOf()
            if case .link(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._content = .link(v)}
        case 2:
          var v: Proto_ChannelMessage?
          if let current = _storage._content {
            try decoder.handleConflictingOneOf()
            if case .message(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._content = .message(v)}
        case 3:
          var v: Proto_Sync?
          if let current = _storage._content {
            try decoder.handleConflictingOneOf()
            if case .sync(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._content = .sync(v)}
        case 4:
          var v: Proto_SyncResponse?
          if let current = _storage._content {
            try decoder.handleConflictingOneOf()
            if case .syncResponse(let m) = current {v = m}
          }
          try decoder.decodeSingularMessageField(value: &v)
          if let v = v {_storage._content = .syncResponse(v)}
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      switch _storage._content {
      case .link(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      case .message(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      case .sync(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      case .syncResponse(let v)?:
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      case nil: break
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Packet, rhs: Proto_Packet) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._content != rhs_storage._content {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Identity: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Identity"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "public_key"),
    2: .standard(proto: "secret_key"),
    3: .same(proto: "links"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.publicKey)
      case 2: try decoder.decodeSingularBytesField(value: &self.secretKey)
      case 3: try decoder.decodeRepeatedMessageField(value: &self.links)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.publicKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.publicKey, fieldNumber: 1)
    }
    if !self.secretKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.secretKey, fieldNumber: 2)
    }
    if !self.links.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.links, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Identity, rhs: Proto_Identity) -> Bool {
    if lhs.publicKey != rhs.publicKey {return false}
    if lhs.secretKey != rhs.secretKey {return false}
    if lhs.links != rhs.links {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Subscription: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Subscription"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "public_key"),
    2: .same(proto: "label"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularBytesField(value: &self.publicKey)
      case 2: try decoder.decodeSingularStringField(value: &self.label)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.publicKey.isEmpty {
      try visitor.visitSingularBytesField(value: self.publicKey, fieldNumber: 1)
    }
    if !self.label.isEmpty {
      try visitor.visitSingularStringField(value: self.label, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Subscription, rhs: Proto_Subscription) -> Bool {
    if lhs.publicKey != rhs.publicKey {return false}
    if lhs.label != rhs.label {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_SubscriptionList: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SubscriptionList"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "subscriptions"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeRepeatedMessageField(value: &self.subscriptions)
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.subscriptions.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.subscriptions, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_SubscriptionList, rhs: Proto_SubscriptionList) -> Bool {
    if lhs.subscriptions != rhs.subscriptions {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
