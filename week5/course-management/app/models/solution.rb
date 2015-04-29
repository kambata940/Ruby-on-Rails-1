class Solution < ActiveRecord::Base
  belongs_to :task

  validates :body, presence: true
  validates :task_id, presence: true
end