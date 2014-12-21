class TopController < ApplicationController
  def index
    @chars = JapaneseSyllabary.all
  end
end
