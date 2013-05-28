require 'erb'

module Parse
    module Model
        module Scaffold

            class ParseClassBuilder

                @@supported_types = [:coffee, :objc]

                def initialize (class_name, attrs)
                    @class_name = class_name
                    @attrs = attrs
                end

                def build (types = nil)

                    types ||= supported_types
                    types = [types] unless types.is_a? Array

                    types.each do |type|

                        templates = Dir.glob "./lib/parse-model-scaffold/templates/#{type}/*.ejs"

                        templates.each do |tmpl_file|

                            tmpl = File.read tmpl_file

                            erbTmpl = ERB.new tmpl

                            erbTmpl.result binding

                            tmpl_file = File.basename tmpl_file

                            output = erbTmpl.result binding

                            # Remove extenstion, and name propertly
                            tmpl_file.gsub!('template', @class_name).gsub!(File.extname(tmpl_file), '')

                            File.open(tmpl_file, 'w') { |file| file.write(output) }
                        end
                    end
                end

                def objc_attr_type(attr)
                    case attr.type
                    when :String, :Array
                        "NS#{attr.type}*"
                    when :Boolean
                        "BOOL"
                    when :Pointer
                        "PFObject*"
                    when :GeoPoint
                        "PFGeoPoint*"
                    when :Relation
                        "PFRelation*"
                    else
                        "?#{attr.type}?"
                    end
                end

                private

                def supported_types
                    @@supported_types
                end
            end
        end
    end
end