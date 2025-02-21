class AddDeputadoIdToDespesas < ActiveRecord::Migration[8.0]
  def change
    add_column :despesas, :deputado_id, :integer
    
  end
end
