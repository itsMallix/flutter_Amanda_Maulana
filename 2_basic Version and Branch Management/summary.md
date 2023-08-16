# Versioning?
Mengatur versi dari source code program

# Sejarah Version Control System
<Single User> <lokal>
SCCS - 1972 Unix only
RCS - 1982 Cross Platform, Text only

<Centralized> <terpusat> <terhubung ke beberapa komputer>
CVS - 1986 File Focus
Perforce - 1995
Subversion - 2000 - track directory structure
Msteam foundation server - 2005

<Distribute>
Git - 2005
Mercurial - 2005
Bazaar - 2005

# GIT <terdistribusi> <setiap orang akan memiliki kode mereka sendiri>
salah satu vcs populer yang digunakan para developer untuk mengembangkan software secara bersama sama dibuat oleh linus torvalds 2005


# Git Command
- git init : inisalisasi folder repositori
- git diff : melihat perubahan dalam sourcecode kita
- git commit : pesan yang disampaikan ketika uplaod file
- git stash : untuk memasukkan stash (barisan kode yang mungkin dugunakan secara berulang)
- git log --oneline : melihat history atau log dari git dan kembali ke bentuk kode sebelumnya
- git checkout : mengambil stash yang sudah disimpan
- git reset : reset / tulis ulang / menghapus
- git reset soft : akan mengembalikan kondisi file dalam keadaan staged
- git reset hard : akan mengembalikan kondisi file dalam keadaan commited
- git remote : melihat repository yang di remote
- git pull origin : mengambil sourceccode yang sama pada repository
- git push origin : mengupload file

# file .gitignore
berfungsi untuk filtering file yang boleh di commit ke repo dan yang tidak boleh 

# Branch and Conflic
berfungsi untuk melindungi project main

# Git Branch Command
- git branch --list : ngecek branch yang ada di repo
- git branch <nama> : membuat branch baru
- git push -u origin <namaBranch> : push ke arah branch tertentu
- git branch -D <namaBranch> : delete
- git branch -a : remote branch
- git checkout main : berpindah branch dari branch sebelumnya ke brach main
- git merge <namaBranch> : menggabungkan file dalam branch ke main


# Pull Request
teknik yang digunakan untuk berkontribusi ke repo orang lain

# Fork
cloning repo tapi milik orang lain cloning akan memiliki data yang sama dengan yang ada di repo

== Jangan sentuh branch master
== Hindari edit branch developer secara langsung
== Gunakan merge branch fitur-fitur ke branch develop
== Gunakan branch master ketika semua sudah clear pada branch develop

# Conflic
terjadi jika dalam branch developer terdapat perubahan yang berbeda pada branch main, ketika akan di merge harus melakukan sesuatu terlebih dahulu, menyelesaikan conflic bias diambil kedua kode atau ambil salah satu yang akan di commit

