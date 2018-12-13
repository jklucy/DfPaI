from PIL import Image
import os


ASCII_CHARS = [ '#', '?', '.']



def image_to_ascii(image_path):
    image = Image.open(image_path)
    width,height = image.size
    

    image = image.resize((width, height))
    image = image.convert('L')
    pixels_in_image = list(image.getdata())
    range_width = 256/ len(ASCII_CHARS)
    pixels_to_chars = [ASCII_CHARS[ int(pixel_value//range_width)] for pixel_value in
            pixels_in_image]

    chars = "".join(pixels_to_chars) # converting array to characters

    image_ascii = [chars[index: index + width] for index in
             range(0, len(chars), width)]


    chars_split = "\n".join(image_ascii)

    f = open(os.path.splitext(image_path)[0]+'.txt','w')
    f.write(chars_split)
    f.close()


if __name__=='__main__':
    import sys


    image_path = sys.argv[1]



    image_to_ascii(image_path)
