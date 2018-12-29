# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'not_authenticated'
end
