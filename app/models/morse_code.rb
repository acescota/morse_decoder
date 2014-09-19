class MorseCode < ActiveRecord::Base

  def self.translate_me(user_input)

    morse = user_input.split(' ')
    translated_string = nil

    morse.each do |m|
      translation = MorseCode.where(code: m).first

      if translated_string.blank?
        translated_string = translation[:translation] if translation.present?
      else
        translated_string += translation[:translation] if translation.present?
      end
    end

    translated_string

  end
end
