namespace :simulate do
  desc 'generate sample pins >> rake simulate:pins[2]'
  task :pins, [:amount] => :environment do |_t, args|
    generate_pins(args.amount)
  end

  private

  def generate_pins(amount)
    icons = %w(happy sad trash);
    user_ids = get_user_ids;

    (amount.to_i).times do |i|
      pin = Pin.new
      pin.user_id   = user_ids.sample
      pin.latitude  = rand(11.0...12)
      pin.longitude = rand(104.0...105)
      pin.icon      = icons.sample
      pin.marker_id = "marker_m#{Pin.maximum(:id).to_i + i + 1}"
      pin.save

      print '.'
    end

    puts ''
    puts "==========#{amount} pins generated successfully=========="
  end

  def get_user_ids
    ids = User.pluck(:id)
    ids << User.create(username: 'gogreen', password: '123', password_confirmation: '123').id if ids.size.zero?
    ids
  end
end
