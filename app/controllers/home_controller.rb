require 'correios-frete'

class HomeController < ApplicationController
  
  def index  
  end

  def result
    # get params from index page
    @from = params[:from]
    @to = params[:to]
    @peso = params[:peso].gsub(',', '.')
    @comprimento = params[:comprimento]
    @largura = params[:largura]
    @altura = params[:altura]

    frete = Correios::Frete::Calculador.new :cep_origem => @from,
                                            :cep_destino => @to,
                                            :peso => @peso.to_f,
                                            :comprimento => @comprimento,
                                            :largura => @largura,
                                            :altura => @altura
    @sedex = frete.calcular :sedex
    @pac = frete.calcular :pac

  end

end