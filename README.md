parse-model-scaffold
====================

This project is a work in progress!

The following languages are currently supported.  If you don't see your preferred language, pull requests are welcome!  PFScaffolder will generate all languages by default.

* Coffee-script ```:coffee```
* Objective-C ```:objc```

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
