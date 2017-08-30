namespace :simulate do
  desc 'generate sample pins >> rake simulate:pins[2]'
  task :pins, [:amount] => :environment do |_t, args|
    generate_pins(args.amount)
  end

  private

  def generate_pins(amount)
    icons = %w(happy sad trash);
    latitudes = [11.5622, 11.5736, 11.5849, 11.5515, 11.5927, 11.6002, 11.5396, 11.5413, 11.5239, 11.511, 11.5005, 11.4928, 11.4842, 11.4711, 11.6196, 11.629, 11.3421, 11.5506];
    longitudes = [104.934, 104.915, 104.902, 104.896, 104.8838, 104.87936, 104.86933, 104.85933, 104.84937, 104.83937, 104.82935, 104.9131, 104.9232, 104.9031, 104.9631, 104.9731, 104.983, 104.929];
    user_ids = get_user_ids;

    (amount.to_i).times do |i|
      pin = Pin.new
      pin.user_id = user_ids.sample
      pin.latitude = latitudes.sample
      pin.longitude = longitudes.sample
      pin.icon = icons.sample
      pin.marker_id = "marker_m#{Pin.maximum(:id).to_i + i + 1}"
      pin.save

      print '.'
    end

    puts "==========#{amount} pins generated successfully=========="
  end

  def get_user_ids
    ids = User.pluck(:id)
    ids << User.create(username: 'gogreen', password: '123', password_confirmation: '123').id if ids.size.zero?
    ids
  end
end
