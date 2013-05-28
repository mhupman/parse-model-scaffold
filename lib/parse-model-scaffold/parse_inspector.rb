require 'parse-model-scaffold/types'

module Parse
    module Model
        module Scaffold
            
            PROTECTED_FIELDS = ['objectId', 'createdAt', 'updatedAt', 'ACL']

            class ParseInspector

                def self.parse(obj)

                    PROTECTED_FIELDS.each {|x| obj.delete x}

                    attrs = []

                    obj.each do |k, v|
                        value_type = determine_type(v)
                        attr = ParseAttribute.new(k, value_type)
                        attrs << attr
                    end

                    attrs
                end

                # Map Parse types to Ruby types if possible, otherwise, leave them as a 
                def self.determine_type(val)

                    # Parse represents complex types as a JSON object, so we need to inspect it
                    if val.is_a? Hash

                        # If we don't see the Parse '__type' key that they use for encoding
                        # complex types, then this is just a simple object
                        return :Hash if !val.has_key? '__type'

                        # Otherwise, this is probably a Parse type (Relation, Pointer, GeoPoint, etc.)
                        return val['__type'].to_sym
                    end

                    return :Boolean if [TrueClass, FalseClass].include? val.class

                    # Base case
                    val.class.to_s.to_sym
                end
            end
        end
    end
end