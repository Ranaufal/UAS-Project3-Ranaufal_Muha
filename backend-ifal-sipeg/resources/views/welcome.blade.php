<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>Document</title>

    <style>
        nav {
            display: flex;
            justify-content: space-between;
            padding: 1rem 2rem;
        }

        .bgtransparent {
            background-color: rgba(255, 255, 255, 0.514);
        }

        .bgdisabled {
            background-color: rgba(128, 128, 128, 0.654);
        }
    </style>
</head>

<body style="background: url(/images/html_table.jpg) center / cover;min-height: 100vh;">
    <nav class="bgtransparent">
        <h2 class="text-dark">Home</h2>
        <form method="post" action="/logout">
            @csrf
            <input type="submit" name="" value="Logout" id="">
        </form>
    </nav>
    <br><br>
    <main class="table" id="customers_table">
        <div class="container text-center">
            <div class="row gap-3">
                <div class="row gap-3">
                    @if (session('hak_akses') == 1)
                        <a href="/users"
                            class="col py-5 bgtransparent text-decoration-none text-dark rounded-4">User</a>
                    @else
                        <div class="col py-5 bgdisabled text-decoration-none text-dark rounded-4">User</div>
                    @endif
                    <a href="/pegawais"
                        class="col py-5 bgtransparent text-decoration-none text-dark rounded-4">Pegawai</a>
                    <a href="/jabatans"
                        class="col py-5 bgtransparent text-decoration-none text-dark rounded-4">Jabatan</a>
                </div>
                <div class="row gap-3">
                    <a href="/gajis" class="col py-5 bgtransparent text-decoration-none text-dark rounded-4">Gaji</a>
                    <a href="/cutis" class="col py-5 bgtransparent text-decoration-none text-dark rounded-4">Cuti</a>
                    <a href="/absensis"
                        class="col py-5 bgtransparent text-decoration-none text-dark rounded-4">Absensi</a>
                </div>
                <div class="row ">
                    <a href="/penilaian_kerjas"
                        class="col py-5 bgtransparent text-decoration-none text-dark rounded-4">Penilaian
                        Kerja</a>

                </div>
            </div>
        </div>
</body>

</html>
