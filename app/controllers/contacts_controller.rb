class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
end
