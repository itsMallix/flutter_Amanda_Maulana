# FLutter Navigation
adalah bagaimana pengguna berpindah ke halaman lain

# Navigation Dasar
- menggunakan navigation.push => halaman selanjutnya
- menggunakan navigation.pop => untuk kembali
- bisa mengirim data kehalaman baru dengan parameter
- menggunakan parameter dengan constructor

# Navigator Named
- setiap halmaan memiliki alamaat yang disebut route
- menggunakan navigator.pushNamed => berpindah halaman
- menggunakan navigator.pop => kembali ke halaman sebelumnya
- di definisikan pada main, bisa menggunakan argument sebagai param

# Summary Kelas
- context mengacu pada halaman saat ini
- pada saat pindah halaman sebenernya akan terbentuk seperti stack / numpuk
- push replacement akan menghapus page sebelumnya agar tidak terjadi malfugsi seperti pada saat login menuju halaman dashboard
- pada saat berpindah page bisa menggunakan parameter, parameter harus string
- kalau ingin paramater tidak wajib diisi, bisa memakai null savety *String? param*, berarti nilai boleh null
- pada bagian pemanggilan parameteri tambahkan *paramater ?? "nilai default"* 
- navigator named biasanya digunakan pada web pada bagian url