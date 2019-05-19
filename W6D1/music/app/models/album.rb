class Album < ApplicationRecord
    validates :band_id, :title, :year, presence: true
    validates :live, inclusion: {in: [true, false]}

    belongs_to :band
end