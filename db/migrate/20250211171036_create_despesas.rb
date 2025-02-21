class CreateDespesas < ActiveRecord::Migration[8.0]
  def change
    create_table :despesas do |t|
      t.date :dataemissao
      t.string :fornecedor
      t.integer :valorliquido
      t.string :linknota
      t.timestamps
    end
  end
end
