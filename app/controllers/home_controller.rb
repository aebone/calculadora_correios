require 'correios-frete'

class HomeController < ApplicationController
  
  def index  
  end

  def result
    # get params from index page
    @from = params[:from]
    @to = params[:to]

    frete = Correios::Frete::Calculador.new :cep_origem => @from,
                                            :cep_destino => @to,
                                            :peso => 0.3,
                                            :comprimento => 30,
                                            :largura => 15,
                                            :altura => 2
    @sedex = frete.calcular :sedex
    @pac = frete.calcular :pac

  end

end