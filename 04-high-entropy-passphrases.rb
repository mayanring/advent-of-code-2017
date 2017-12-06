# http://adventofcode.com/2017/day/4

# part one

def valid_passphrase?(input_str)
  phrases = input_str.split
  unique_phrases = phrases.uniq

  phrases.length == unique_phrases.length
end

def count_valid_passphrases(input)
  passphrases = input.split("\n")

  passphrases
    .map { |passphrase| valid_passphrase?(passphrase) }
    .select { |result| result == true }
    .length
end


# part two

def without_anagrams?(sentence)
  words = sentence.split

  word_cache = words.reduce({}) do |cache, phrase|
    sorted_phrase = phrase.split(//).sort.join

    if cache[sorted_phrase]
      cache[sorted_phrase] = cache[sorted_phrase] + 1
    else
      cache[sorted_phrase] = 1
    end

    cache
  end

  !word_cache.values.any? { |value| value > 1 }
end

def count_valid_passphrases_without_angarams(input)
  passphrases = input.split("\n")

  passphrases
    .map { |passphrase| without_anagrams?(passphrase) }
    .select { |result| result == true }
    .length
end