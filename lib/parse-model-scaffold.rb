require 'parse-model-scaffold/parse_api'
require 'parse-model-scaffold/parse_inspector'
require 'parse-model-scaffold/parse_class_builder'

module Parse
    module Model
        module Scaffold
            class PFScaffolder

                def initialize(appId, apiKey)
                    @api = ParseApi.new appId, apiKey
                end

                def generate (class_names, types = nil)

                    class_names = [class_names] unless class_names.is_a?(Array)

                    class_names.each do |class_name|

                        sample_obj = @api.get_first class_name

                        next if !sample_obj # Should scream here

                        sample_attrs = ParseInspector.parse(sample_obj)

                        builder = ParseClassBuilder.new(class_name, sample_attrs)
                        builder.build types
                    end
                end
            end
        end
    end
end