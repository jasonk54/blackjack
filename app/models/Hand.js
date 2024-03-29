// Generated by CoffeeScript 1.4.0
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.Hand = (function(_super) {

  __extends(Hand, _super);

  function Hand() {
    return Hand.__super__.constructor.apply(this, arguments);
  }

  Hand.prototype.model = Card;

  Hand.prototype.initialize = function(array, deck, isDealer) {
    this.deck = deck;
    this.isDealer = isDealer;
  };

  Hand.prototype.hit = function() {
    return this.add(this.deck.pop()).last();
  };

  Hand.prototype.stand = function() {
    return this.trigger('stand');
  };

  Hand.prototype.scores = function() {
    var aceValue, hasAce, score;
    hasAce = this.reduce(function(memo, card) {
      return memo || card.get('value') === 1;
    }, false);
    score = this.reduce(function(score, card) {
      return score + (card.get('revealed') ? card.get('value') : 0);
    }, 0);
    aceValue = score + 10;
    if (hasAce && aceValue <= 21) {
      return [aceValue];
    } else {
      return [score];
    }
  };

  Hand.prototype.playThrough = function() {
    this.at(0).flip();
    return this.keepHitting();
  };

  Hand.prototype.keepHitting = function() {
    var _results;
    _results = [];
    while (this.scores() < 17) {
      _results.push(this.hit());
    }
    return _results;
  };

  return Hand;

})(Backbone.Collection);
