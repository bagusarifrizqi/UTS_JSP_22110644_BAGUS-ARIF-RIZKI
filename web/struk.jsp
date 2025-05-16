<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.*, java.util.Locale, model.Film" %>
<%
    String nama = request.getParameter("nama");
    String filmDipilih = request.getParameter("film");
    String jam = request.getParameter("jam");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");

    int hargaTiket = 0;
    String gambarFilm = "";

    for (Film f : daftarFilm) {
        if (f.getJudul().equals(filmDipilih)) {
            hargaTiket = f.getHargaTiket();
            gambarFilm = f.getGambar();
            break;
        }
    }
    int total = jumlah * hargaTiket;

    // Format rupiah
    Locale indo = new Locale("id", "ID");
    NumberFormat rupiahFormat = NumberFormat.getCurrencyInstance(indo);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Struk Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #0b0f1a;
            color: #e2e8f0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .struk-container {
            background: linear-gradient(145deg, #0f172a, #1e293b);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.6);
            margin-top: 60px;
            max-width: 700px;
        }

        h2 {
            color: #60a5fa;
            margin-bottom: 30px;
        }

        .poster-img {
            max-height: 260px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.4);
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            padding: 8px 0;
            border-bottom: 1px solid #334155;
            font-size: 1rem;
        }

        .info-item:last-child {
            border-bottom: none;
        }

        .label {
            color: #94a3b8;
        }

        .value {
            font-weight: 500;
            color: #ffffff;
        }

        .highlight {
            color: #38bdf8;
            font-weight: bold;
        }

        .btn-kembali {
            background-color: #3b82f6;
            color: #ffffff;
            padding: 10px 25px;
            border-radius: 10px;
            font-weight: 600;
            border: none;
            margin-top: 30px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-kembali:hover {
            background-color: #2563eb;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
<div class="container d-flex justify-content-center">
    <div class="struk-container text-center">
        <h2>🎫 Struk Pemesanan</h2>

        <img src="image/<%= gambarFilm %>" alt="Poster <%= filmDipilih %>" class="img-fluid poster-img" />

        <div class="text-start">
            <div class="info-item">
                <span class="label">Nama Pemesan:</span>
                <span class="value"><%= nama %></span>
            </div>
            <div class="info-item">
                <span class="label">Film yang Dipilih:</span>
                <span class="value"><%= filmDipilih %></span>
            </div>
            <div class="info-item">
                <span class="label">Jam Tayang:</span>
                <span class="value"><%= jam %></span>
            </div>
            <div class="info-item">
                <span class="label">Jumlah Tiket:</span>
                <span class="value"><%= jumlah %></span>
            </div>
            <div class="info-item">
                <span class="label">Harga per Tiket:</span>
                <span class="value"><%= rupiahFormat.format(hargaTiket) %></span>
            </div>
            <div class="info-item">
                <span class="label">Total Harga:</span>
                <span class="value highlight"><%= rupiahFormat.format(total) %></span>
            </div>
        </div>

        <a href="index.jsp" class="btn btn-kembali">⬅️ Kembali ke Beranda</a>
    </div>
</div>
</body>
</html>
