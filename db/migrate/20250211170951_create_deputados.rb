class CreateDeputados < ActiveRecord::Migration[8.0]
  def change
    create_table :deputados do |t|
      t.string :partido
      t.string :estado
      t.integer :idcadastro
      t.string :nomedeputado
      t.timestamps
    end
  end
end
