class Crypto
  def initialize(text)
    @normalized_plaintext = text.gsub(/[^a-zA-Z0-9]/, '').downcase
  end

  def normalize_plaintext
    @normalized_plaintext
  end

  def size
    plain_text_size = @normalized_plaintext.size
    Math.sqrt(plain_text_size).ceil
  end

  def plaintext_segments
    #@normalized_plaintext.chars.each_slice(size).to_a.map(&:join)
    @normalized_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
   encode_plaintext
  end

  def normalize_ciphertext
    encode_plaintext(' ')
  end

  def encode_plaintext(delimite='')
    padded_segments = plaintext_segments.map do |string|
      right_pad(string, size)
    end
    padded_segments.map(&:chars)
                   .transpose
                   .map(&:join)
                   .map(&:strip)
                   .join(delimite)
  end

  def right_pad(string, size_limit)
    return string if string.size == size_limit
    string += ' ' * (size_limit - string.size)
  end
end
