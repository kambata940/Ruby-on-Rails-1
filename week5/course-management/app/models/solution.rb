class Solution < ActiveRecord::Base
  belongs_to :task
  belongs_to :lecture

  validates :body, presence: true
  validates :task_id, presence: true
end