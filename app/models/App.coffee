#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', =>
      @get('dealerHand').playThrough()
      @result()

  result: ->
    if @get('playerHand').scores() > 21 && @get('dealerHand').scores() > 21
      $('body').css('background-color', 'red')
      console.log('Both bust')
      console.log('dealer: ', @get('dealerHand').scores())
      console.log('player: ', @get('playerHand').scores())
    if @get('playerHand').scores() > 21 && @get('dealerHand').scores() < 21
      $('body').css('background-color', 'red')
      console.log('Player bust')
      console.log('dealer: ', @get('dealerHand').scores())
      console.log('player: ', @get('playerHand').scores())
    if @get('playerHand').scores() < 21 && @get('dealerHand').scores() > 21
      $('body').css('background-color', 'green')
      console.log('Dealer bust')
      console.log('dealer: ', @get('dealerHand').scores())
      console.log('player: ', @get('playerHand').scores())
    if @get('playerHand').scores() > @get('dealerHand').scores() && @get('playerHand').scores() <= 21
      $('body').css('background-color', 'green')
      console.log('Player wins!')
      console.log('dealer: ', @get('dealerHand').scores())
      console.log('player: ', @get('playerHand').scores())
    if @get('playerHand').scores() < @get('dealerHand').scores() && @get('dealerHand').scores() <= 21
      $('body').css('background-color', 'red')
      console.log('Dealer wins!')
      console.log('dealer: ', @get('dealerHand').scores())
      console.log('player: ', @get('playerHand').scores())
    if @get('playerHand').scores() == 21 || @get('dealerHand').scores() == 21
      $('body').css('background-color', 'green')
      console.log('BlackJack')
      console.log('dealer: ', @get('dealerHand').scores())
      console.log('player: ', @get('playerHand').scores())
    else
      console.log('Tie')
      console.log('dealer: ', @get('dealerHand').scores())
      console.log('player: ', @get('playerHand').scores())
