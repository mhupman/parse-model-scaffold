parse-model-scaffold
====================

*This project is a work in progress!*

This project aims to provide a simple way to create concrete subclasses of your Parse.com 'classes' in a variety of languages.  This could be used as part of a CI process to keep Parse.com and your codebase in sync or simply as a way to boostrap Parse.com integration in a new environment.  Where possible, the code this project generates will extend the PFObject representation in the Parse.com SDK for the given language.

The following languages are currently supported.  If you don't see your preferred language, pull requests are welcome!  PFScaffolder will generate all languages by default.

* Coffee-script ```:coffee``` - https://parse.com/docs/js/symbols/Parse.Object.html
* Objective-C ```:objc``` - https://parse.com/docs/ios/api/Classes/PFObject.html

Usage
=====

```bash
gem install parse-model-scaffold
```

Library
-------

```ruby
require 'parse_model_generator'

scaffolder = Parse::Model::Scaffold::PFScaffolder.new 'parse_app_id', 'parse_api_key'

scaffolder.generate 'ParseClassName'
scaffolder.generate ['ParseClassName1', 'ParseClassName2']
scaffolder.generate ['ParseClassName1', 'ParseClassName2'], [:objc]
```

Executable
----------

Parse-model-scaffold ships with a thin executable wrapper around the library to facilitate scripted usage.

```bash
# Generate scaffolding in all languages for the following classes
parse-model-scaffold --appid 'parse_app_id' --apikey 'parse_api_key' --classes 'ParseClassName1','ParseClassName2'

# Limit to just Objective-c
parse-model-scaffold --appid 'parse_app_id' --apikey 'parse_api_key' --classes 'ParseClassName1','ParseClassName2' --types 'objc'
```
