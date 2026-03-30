import '../models/quote_model.dart';

abstract interface class IQuoteRepository {
  List<Quote> getAllQuotes();
  Quote getRandomQuote();
  List<Quote> getPreviewQuotes(int count);
}

class QuoteRepository implements IQuoteRepository {

  QuoteRepository._internal();
  static final QuoteRepository _instance = QuoteRepository._internal();
  factory QuoteRepository() => _instance;

  static const List<Quote> _quotes = [
    Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs"),
    Quote(text: "In the middle of difficulty lies opportunity.", author: "Albert Einstein"),
    Quote(text: "Be yourself; everyone else is already taken.", author: "Oscar Wilde"),
    Quote(
      text: "The greatest glory in living lies not in never falling, but in rising every time we fall.",
      author: "Nelson Mandela",
    ),
    Quote(
      text: "If you look at what you have in life, you'll always have more.",
      author: "Oprah Winfrey",
    ),
    Quote(
      text: "The future belongs to those who believe in the beauty of their dreams.",
      author: "Eleanor Roosevelt",
    ),
    Quote(
      text: "It is during our darkest moments that we must focus to see the light.",
      author: "Aristotle",
    ),
    Quote(
      text: "Spread love everywhere you go. Let no one ever come to you without leaving happier.",
      author: "Mother Teresa",
    ),
    Quote(
      text: "When you reach the end of your rope, tie a knot in it and hang on.",
      author: "Franklin D. Roosevelt",
    ),
    Quote(
      text: "Always remember that you are absolutely unique. Just like everyone else.",
      author: "Margaret Mead",
    ),
    Quote(
      text: "Do not go where the path may lead, go instead where there is no path and leave a trail.",
      author: "Ralph Waldo Emerson",
    ),
    Quote(
      text: "You will face many defeats in life, but never let yourself be defeated.",
      author: "Maya Angelou",
    ),
    Quote(
      text: "In the end, it's not the years in your life that count. It's the life in your years.",
      author: "Abraham Lincoln",
    ),
    Quote(
      text: "Never let the fear of striking out keep you from playing the game.",
      author: "Babe Ruth",
    ),
    Quote(text: "Life is either a daring adventure or nothing at all.", author: "Helen Keller"),
    Quote(
      text: "Many of life's failures are people who did not realize how close they were to success when they gave up.",
      author: "Thomas A. Edison",
    ),
    Quote(
      text: "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.",
      author: "Dr. Seuss",
    ),
    Quote(
      text: "If life were predictable it would cease to be life, and be without flavor.",
      author: "Eleanor Roosevelt",
    ),
    Quote(
      text: "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success.",
      author: "James Cameron",
    ),
    Quote(
      text: "Life is not measured by the number of breaths we take, but by the moments that take our breath away.",
      author: "Maya Angelou",
    ),
    Quote(
      text: "Strive not to be a success, but rather to be of value.",
      author: "Albert Einstein",
    ),
    Quote(
      text: "Two roads diverged in a wood, and I took the one less traveled by.",
      author: "Robert Frost",
    ),
    Quote(
      text: "I attribute my success to this: I never gave or took any excuse.",
      author: "Florence Nightingale",
    ),
    Quote(text: "You miss 100% of the shots you don't take.", author: "Wayne Gretzky"),
    Quote(
      text: "I've missed more than 9000 shots in my career. I've lost almost 300 games. I've failed over and over again in my life. And that is why I succeed.",
      author: "Michael Jordan",
    ),
    Quote(
      text: "The most difficult thing is the decision to act, the rest is merely tenacity.",
      author: "Amelia Earhart",
    ),
    Quote(text: "Every strike brings me closer to the next home run.", author: "Babe Ruth"),
    Quote(
      text: "Definiteness of purpose is the starting point of all achievement.",
      author: "W. Clement Stone",
    ),
    Quote(text: "The secret of getting ahead is getting started.", author: "Mark Twain"),
    Quote(text: "It always seems impossible until it's done.", author: "Nelson Mandela"),
  ];

  int _lastIndex = -1;

  @override
  List<Quote> getAllQuotes() => List.unmodifiable(_quotes);

  @override
  Quote getRandomQuote() {
    final indices = List<int>.generate(_quotes.length, (i) => i)
      ..removeWhere((i) => i == _lastIndex);
    final pick = DateTime.now().millisecondsSinceEpoch % indices.length;
    _lastIndex = indices[pick];
    return _quotes[_lastIndex];
  }

  @override
  List<Quote> getPreviewQuotes(int count) =>
      _quotes.take(count).toList(growable: false);
}
