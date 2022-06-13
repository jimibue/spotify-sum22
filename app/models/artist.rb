class Artist < ApplicationRecord
    # model validation
    validates :name, presence: true

    #setup assiocation in rails
    # dependent: :destroy is if I delete a artist, delete all of thier songs from db
    has_many :songs, dependent: :destroy
end
 