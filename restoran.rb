class Restoran
  def initialize
    @total_harga = 0
    @pembayaran = 0
    @jenis_pembayaran = ''
    @kembalian = 0
    @diskon = 0
    @items = []
    @pelanggan = 'Megumi Aliya'
  end

  def run
    puts "Selamat datang, silakan pilih menu\n\n"
    pilih_menu
  end

  def pilih_menu
    daftar_menu
    print 'Pesanan : '
    tambah_pesanan(gets.chomp)
    konfirmasi_pesanan
  end

  def daftar_menu
    puts 'No  | ITEM              | HARGA     '
    puts '1   | Nasi Goreng       | 15.0000   '
    puts '2   | Nasi Timbel       | 17.0000   '
    puts '3   | Nasi Bakar        | 30.0000   '
    puts '4   | Nasi Kuning       | 15.0000   '
    puts '5   | Nasi Uduk         | 10.0000   '
    puts '===================================='
    puts '6  Keluar'
  end

  def tambah_pesanan(no_menu)
    case no_menu
    when '1'
      if @items.any? { |item| item['no'] == 1 }
        @items.find { |item| item['no'] == 1 }['qty'] += 1
      else
        @items.push({ 'no' => 1, 'nama' => 'Nasi Goreng', 'harga' => 15_000, 'qty' => 1 })
      end
      puts 'Nasi goreng ditambahkan'
    when '2'
      if @items.any? { |item| item['no'] == 2 }
        @items.find { |item| item['no'] == 2 }['qty'] += 1
      else
        @items.push({ 'no' => 2, 'nama' => 'Nasi Timbel', 'harga' => 17_000, 'qty' => 1 })
      end
      puts 'Nasi Timbel ditambahkan'
    when '3'
      if @items.any? { |item| item['no'] == 3 }
        @items.find { |item| item['no'] == 3 }['qty'] += 1
      else
        @items.push({ 'no' => 3, 'nama' => 'Nasi Bakar', 'harga' => 30_000, 'qty' => 1 })
      end
      puts 'Nasi Bakar ditambahkan'
    when '4'
      if @items.any? { |item| item['no'] == 4 }
        @items.find { |item| item['no'] == 4 }['qty'] += 1
      else
        @items.push({ 'no' => 4, 'nama' => 'Nasi Kuning', 'harga' => 15_000, 'qty' => 1 })
      end
      puts 'Nasi Kuning ditambahkan'
    when '5'
      if @items.any? { |item| item['no'] == 5 }
        @items.find { |item| item['no'] == 5 }['qty'] += 1
      else
        @items.push({ 'no' => 5, 'nama' => 'Nasi Uduk', 'harga' => 10_000, 'qty' => 1 })
      end
      puts 'Nasi Uduk ditambahkan'
    when '6'
      if @items.any? { |item| item['no'] == 6 }
        @items.find { |item| item['no'] == 6 }['qty'] += 1
      else
        @items.push({ 'no' => 6, 'nama' => 'Nasi Timbel', 'harga' => 17_000, 'qty' => 1 })
      end
      puts 'Nasi Timbel ditambahkan'
    else
      puts 'Menu tidak valid.'
    end
  end

  def konfirmasi_pesanan
    print 'Anda ingin memesan yang lain ? (yes/no) : '
    gets.chomp == 'yes' ? pilih_menu : bayar
  end

  def cetak_nota_pesanan
    puts '============================ NOTA PESANAN ============================='
    puts "customer : #{@pelanggan}"
    puts ''
    puts '-----------------------------------------------------------------------'
    puts "#{'No.'.center(5)} | #{'Item'.center(16)} | #{'Harga'.center(16)} | #{'Qty'.center(5)} | #{'Total'.center(16)}|"
    puts '-----------------------------------------------------------------------'
    @items.each do |pesanan|
      total = pesanan['harga'].to_i * pesanan['qty'].to_i
      puts "#{pesanan['no'].to_s.center(5)} | #{pesanan['nama'].to_s.center(16)} | #{format_rupiah(pesanan['harga']).center(16)} | #{pesanan['qty'].to_s.center(5)} | #{format_rupiah(total).center(16)}|"
    end
    puts '======================================================================='
    puts "Total Harga       :   #{format_rupiah(@total_harga)}"
    puts "Total Diskon      :   #{format_rupiah(@diskon)}"
    puts "Bayar             :   #{format_rupiah(@pembayaran)}"
    puts "Kembalian         :   #{format_rupiah(@kembalian)}"
    puts "Jenis Pembayaran  :   #{@jenis_pembayaran}"
    puts '======================================================================='
  end

  def bayar
    puts "\nPromo pembayaran Cash diskon 10% dan credit 3%"
    puts 'Pembayaran Cash / Credit ? ( 1 untuk Cash dan 2 untuk Credit) '
    jenis_pembayaran = gets.chomp
    puts 'Jumlah yang dibayar : '
    @pembayaran = gets.chomp

    @total_harga = @items.map { |item| item['harga'] * item['qty'] }.sum
    case jenis_pembayaran
    when '1'
      @diskon = @total_harga * 0.1
    when '2'
      @diskon = @total_harga * 0.3
    else
      puts 'Tidak valid.'
    end
    @total_harga -= @diskon

    @jenis_pembayaran = jenis_pembayaran == '1' ? 'Cash' : 'Credit'
    @kembalian = @pembayaran.to_i - (@total_harga - @diskon)
    cetak_nota_pesanan
  end

  def format_rupiah(number)
    regex = /(\d)(?=(\d\d\d)+(?!\d))/

    left = number.to_s.split('.')
    left.gsub!(regex) do |digit_to_delimit|
      "#{digit_to_delimit}."
    end

    "Rp. #{left},00"
  end
end

restoran = Restoran.new
restoran.run
