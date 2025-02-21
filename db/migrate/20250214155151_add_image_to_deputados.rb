class AddImageToDeputados < ActiveRecord::Migration[8.0]
  def change
    add_column :deputados, :imagem, :string
  end
end
