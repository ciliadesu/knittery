# knittery
A swift UI app that lets you search Ravelry's database of knitting and crochet patterns

## Build Requirements
Xcode 12.3

iOS 13+

## Running the project
To run this project you need API keys for Ravelry.

[See Ravelry's API Documentation here.](https://www.ravelry.com/api)

Then add your keys to the project like so:

```
struct Keys {
  static let consumerKey = "your public key here"
  static let consumerSecret = "your private key here"
}
```

## Dependencies
Knittery uses the following cocoapods:
- OAuthSwift- https://github.com/OAuthSwift/OAuthSwift
- SwiftKeychainWrapper - https://github.com/jrendel/SwiftKeychainWrapper

## What Knittery does
Not a whole lot right now, since it's under development :)

Knittery is intended to provide a simple, streamlined way to search Ravelry's database for knitting and crochet patterns. 
It requires a Ravelry user account, and will let the user add, remove and view favorite patterns. It will offer both free text search,
as well as the possibility to filter for pattern category, yarn type, yarn yardage and so on.
