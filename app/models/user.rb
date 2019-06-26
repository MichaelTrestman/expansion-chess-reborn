require 'bcrypt'
class User
  include BCrypt
  attr_reader :email, :password_hash, :id, :name

  def check_password supposed_password
    BCrypt::Engine.hash_secret(supposed_password, @password_salt) == @password_hash
  end

  def from_email email

    u = users_db.find({email: email}).first
    return nil if u.nil?
    @email = email

    @id = u['_id'].to_s
    @name = u['name']
    @password_hash = u['password_hash']
    @password_salt = u['password_salt']
    self
  end

  def create(args = {})
    @email = args.fetch(:email)
    @name = args.fetch(:name)
    pw = Password.create( args.fetch(:password) )
    @password_hash = pw
    @password_salt = pw.salt


    raise EmailTakenError if !!from_email(@email)

    @id = users_db.insert_one(to_hash).inserted_ids.first.to_s
    self
  end

  private

  def to_hash
    return {
      email: @email,
      password_hash: @password_hash,
      password_salt: @password_salt
    }
  end
  def users_db
    @users_db ||= Mongo::Client.new([ 'xchess-mongo-db:27017' ], :database => 'dev').database[:users]
  end

  class EmailTakenError < StandardError; end

end