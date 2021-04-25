# frozen_string_literal: true

json.array! @elements do |element|
  json.extract! element, :id, :title
end
