require 'socket'
require 'active_support/time'


class Emulator

  def initialize
    @date = DateTime.now.to_time.to_i
    imei = '00000000000000'
    @device_imeis = []
    10.times do |n|
      @device_imeis <<	imei + n.to_s
    end
    @latitudes  = ['42.878768', '42.880494', '42.879236', '42.879480', '42.880321', '42.878768', '42.880494', '42.879236', '42.879480', '42.880321']
    @longtitudes = ['74.600024', '74.599629', '74.601249', '74.599028', '74.600959', '74.600024', '74.599629', '74.601249', '74.599028', '74.600959']
  end

  def connect
    hostname = 'trucking.cf'
    port = 5055

    @s = []
    @device_imeis.each do
      @s << TCPSocket.open(hostname, port)
    end
  end

  def send
    loop do
      @device_imeis.each_with_index do |imei, index|
        msg = "GET /?id=#{imei}&timestamp=#{@date}&lat=#{@latitudes.sample}&lon=#{@longtitudes.sample}&speed=0.0&bearing=0.0&altitude=905.0&batt=58.0 HTTP/1.1
							User-Agent: Dalvik/2.1.0 (Linux; U; Android 6.0.1; Redmi Note 3 MIUI/7.1.19)
							Host: trucking.cf:5055
							Connection: Keep-Alive
							Accept-Encoding: gzip

							"
        @s[index].puts(msg)
        sleep 1
      end
    end
  end
end

em = Emulator.new
em.connect
em.send