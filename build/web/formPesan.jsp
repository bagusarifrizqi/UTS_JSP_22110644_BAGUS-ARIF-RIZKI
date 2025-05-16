<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Film" %>
<%
    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");
    String filmDipilih = request.getParameter("film");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Pemesanan Tiket</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #0b0f1a;
            color: #f0f4f8;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        h2 {
            color: #4ea8de;
            margin-top: 30px;
        }

        .form-container {
            position: relative;
            background: linear-gradient(145deg, #0f172a, #1e293b);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.6);
            margin-top: 50px;
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: scale(1.01);
        }

        .form-container::before {
            content: "";
            position: absolute;
            inset: 0;
            border-radius: 20px;
            padding: 2px;
            background: linear-gradient(130deg, #3b82f6, transparent, #1e3a8a);
            -webkit-mask: 
                linear-gradient(#fff 0 0) content-box, 
                linear-gradient(#fff 0 0);
            -webkit-mask-composite: destination-out;
            mask-composite: exclude;
            z-index: -1;
        }

        .form-label {
            color: #cbd5e1;
            font-weight: 500;
        }

        .form-control,
        .form-select {
            background-color: #1e293b;
            color: #e2e8f0;
            border: 1px solid #334155;
            border-radius: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.25);
            background-color: #1e293b;
            color: #ffffff;
        }

        .btn-pesan {
            background-color: #3b82f6;
            color: #ffffff;
            border: none;
            padding: 10px 30px;
            border-radius: 12px;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .btn-pesan:hover {
            background-color: #2563eb;
            transform: translateY(-2px);
        }

        marquee {
            color: #60a5fa;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <marquee>AYO PESAN DAN NONTON SEKARANG 😁</marquee>
    <h2 class="text-center">🎟️ Form Pemesanan Tiket</h2>
    <div class="form-container mx-auto col-md-6">
        <form action="struk.jsp" method="post">
            <div class="mb-3">
                <label for="nama" class="form-label">Nama Pemesan</label>
                <input type="text" class="form-control" id="nama" name="nama" required>
            </div>

            <div class="mb-3">
                <label for="jumlah" class="form-label">Jumlah Tiket</label>
                <input type="number" class="form-control" id="jumlah" name="jumlah" min="1" required>
            </div>

            <div class="mb-3">
                <label for="film" class="form-label">Pilih Film</label>
                <select class="form-select" id="film" name="film">
                    <% for (Film f : daftarFilm) { %>
                        <option value="<%= f.getJudul() %>" <%= f.getJudul().equals(filmDipilih) ? "selected" : "" %>><%= f.getJudul() %></option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label for="jam" class="form-label">Pilih Jam</label>
                <select class="form-select" id="jam" name="jam">
                    <% 
                        Film filmTerpilih = daftarFilm.get(0);
                        for (Film f : daftarFilm) {
                            if (f.getJudul().equals(filmDipilih)) {
                                filmTerpilih = f;
                                break;
                            }
                        }
                        for (String jam : filmTerpilih.getJamTayang()) {
                    %>
                        <option value="<%= jam %>"><%= jam %></option>
                    <% } %>
                </select>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-pesan">Pesan Sekarang</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
