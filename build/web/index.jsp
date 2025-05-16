<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Film" %>
<%
    // Karena Film butuh properti gambar, aku asumsikan Film sudah ada constructor berikut:
    // Film(String judul, String genre, int durasi, int hargaTiket, String[] jamTayang, String gambar)

    List<Film> daftarFilm = new ArrayList<>();
    daftarFilm.add(new Film("Avengers", "Action", 60, 50000, new String[]{"12:00", "15:00", "18:00"}, "avg.jpg"));
    daftarFilm.add(new Film("Frozen", "Animation", 80, 30000, new String[]{"10:00", "13:00", "16:00"}, "jrp.jpg"));
    daftarFilm.add(new Film("Avatar", "Animation", 60, 45000, new String[]{"11:00", "13:00", "17:00"}, "avtr.jpg"));
    daftarFilm.add(new Film("Susana", "Horor", 80, 50000, new String[]{"12:00", "13:00", "19:00"}, "ssn.jpg"));
    daftarFilm.add(new Film("Valak", "Horor", 80, 50000, new String[]{"13:00", "14:00", "18:00"}, "vlk.jpg"));
    daftarFilm.add(new Film("Tukang Bubur Naik Haji The Movie", "Cinema", 70, 55000, new String[]{"14:00", "15:00", "12:00"}, "tbnh.jpg"));
    daftarFilm.add(new Film("Spongebob The Movie", "Animation", 80, 60000, new String[]{"15:00", "16:00", "10:00"}, "spngbb.jpg"));
    daftarFilm.add(new Film("Doraemon Toxic", "Animation", 60, 35000, new String[]{"16:00", "17:00", "20:00"}, "drem.jpg"));
    daftarFilm.add(new Film("Toy Story", "Animation", 120, 55000, new String[]{"17:00", "19:00", "21:00"}, "tys.jpg"));
    daftarFilm.add(new Film("Naruto Shippuden", "Animation", 120, 65000, new String[]{"08:00", "10:00", "16:00"}, "nrt.jpg"));
    daftarFilm.add(new Film("UP The Movie", "Animation", 105, 42000, new String[]{"15:00", "20:00", "21:00"}, "up.jpg"));

    session.setAttribute("daftarFilm", daftarFilm);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Daftar Film</title>
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        body {
            background-color: #0d1117;
            color: #ffffff;
            min-height: 100vh;
        }
        h2 {
            color: #58a6ff;
            margin-top: 30px;
        }
        marquee {
            color: #79c0ff;
            font-weight: 600;
            font-size: 1.1rem;
        }
        .card-film {
            background-color: #161b22;
            border: 1px solid #30363d;
            color: #c9d1d9;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            height: 100%;
        }
        .card-film:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgb(88 166 255 / 0.5);
            border-color: #58a6ff;
            color: #58a6ff;
        }
        .card-title {
            color: #58a6ff;
        }
        .badge-genre {
            background-color: #58a6ff;
            color: #0d1117;
            font-weight: 600;
        }
        .btn-pesan {
            background-color: #58a6ff;
            color: #0d1117;
            border: none;
            font-weight: 600;
        }
        .btn-pesan:hover {
            background-color: #1f6feb;
            color: #ffffff;
        }
        /* Buat ukuran gambar poster supaya seragam */
        .card-img-top {
            height: 200px;
            object-fit: cover;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">🎬 Daftar Film di MAJALAYA CITY</h2>
    <marquee>YUK! NONTON DI THE MAJALAYA CITY</marquee>

    <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4 mt-4">
        <% for (Film f : daftarFilm) { %>
            <div class="col">
                <div class="card card-film h-100 p-3">
                    <img src="image/<%= f.getGambar() %>" class="card-img-top mb-3 rounded" alt="Poster <%= f.getJudul() %>" />
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= f.getJudul() %></h5>
                        <span class="badge badge-genre mb-2"><%= f.getGenre() %></span>
                        <p class="card-text mb-1"><strong>Durasi:</strong> <%= f.getDurasi() %> menit</p>
                        <p class="card-text mb-1"><strong>Harga Tiket:</strong> Rp <%= f.getHargaTiket() %></p>
                        <p class="card-text mb-3"><strong>Jam Tayang:</strong> <%= String.join(", ", f.getJamTayang()) %></p>
                        <div class="mt-auto text-center">
                            <a href="formPesan.jsp" class="btn btn-pesan w-100">Pesan Tiket 🎟️</a>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>
</body>
</html>
