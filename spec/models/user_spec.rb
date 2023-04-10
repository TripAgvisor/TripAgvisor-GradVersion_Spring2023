# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { should belong_to(:program).optional }
    #it { should have_many(:tips) }
    it { should have_many(:experiences) }
    it { should have_many(:experience_comments) }
    #it { should have_many(:tips).through(:helpful_votes) }
  end

  describe "attributes" do
    it { should respond_to(:img) }
    it { should respond_to(:user_program_id) }
  end

 
end

#COMMENT !!!!!!!! 