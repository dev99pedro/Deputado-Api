require 'rails_helper'

RSpec.describe Deputado, type: :model do
    it "deve ser valido com nome, partido e estado" do
      deputado = Deputado.new(nomedeputado: "Joao", partido: "PT", estado: "RS")
      expect(deputado).to be_valid
    end

    it "deve ser estado igual a RS" do
      deputado = Deputado.where(estado: "RS")
      deputado.each do |deputado|
        expect(deputado).to be_valid
      end
    end

    it "valor das despesas não é nulo" do
      deputado = Deputado.where(estado: "RS")
      deputado.each do |deputado|
        deputado.despesas.each do | despesa |
        expect(despesa.valorliquido).not_to be_nill
      end
      end
    end


    it "valor das despesas deve ser somado" do 
      deputado = Deputado.where(estado: "RS")

      deputado.each do |despesas|
        valordespesa= deputado.despesas.sum(:valorliquido)
        expect(valordespesa).to be >= 0
      end
    end
end
