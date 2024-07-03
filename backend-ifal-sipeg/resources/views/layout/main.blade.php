<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title', 'SIPEG IFAL')</title>

    <link rel="stylesheet" type="text/css" href="/css/style.css">
    <style>
        .text-disabled {
            color: rgba(128, 128, 128, 0.654);
        }

        .text-disabled:hover {
            color: rgba(128, 128, 128, 0.654);

        }
    </style>
</head>

<body>

    <main class="table" id="customers_table">
        <nav>
            <ul>
                <li><a href="/" style="background-color: black; color: white;">Home</a></li>
                @if (session('hak_akses') == 1)
                    <li><a href="/users">Users</a></li>
                @else
                    <li><a class="text-disabled">Users</a></li>
                @endif
                <li><a href="/pegawais">Pegawai</a></li>

                <li><a href="/jabatans">Jabatan</a></li>
                <li><a href="/gajis">Gaji</a></li>
                <li><a href="/cutis">Cuti</a></li>
                <li><a href="/absensis">Absensi</a></li>
                <li><a href="/penilaian_kerjas">Penilaian Kerja</a></li>
                <li><a href="/postingans">Postingan</a></li>
            </ul>
        </nav>
        <section class="table__header">
            <h1>
                @yield('tablename', 'SIPEG IFAL')
                <a href="@yield('hrefcreate', '')" class="mycreateBtn">Create+</a>
            </h1>
            <div class="input-group">
                <input type="search" placeholder="Search Data...">
                <img src="/images/search.png" alt="">
            </div>
            {{-- <div class="export__file">
                <label for="export-file" class="export__file-btn" title="Export File"></label>
                <input type="checkbox" id="export-file">
                <div class="export__file-options">
                    <label>Export As &nbsp; &#10140;</label>
                    <label for="export-file" id="toPDF">PDF <img src="/images/pdf.png" alt=""></label>
                    <label for="export-file" id="toJSON">JSON <img src="/images/json.png" alt=""></label>
                    <label for="export-file" id="toCSV">CSV <img src="/images/csv.png" alt=""></label>
                    <label for="export-file" id="toEXCEL">EXCEL <img src="/images/excel.png" alt=""></label>
                </div>
            </div> --}}
        </section>
        @yield ('content')
    </main>
    <script src="/js/script.js"></script>

</body>

</html>
