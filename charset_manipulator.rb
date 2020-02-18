require 'mini_magick'
require 'pathname'

image_path = Pathname('src/file.jpg').realpath.to_s

cyrillic_font_path = Pathname('fonts/Oswald-Bold.ttf').realpath.to_s
arabic_font_path = Pathname('fonts/Changa-Bold.ttf').realpath.to_s

text_to_write_in_cyrillic = 'Привет'
text_to_write_in_arabic = 'مرحبا'

img = MiniMagick::Image.open(image_path)

img.combine_options do |i|
  i.encoding 'UTF-8'
  i.fill 'green'
  i.gravity 'Southwest'
  i.pointsize 35
  i.kerning 1.5
  i.weight 800
  i.font arabic_font_path

  i.draw("text 230,150 '#{text_to_write_in_arabic}")
end

img.write ['dist', '/', 'arabic', '-', Time.now.to_i, '.png'].join

img = MiniMagick::Image.open(image_path)

img.combine_options do |i|
  i.encoding 'UTF-8'
  i.fill 'green'
  i.gravity 'Southwest'
  i.pointsize 35
  i.kerning 1.5
  i.weight 800
  i.font cyrillic_font_path

  i.draw("text 230,150 '#{text_to_write_in_cyrillic}")
end

img.write ['dist', '/', 'cyrillic', '-', Time.now.to_i, '.png'].join
