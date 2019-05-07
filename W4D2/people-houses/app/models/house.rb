# Schema Information
#
# Table name: houses
# id :integer
# address :string

class House < ActiveRecord::Base
    has_many :residents, {
        primary_key: :id,
        foreign_key: :house_id,
        class_name: 'Person'
    }
end