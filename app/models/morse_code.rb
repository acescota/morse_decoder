class MorseCode < ActiveRecord::Base

  def self.translate_me(user_input)

    # Split whole user string input into separate morse codes
    morse = user_input.split(' ')
    translated_string = nil

    # Loop into the separate morse codes
    morse.each do |m|
      # Letter translation of code (Query database where key code is equal to morse code)
      translation = MorseCode.where(code: m).first

      # If there is no translated string yet, equate to first translation, else append next translation
      if translated_string.blank?
        # if translation.present? <- you should only equate to the translation if there IS a translation
        translated_string = translation[:translation] if translation.present?
      else
        # if translation.present? <- you should only append the translation if there IS a translation
        translated_string += translation[:translation] if translation.present?
      end
    end

    # Output translated string
    translated_string

  end
end
