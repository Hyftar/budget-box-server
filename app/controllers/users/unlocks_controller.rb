# frozen_string_literal: true

class Users::UnlocksController < Devise::UnlocksController
  layout 'not_authenticated', only: [:new]
end
