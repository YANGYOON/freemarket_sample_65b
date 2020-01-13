# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :session_and_valid_for_new_phone_number, only: [:new_phone_number]
  before_action :session_and_valid_for_new_address, only: [:new_address]
  before_action :session_and_valid_for_create_address, only: [:signup_create]
  before_action :session_and_valid_for_signup_creditcard, only: [:signup_creditcard]
  prepend_before_action :check_captcha, only: [:create]
  prepend_before_action :customize_sign_up_params, only: [:create]
  # before_action :get_payjp_info, only: [:signup_creditcard, :session_and_valid_for_create_address]
  # before_action :user_params, only: [:create_address]
  # before_action :phone_number_params, only: [:create_address]
  # before_action :address_params, only: [:create_address]

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  require 'payjp'
  # GET /resource/sign_up

  def index
  end

  def new
    @user = User.new
  end

  def new_phone_number
    @phone_number = @user.build_phone_number
  end

  def new_address
    @address = @user.build_address
  end

  def signup_creditcard
    @creditcard = @user.build_creditcard
  end


  # # # POST /resource

  def signup_create
    @user.build_creditcard(@creditcard.attributes)
    @user.build_phone_number(@phone_number.attributes)
    @user.build_address(@address.attributes)
    if @user.save!
      sign_in(:user, @user)
    else
      render :signup_creditcard
    end
  end

  #Session Save and Validation
  def session_and_valid_for_new_phone_number
    if params[:sns_auth] == "true"
      pass = Devise.friendly_token
      params[:user][:password] = pass
    end
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birth_year] = user_params[:birth_year]
    session[:birth_month] = user_params[:birth_month]
    session[:birth_day] = user_params[:birth_day]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
    )
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end

  end

  def session_and_valid_for_new_address
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
    )
    session[:phone_number] = phone_number_params[:phone_number]
    @phone_number = PhoneNumber.new(
      phone_number: session[:phone_number],
    )
    unless @phone_number.valid?
      flash.now[:alert] = @phone_number.errors.full_messages
      render :new_phone_number and return
    end
  end

  def session_and_valid_for_signup_creditcard
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day],
    )
    @phone_number = PhoneNumber.new(phone_number: session[:phone_number])
    session[:zipcode] = address_params[:zipcode]
    session[:prefecture] = address_params[:prefecture]
    session[:city] = address_params[:city]
    session[:detail_address] = address_params[:detail_address]
    session[:buidling] = address_params[:building]
    session[:optional_phone_number] = address_params[:optional_phone_number]
    @address = Address.new(
      zipcode: session[:zipcode],
      prefecture: session[:prefecture],
      city: session[:city],
      detail_address: session[:detail_address],
      building: session[:building],
      optional_phone_number: session[:optional_phone_number]
    )
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address    and return
    end
  end

  def session_and_valid_for_create_address
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      last_name: session[:last_name],
      first_name: session[:first_name],
      last_name_kana: session[:last_name_kana],
      first_name_kana: session[:first_name_kana],
      birth_year: session[:birth_year],
      birth_month: session[:birth_month],
      birth_day: session[:birth_day], 
    )
    @phone_number = PhoneNumber.new(phone_number: session[:phone_number])
    @address = Address.new(
      zipcode: session[:zipcode],
      prefecture: session[:prefecture],
      city: session[:city],
      detail_address: session[:detail_address],
      building: session[:building],
      optional_phone_number: session[:optional_phone_number]
    )
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    customer = Payjp::Customer.create(
      card: params['payjp-token'],
    )
    @creditcard = Creditcard.new(customer_id: customer.id, card_id: customer.default_card) 
  end

  protected

  def phone_number_params
    params.require(:phone_number).permit(:phone_number)
  end

  def address_params
    params.require(:address).permit(:zipcode, :prefecture, :city, :detail_address, :buidling, :optional_phone_number)
  end

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :birth_year,
      :birth_month,
      :birth_day
      )
  end

  private
  def customize_sign_up_params
    devise_parameter_sanitizer.permit :sign_up, keys: [:username, :email, :password, :password_confirmation, :remember_me]
  end

  def check_captcha
    self.resource = resource_class.new sign_up_params
    resource.validate
    unless verify_recaptcha(model: resource)
      respond_with_navigational(resource) { render :new }
    end
  end


end