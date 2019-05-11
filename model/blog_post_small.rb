class BlogPostSmall
  def initialize(id, title, published, created_at)
    @id, @title, @published, @created_at = id, title, published, created_at
  end

  def self.from_hash(hash)
    BlogPostSmall.new(hash["id"], hash["title"], hash["published"], hash["created_at"])
  end

  def ==(other)
    self.instance_variables.map do |v|
      other.send(:instance_variable_get, v) == self.send(:instance_variable_get, v)
    end.all?
  end


  def to_s
    self.instance_variables.map do |v|
      v.to_s + ": " + self.send(:instance_variable_get, v).to_s
    end * ", "
  end
end
