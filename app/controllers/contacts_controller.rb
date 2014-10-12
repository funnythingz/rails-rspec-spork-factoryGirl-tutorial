class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all

    respond_to do |format|
      format.html
      format.csv do
        send_data Contact.to_csv(@contacts), type: 'text/csv; charset=iso-8859-1, header=present', disposition: 'attachment; filename=contacts.csv'
      end
    end
  end
end
