namespace :simulate do
  desc 'generate sample pins >> rake simulate:pins[2]'
  task :pins, [:amount] => :environment do |_t, args|
    generate_pins(args.amount)
  end

  private

  def generate_pins(amount)
    icons = %w(happy sad trash);
    latitudes = [11.5522, 11.5536, 11.5549, 11.5515, 11.5527, 11.5502, 11.5496, 11.5513, 11.5539, 11.551, 11.5505, 11.5528, 11.5542, 11.5511, 11.5496, 11.549, 11.5521, 11.5506];
    longitudes = [104.934, 104.935, 104.932, 104.936, 104.938, 104.936, 104.933, 104.933, 104.937, 104.937, 104.935, 104.931, 104.932, 104.931, 104.931, 104.931, 104.93, 104.929];
    user_ids = get_user_ids;

    (amount.to_i).times do |i|
      pin = Pin.new
      pin.user_id = user_ids.sample
      pin.latitude = latitudes.sample
      pin.longitude = longitudes.sample
      pin.icon = icons.sample
      pin.marker_id = "marker_m#{Pin.maximum(:id) + i + 1}"
      pin.save
    end
  end

  def get_user_ids
    ids = User.pluck(:id)
    ids << User.create(username: 'gogreen', password: '123', password_confirmation: '123').id if ids.size.zero?
    ids
  end
end
