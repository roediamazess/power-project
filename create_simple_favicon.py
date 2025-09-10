#!/usr/bin/env python3
"""
Script sederhana untuk membuat favicon dari logo perusahaan
"""

try:
    from PIL import Image, ImageDraw
    print("✅ PIL (Pillow) tersedia")
except ImportError:
    print("❌ PIL (Pillow) tidak tersedia, menginstall...")
    import subprocess
    subprocess.check_call(["pip", "install", "Pillow"])
    from PIL import Image, ImageDraw
    print("✅ PIL (Pillow) berhasil diinstall")

def create_simple_favicon():
    """Membuat favicon sederhana dari logo perusahaan"""
    
    print("🎨 Membuat favicon dari logo perusahaan...")
    
    # Buat favicon 16x16
    size = 16
    img = Image.new('RGBA', (size, size), (0, 0, 0, 255))
    draw = ImageDraw.Draw(img)
    
    # Warna sesuai logo perusahaan
    colors = {
        'blue': (0, 150, 255, 255),      # Biru terang
        'pink': (255, 100, 200, 255),    # Pink terang  
        'green': (100, 255, 100, 255),   # Hijau terang
        'yellow': (255, 255, 100, 255)   # Kuning terang
    }
    
    # Buat 4 bentuk oval yang tumpang tindih
    center = size // 2
    radius = 6
    
    # Atas - Biru
    draw.ellipse([center-radius//2, center-radius, center+radius//2, center+radius//2], 
                fill=colors['blue'])
    
    # Kiri - Pink
    draw.ellipse([center-radius, center-radius//2, center+radius//2, center+radius], 
                fill=colors['pink'])
    
    # Kanan - Hijau  
    draw.ellipse([center-radius//2, center-radius//2, center+radius, center+radius], 
                fill=colors['green'])
    
    # Bawah - Kuning
    draw.ellipse([center-radius//2, center+radius//2, center+radius//2, center+radius], 
                fill=colors['yellow'])
    
    # Simpan sebagai favicon utama
    img.save('public/assets/images/favicon.png')
    print("✅ Favicon.png berhasil dibuat")
    
    # Buat favicon.ico untuk kompatibilitas
    img.save('public/favicon.ico', format='ICO')
    print("✅ Favicon.ico berhasil dibuat")
    
    # Buat versi 32x32 untuk resolusi tinggi
    size32 = 32
    img32 = Image.new('RGBA', (size32, size32), (0, 0, 0, 255))
    draw32 = ImageDraw.Draw(img32)
    
    center32 = size32 // 2
    radius32 = 12
    
    # Atas - Biru
    draw32.ellipse([center32-radius32//2, center32-radius32, center32+radius32//2, center32+radius32//2], 
                  fill=colors['blue'])
    
    # Kiri - Pink
    draw32.ellipse([center32-radius32, center32-radius32//2, center32+radius32//2, center32+radius32], 
                  fill=colors['pink'])
    
    # Kanan - Hijau  
    draw32.ellipse([center32-radius32//2, center32-radius32//2, center32+radius32, center32+radius32], 
                  fill=colors['green'])
    
    # Bawah - Kuning
    draw32.ellipse([center32-radius32//2, center32+radius32//2, center32+radius32//2, center32+radius32], 
                  fill=colors['yellow'])
    
    img32.save('public/assets/images/favicon-32x32.png')
    print("✅ Favicon-32x32.png berhasil dibuat")
    
    print("🎉 Semua favicon berhasil dibuat!")

if __name__ == "__main__":
    create_simple_favicon()



