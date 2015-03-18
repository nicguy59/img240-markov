require 'marky_markov'

class Story
  AUTHORS = {
    poe: 'Edgar Allan Poe',
    seuss: 'Dr Seuss',
    de_andrade: 'Carlos Drummond de Andrade',
    sendak: 'Maurice Sendak',
    mandelstam: 'Osip Mandelstam'
  }

  attr_reader :author_key

  def initialize(author_key)
    @author_key = author_key.to_sym
    Rails.logger.ap author_key
    #fail author_key
    fail ArgumentError, 'Unknown author' unless AUTHORS.key?(@author_key)
  end

  def author_name
    AUTHORS[author_key]
  end

  def to_s
    generate_story
  end

  def random_other_author
    AUTHORS.keys.reject { |key| key == author_key }.sample
  end

  private

  def training_text
    File.read(Rails.root.join("lib/data/#{author_key}.txt"))
  end

  def dictionary
    unless @dictionary
      @dictionary = MarkyMarkov::TemporaryDictionary.new
      @dictionary.parse_string(training_text)
      @dictionary
    end
    @dictionary
  end

  def generate_story
    [
      dictionary.generate_n_sentences(3),
      dictionary.generate_n_sentences(3),
      dictionary.generate_n_sentences(3)
    ].join("\n\n")
  end
end
