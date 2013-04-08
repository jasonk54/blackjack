class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop()).last()

  stand: ->
    @trigger 'stand'

  scores: ->
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0

    temp = score + 10
    if hasAce
      if temp > 21
        [score]
      else
        [score + 10]
    else
      [score]

  playThrough: ->
    @at(0).flip()
    @keepHitting()

  keepHitting: ->
    while @scores() < 17
      @hit()
