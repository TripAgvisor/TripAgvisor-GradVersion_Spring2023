# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :program
  belongs_to :user
  has_many :experience_comments
  has_one :yelp_location
  has_many_attached :images

  attr_accessor :comments, :totalComments, :average_rating, :hasUserBookmarked

  def tagArray
    if tags.nil?
      tagArray = nil
    elsif tags == ','
      tagArray = nil
    else
      tagArray = tags.split(',')
      tagArray = tagArray.drop(1)
    end

    tagArray
  end
end
