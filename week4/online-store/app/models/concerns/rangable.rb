module Rangable
  extend ActiveSupport::Concern
  
  def range(from_id, count)
    if count.nil?
      all.to_a.select{ |item| item.id >= from_id.to_i }
    else
      to_id = from_id.to_i + count.to_i - 1
      from_id = from_id.to_i
      all.to_a.select{ |item| (from_id..to_id).include? item.id }
    end
  end
end