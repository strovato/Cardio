class CardsController < ApplicationController
  
  def show
    @deck = current_user.decks.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
  end
  
  def new
    @deck = current_user.decks.find(params[:deck_id])
    @card = Card.new
  end
  
  def create
    @deck = current_user.decks.find(params[:deck_id])
    @card = @deck.cards.new(params[:card])
    @card.save
    redirect_to @deck
  end
  
  def edit
    @deck = current_user.decks.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
  end
  
  def update
    @deck = current_user.decks.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
    @card.update_attributes(params[:card])
    redirect_to @deck
  end
  
  def destroy
    @deck = current_user.decks.find(params[:deck_id])
    @card = @deck.cards.find(params[:id])
    @card.destroy
    redirect_to @deck
  end
  
end