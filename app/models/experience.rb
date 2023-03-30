# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :program
  belongs_to :user
  has_many :experience_comments
  has_one :yelp_location
  has_many :images
  accepts_nested_attributes_for :images
  
  #########################################################
  has_one_attached :image
  
  mount_uploader :image, ImageUploader
  mount_uploaders :images, ImagesUploader
  serialize :images, JSON # If you use SQLite, add this line. ##!!!!!!!!!!!!!!!!!!
  
  
  #########################################################

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
