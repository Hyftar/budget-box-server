# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  layout 'not_authenticated', only: [:new]
end
