class ParseInspector

    Attribute = Struct.new :name, :type do
        def to_s
            self.name
        end
    end

    @@protected_fields = ['objectId', 'createdAt', 'updatedAt', 'ACL']

    def self.parse(obj)

        @@protected_fields.each {|x| obj.delete x}

        attrs = []

        obj.each do |k, v|
            value_type = determine_type(v)
            attr = Attribute.new(k, value_type)
            attrs << attr
        end

        attrs
    end

    # Map Parse types to Ruby types if possible, otherwise, leave them as a 
    def self.determine_type(val)

        return val.class.to_s.to_sym if [String, Array].include? val.class

        if val.is_a? Hash

            # If we don't see the Parse '__type' key that they use for encoding
            # complex types, then this is just a simple object
            return Hash if !val.has_key? '__type'

            # Otherwise, this is probably a Parse type (Relation, Pointer, GeoPoint, etc.)
            return val['__type'].to_sym
        end

        return :Boolean if [TrueClass, FalseClass].include? val.class

        # Last resort
        val.class.to_s.to_sym
    end
end