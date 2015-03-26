class Enums
  def initialize(*values)
    @values = values
    @choosen = nil
  end

  def self.map(name, to:)
    define_singleton_method(:"#{name}") do
      Enums.new(*to)
    end
  end

  def return_enum(name)
    @choosen = :"#{name}"
    self
  end

  def method_missing(name, *args, &block)
    if @values.include?(:"#{name}")
      return_enum(:"#{name}")
    else
      super
    end
  end

  def respond_to_missing?(name, include_private = false)
    @values.include?(:"#{name}") || super
  end
end

class Traveling
  def move_towards(direction)
    if direction.is_a?(Symbol)
      enum = Enums.direction
      enum.send(direction)
    else
      direction
    end
  end
end