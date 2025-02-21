require 'json'

class DeputadosController < ApplicationController

  def index
    file_path = Rails.root.join('db', 'fixtures', 'data.json') ##aqui ta acessando a pasta db/fixtures/data.json
    file = File.read(file_path) ## aqui ta pegando o Json gigante que tem la e ta lendo o arquivo
    data = JSON.parse(file) ##aqui ta tranfosrmando o arquivo que tem la em JSON
  
    
    deputados = data["dados"].select{|item| item["siglaUF"] === "RS" }.group_by{| item | item["nomeParlamentar"]}.each do | nomedeputado, items |

      items.each do |item|
       deputado_obj = Deputado.find_or_create_by(nomedeputado: nomedeputado, partido: item["siglaPartido"], idcadastro: item["numeroDeputadoID"], estado: item["siglaUF"], imagem: item["imagem_url"])     
       despesa_obj = Despesa.create!(valorliquido: item["valorLiquido"].to_f, deputado_id: deputado_obj.id, fornecedor: item["fornecedor"])   
      end

    end

    
    @deputado = Deputado.all
  end


  





  def show
    @deputado = Deputado.find(params[:id])
    @valorDas20Despesas = @deputado.despesas.limit(100).pluck(:valorliquido).sum
    @fornecedores = @deputado.despesas.pluck(:fornecedor)
  end





end
