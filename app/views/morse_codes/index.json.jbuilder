json.array!(@morse_codes) do |morse_code|
  json.extract! morse_code, :id, :code, :translation
  json.url morse_code_url(morse_code, format: :json)
end
