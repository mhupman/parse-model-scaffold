ParseClass = Struct.new :name, :attributes do
    def to_s
        self.name
    end
end

ParseAttribute = Struct.new :name, :type do
    def to_s
        self.name
    end
end