parse-model-scaffold
====================

This project is a work in progress!

Currently supported languages are Coffeescript (```:coffee```) and Objective-c (```:objc```).  ParseModelGenerator will generate all languages by default.

usage
=====

```ruby
require './lib/parse_model_generator'

generator = ParseModelGenerator.new 'parse_app_id', 'parse_api_key'

generator.generate 'ParseClassName'
generator.generate ['ParseClassName1', 'ParseClassName2']
generator.generate ['ParseClassName1', 'ParseClassName2'], [:objc]
```
