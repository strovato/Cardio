class DecksController < ApplicationController
  #CREATE, READ, UPDATE, DELETE
  #INDEX, SHOW, NEW, CREATE, EDIT, UPDATE, DESTROY
  def index
    @decks = Deck.all
  end
  
  def new
    @deck = Deck.new
  end
  
  def create
    @deck = Deck.new(params[:deck])
    @deck.save
    redirect_to @deck  #deck_path(@deck)  #"/decks"
  end
  
  def show
    @deck = Deck.find(params[:id])
    @cards = @deck.cards
  end
  
  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy
    redirect_to decks_path
  end
  
  def edit
  @deck = Deck.find(params[:id])  
  end
  
  def update
    @deck = Deck.find(params[:id])
    @deck.update_attributes(params[:deck])
    redirect_to @deck
  end
end