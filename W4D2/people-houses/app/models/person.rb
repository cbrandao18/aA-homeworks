# Schema Information
#
# Table name: people
# id :integer
# name :string
# house_id :integer

class Person < ActiveRecord::Base
    belongs_to :house, {
        primary_key: :id,
        foreign_key: :house_id,
        class_name: 'House'
    }

end