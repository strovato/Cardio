class DecksController < ApplicationController
  #CREATE, READ, UPDATE, DELETE
  #INDEX, SHOW, NEW, CREATE, EDIT, UPDATE, DESTROY
  def index
    @decks = current_user.decks.all
  end
  
  def new
    @deck = current_user.decks.new
  end
  
  def create
    @deck = current_user.decks.new(params[:deck])
    @deck.save
    redirect_to @deck  #deck_path(@deck)  #"/decks"
  end
  
  def show
    @deck = current_user.decks.find(params[:id])
    @cards = @deck.cards
  end
  
  def destroy
    @deck = current_user.decks.find(params[:id])
    @deck.destroy
    redirect_to decks_path
  end
  
  def edit
  @deck = current_user.decks.find(params[:id])  
  end
  
  def update
    @deck = current_user.decks.find(params[:id])
    @deck.update_attributes(params[:deck])
    redirect_to @deck
  end
end