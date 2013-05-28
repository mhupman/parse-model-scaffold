parse-model-scaffold
====================

This project is a work in progress!

Currently supported languages are Coffeescript (```:coffee```) and Objective-c (```:objc```).  PFScaffolder will generate all languages by default.

Usage
=====

```bash
gem install parse-model-scaffold
```

```ruby
require 'parse_model_generator'

scaffolder = Parse::Model::Scaffold::PFScaffolder.new 'parse_app_id', 'parse_api_key'

scaffolder.generate 'ParseClassName'
scaffolder.generate ['ParseClassName1', 'ParseClassName2']
scaffolder.generate ['ParseClassName1', 'ParseClassName2'], [:objc]
```
