class Deputado < ApplicationRecord
    has_many :despesas
    has_one_attached :foto_deputado
end
