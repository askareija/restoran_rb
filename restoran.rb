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
    puts '====================== NOTA PESANAN ======================'
    puts "customer : #{@pelanggan}"
    puts 'No. |Item         | Harga | Qty |   Total    |'
    @items.each do |pesanan|
      puts "#{pesanan['no']}   | #{pesanan['nama']} | #{pesanan['harga']} |  #{pesanan['qty']}  |    #{pesanan['harga'].to_i * pesanan['qty'].to_i}    |"
    end
    puts '=========================================================='
    puts "Total Harga       :   #{@total_harga}"
    puts "Total Diskon      :   #{@diskon}"
    puts "Bayar             :   #{@pembayaran}"
    puts "Jenis Pembayaran  :   #{@jenis_pembayaran}"
    puts "Kembalian         :   #{@kembalian}"
    puts '=========================================================='
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
    @total_harga = @total_harga - @diskon

    @jenis_pembayaran = jenis_pembayaran == '1' ? 'Cash' : 'Credit'
    @kembalian = @pembayaran.to_i - (@total_harga - @diskon)
    cetak_nota_pesanan
  end
end

restoran = Restoran.new
restoran.run
