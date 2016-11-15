class ContactsController < ApplicationController
  def index
    @contacts = Contact.order('name ASC')
  end

  def new
  end

  def create
     contact = Contact.create(
     name: params[:contact][:name],
     address: params[:contact][:address],
     phone_number: params[:contact][:phone_number],
     email: params[:contact][:email]
     )

     contact.save

     redirect_to('/contacts')

  end

  def details
    contacts = Contact.all
    id = params[:id].to_i
    @selected_contact = contacts.detect do |contact|
      contact.id == id
    end
    puts '@selected_contact'
  end
end
