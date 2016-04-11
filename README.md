# Crypto
An OpenSSL based crypto module for Swift that adopts C7.Data

## Installation

### Ubuntu

```sh
sudo apt-get install libssl-dev
```

### Mac OSX

```sh
brew install openssl
brew link openssl --force
```

### Package.swift

```swift
import PackageDescription

let package = Package(
	name: "Crypto",
	dependencies: [
      .Package(url: "https://github.com/noppoMan/Crypto.git", majorVersion: 0, minor: 1),
  ]
)
```


## Apis

### Crypto

**Public methods**

* `randomBytesSync() throws -> C7.Data`

#### Usage
```swift
let data = try! Crypto.randomBytesSync()

print(data.hexadecimalString())
```


### Crypto.Hasher

* `Crypto.Hasher(algorithm: Hasher)`
  - Algorithms
    - MD5
    - SHA512
    - SHA256
    - SHA1

**Public methods**

* `hashSync(src: String) throws -> C7.Data`

#### Usage

```swift
let data = try! Crypto.Hasher(.MD5).hashSync("Raw value")

print(data.hexadecimalString())
```
