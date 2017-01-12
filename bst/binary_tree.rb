module BinaryTree

  class EmptyNode
    def include?(*)
      false
    end

    def insert(*)
      false
    end

    def inspect
      "{}"
    end

    # def initialize(v)
    #   @value = v
    #   @left = EmptyNode.new
    #   @right = EmptyNode.new
    # end
  end

  class Node
    attr_accessor :left, :right, :value

    def initialize(v)
      @value = v
      @left = EmptyNode.new
      @right = EmptyNode.new
    end
    
    def insert(v)
      case value <=> v
      when 1 then insert_left(v)
      when -1 then insert_right(v)
      when 0 then false
      end
    end

    def inspect
      "{#{value}:#{left.inspect}|#{right.inspect}}"
    end

    def include?(v)
      case value <=> v
      when 1 then left.include?(v)
      when -1 then right.include?(v)
      when 0 then true
      end
    end

    private
      def insert_left(v)
        left.insert(v) or self.left = Node.new(v)
      end

      def insert_right(v)
        right.insert(v) or self.right = Node.new(v)
      end
  end

end