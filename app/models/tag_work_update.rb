# frozen_string_literal: true

class TagWorkUpdate < ApplicationRecord
  belongs_to :tag
  belongs_to :work_update
end
