class ApplicationController < Sinatra::Base
  set :views, "app/views"

  get '/index' do
    
    erb :index
  end

  # edit tenant
  get '/tenants/:id/edit' do
    @tenant = Tenant.find(params[:id])
    erb :edit
  end

  patch '/tenants/:id' do
    @tenant = Tenant.find(params[:id])
    @tenant.update({name: params[:name], apartment_id: params[:apartment_id]})

    redirect('/tenants')
  end 

  # see details of a specific apartment
  get '/apartments/:id' do
    @apartment = Apartment.find(params[:id])
    @tenants = @apartment.tenants

    erb :apartment_details
  end

  # see list of all tenants
  get '/tenants' do
    @tenants = Tenant.all

    erb :tenants
  end

  # see list of all apartments
  get '/apartments' do
    @apartments = Apartment.all

    erb :apartments
  end

  # create a new apartment
  get '/apartments/new' do
    
    erb :new_apartment
  end

  post '/apartments' do
    Apartment.create({ address: params[:address] })

    redirect('/apartments')
  end

  # create a new tenant
  get '/tenants/new' do
    
    erb :new_tenant
  end
  
  post '/tenants' do
    Tenant.create({ name: params[:name], apartment_id: params[:apartment_id] })

    redirect('/tenants')
  end

  # delete an apartment
  
  delete '/apartments/:id' do
    @apartment = Apartment.find(params[:id])
    @apartment.destroy

    redirect('/apartments')
  end

  # delete a tenant
  delete '/tenants/:id' do
    @tenant = Tenant.find(params[:id])
    @tenant.destroy

    redirect('/tenants')
  end

end
