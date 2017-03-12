class Mergesort 
    attr_accessor :proc

    def initialize(proc=nil)
        @proc = proc
    end

    def sort(list)
        return list if list.count <= 1 
        left = list.each_with_index.map  { |value, index|  if index % 2 == 0 then value end  }.compact
        right = list.each_with_index.map { |value, index|  if index % 2 == 1 then value end  }.compact

        left = sort(left)
        right = sort(right)
        merge(left,right)
    end
    private
    def merge(list1,list2)
        result = []
        until list1.empty? || list2.empty? do
            if @proc.call(list1.first,list2.first) then
                value = list1.delete_at 0
                result << value
            else
                value = list2.delete_at 0
                result << value
            end
        end
        
        if !list1.empty? then
            result << list1.delete_at(0) until list1.empty?
        else
            result << list2.delete_at(0) until list2.empty?
        end
        result
    end
end
