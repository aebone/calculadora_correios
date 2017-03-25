require 'correios-frete'

class HomeController < ApplicationController
  def index
  
    frete = Correios::Frete::Calculador.new :cep_origem => "04094-050",
                                            :cep_destino => "90619-900",
                                            :peso => 0.3,
                                            :comprimento => 30,
                                            :largura => 15,
                                            :altura => 2
    @sedex = frete.calcular :sedex
    @sedex.nome         
    @sedex.descricao     
    @sedex.valor         
    @sedex.prazo_entrega 

    @pac = frete.calcular :pac
    @pac.nome          
    @pac.descricao     
    @pac.valor         
    @pac.prazo_entrega      

    # get params from index page
    @from = params[:from]
    @to = params[:to]
  end

  def result
  end
end