#!/usr/bin/env python3
"""
Script untuk membuat favicon dari logo perusahaan
Membuat favicon dalam berbagai ukuran dan format
"""

from PIL import Image, ImageDraw
import os

def create_favicon_from_logo():
    """Membuat favicon dari logo perusahaan dengan desain geometris"""
    
    # Ukuran favicon yang dibutuhkan
    sizes = [16, 32, 48]
    
    for size in sizes:
        # Buat canvas hitam
        img = Image.new('RGBA', (size, size), (0, 0, 0, 255))
        draw = ImageDraw.Draw(img)
        
        # Hitung proporsi untuk setiap ukuran
        center = size // 2
        radius = int(size * 0.4)  # 40% dari ukuran canvas
        
        # Warna sesuai logo perusahaan
        colors = {
            'blue': (0, 150, 255, 255),      # Biru terang
            'pink': (255, 100, 200, 255),    # Pink terang  
            'green': (100, 255, 100, 255),   # Hijau terang
            'yellow': (255, 255, 100, 255)   # Kuning terang
        }
        
        # Buat 4 bentuk oval yang tumpang tindih (seperti logo asli)
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
        
        # Simpan sebagai PNG
        img.save(f'public/assets/images/favicon_{size}x{size}.png')
        print(f"✅ Favicon {size}x{size} berhasil dibuat")
    
    # Buat favicon utama (16x16)
    main_favicon = Image.new('RGBA', (16, 16), (0, 0, 0, 255))
    draw = ImageDraw.Draw(main_favicon)
    
    center = 8
    radius = 6
    
    # Warna sesuai logo perusahaan
    colors = {
        'blue': (0, 150, 255, 255),
        'pink': (255, 100, 200, 255), 
        'green': (100, 255, 100, 255),
        'yellow': (255, 255, 100, 255)
    }
    
    # Buat 4 bentuk oval yang tumpang tindih
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
    main_favicon.save('public/assets/images/favicon.png')
    print("✅ Favicon utama (16x16) berhasil dibuat")
    
    # Buat favicon.ico untuk kompatibilitas
    main_favicon.save('public/favicon.ico', format='ICO')
    print("✅ Favicon.ico berhasil dibuat")

if __name__ == "__main__":
    print("🎨 Membuat favicon dari logo perusahaan...")
    create_favicon_from_logo()
    print("🎉 Semua favicon berhasil dibuat!")



