package model;

public class Film {
    private String judul;
    private String genre;
    private int durasi;
    private int hargaTiket;
    private String[] jamTayang;
    private String gambar; // properti gambar baru

    // Constructor lama (5 parameter)
    public Film(String judul, String genre, int durasi, int hargaTiket, String[] jamTayang) {
        this.judul = judul;
        this.genre = genre;
        this.durasi = durasi;
        this.hargaTiket = hargaTiket;
        this.jamTayang = jamTayang;
        this.gambar = "";  // default kosong
    }

    // Constructor baru (6 parameter) termasuk gambar
    public Film(String judul, String genre, int durasi, int hargaTiket, String[] jamTayang, String gambar) {
        this.judul = judul;
        this.genre = genre;
        this.durasi = durasi;
        this.hargaTiket = hargaTiket;
        this.jamTayang = jamTayang;
        this.gambar = gambar;
    }

    // Getter dan setter
    public String getJudul() {
        return judul;
    }

    public String getGenre() {
        return genre;
    }

    public int getDurasi() {
        return durasi;
    }

    public int getHargaTiket() {
        return hargaTiket;
    }

    public String[] getJamTayang() {
        return jamTayang;
    }

    public String getGambar() {
        return gambar;
    }

    // Jika ingin setter juga, bisa ditambahkan
}
