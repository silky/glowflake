# frozen_string_literal: true

class WorkUpdate < ApplicationRecord
  belongs_to :person
  has_many :tag_work_updates
  has_many :tags, through: :tag_work_updates
end
