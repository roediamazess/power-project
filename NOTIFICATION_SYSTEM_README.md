# Enhanced Notification System

Sistem notifikasi yang muncul di bawah floating navigation bar sebelah kiri dengan desain modern dan fitur-fitur canggih.

## 🎯 Fitur Utama

### Visual Features
- **Posisi**: Muncul tepat di bawah floating navigation bar sebelah kiri
- **Desain**: Modern capsule design dengan backdrop blur effect
- **Animasi**: Smooth animations dengan cubic-bezier easing
- **Responsive**: Otomatis menyesuaikan posisi pada resize window
- **Multiple Support**: Mendukung multiple notifications dengan staggered animations

### Notification Types
- **Success** (Hijau) - Operasi berhasil
- **Error** (Merah) - Error atau kesalahan
- **Warning** (Kuning) - Peringatan
- **Info** (Biru) - Informasi umum
- **Create** (Ungu) - Pembuatan data baru
- **Update** (Cyan) - Update data
- **Delete** (Orange) - Penghapusan data

### Special Features
- **Important**: Notifikasi penting dengan pulsing glow effect
- **Persistent**: Notifikasi yang tetap muncul sampai diklik
- **Quick**: Notifikasi cepat (2 detik)
- **Custom Duration**: Durasi yang dapat dikustomisasi
- **Auto-close**: Dapat diatur untuk otomatis tertutup atau tidak

## 🚀 Cara Penggunaan

### Basic Usage
```javascript
// Notifikasi sederhana
showNotification('Pesan notifikasi', 'success');

// Menggunakan convenience functions
showSuccess('Data berhasil disimpan');
showError('Terjadi kesalahan');
showWarning('Perhatian!');
showInfo('Informasi penting');
```

### Advanced Usage
```javascript
// Notifikasi dengan opsi custom
showNotification('Pesan custom', 'info', {
    duration: 3000,        // 3 detik
    important: true,       // Pulsing effect
    autoClose: true        // Auto close
});

// Notifikasi penting
showImportant('Notifikasi penting!', 'warning');

// Notifikasi persistent
showPersistent('Klik untuk menutup', 'error');

// Notifikasi cepat
showQuick('Notifikasi cepat', 'success');
```

### Management Functions
```javascript
// Hapus semua notifikasi
clearAllNotifications();

// Dapatkan jumlah notifikasi aktif
const count = getNotificationCount();
console.log('Jumlah notifikasi:', count);
```

## 🎨 Customization

### CSS Classes
```css
/* Container utama */
#notification-container {
    position: fixed;
    top: 100px;
    left: 24px;
    z-index: 1000;
}

/* Notifikasi capsule */
.notification-capsule {
    border-radius: 12px;
    padding: 16px;
    backdrop-filter: blur(10px);
    /* ... */
}

/* Tipe notifikasi */
.notification-success { /* Hijau gradient */ }
.notification-error { /* Merah gradient */ }
.notification-warning { /* Kuning gradient */ }
.notification-info { /* Biru gradient */ }
.notification-create { /* Ungu gradient */ }
.notification-update { /* Cyan gradient */ }
.notification-delete { /* Orange gradient */ }
```

### Animation Classes
```css
/* Animasi muncul */
@keyframes emerge-from-logo {
    0% { opacity: 0; transform: translateY(-30px) scale(0.6) rotate(-5deg); }
    100% { opacity: 1; transform: translateY(0) scale(1) rotate(0deg); }
}

/* Animasi keluar */
@keyframes fade-out {
    0% { opacity: 1; transform: scale(1) translateY(0); }
    100% { opacity: 0; transform: scale(0.8) translateY(-10px); }
}

/* Pulsing effect untuk important */
@keyframes pulse-glow {
    0%, 100% { box-shadow: normal; }
    50% { box-shadow: 0 0 20px rgba(59, 130, 246, 0.5); }
}
```

## 📱 Responsive Design

Sistem notifikasi otomatis menyesuaikan posisi dan ukuran pada berbagai ukuran layar:

- **Desktop**: Posisi di bawah floating nav sebelah kiri
- **Tablet**: Posisi disesuaikan dengan ukuran layar
- **Mobile**: Full width dengan margin yang sesuai

## 🔧 Technical Details

### File Structure
```
public/assets/css/notifications.css    # Styling utama
public/assets/js/notifications.js      # JavaScript logic
resources/views/demo/notifications.blade.php  # Demo page
```

### Dependencies
- Tailwind CSS (untuk utility classes)
- Modern JavaScript (ES6+)
- CSS3 animations dan transforms

### Browser Support
- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+

## 🎯 Demo

Kunjungi halaman demo di `/demo/notifications` untuk melihat semua fitur dalam aksi:

- Test semua tipe notifikasi
- Coba fitur advanced (important, persistent, quick)
- Test multiple notifications
- Lihat responsive behavior

## 🚀 Future Enhancements

- [ ] Sound notifications
- [ ] Notification history
- [ ] Custom themes
- [ ] Animation presets
- [ ] Notification groups
- [ ] Action buttons dalam notifikasi

## 📝 Changelog

### v2.0.0 (Current)
- ✅ Enhanced positioning system
- ✅ Multiple notification support
- ✅ Important notifications dengan pulsing effect
- ✅ Persistent notifications
- ✅ Auto-repositioning on resize
- ✅ Improved animations dan transitions
- ✅ Better responsive design
- ✅ Enhanced demo page

### v1.0.0
- ✅ Basic notification system
- ✅ 7 notification types
- ✅ Auto-dismiss functionality
- ✅ Click to close
- ✅ Basic animations

---

**Dibuat dengan ❤️ untuk Power Project**
