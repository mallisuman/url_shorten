class Link < ApplicationRecord
  has_one :analytic
  # accepts_nested_attributes_for :analytics
end
