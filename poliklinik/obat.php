<?php
include_once("koneksi.php");
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}


if (!isset($_SESSION['user_id'])) {
    // Jika pengguna belum login, maka redirect ke halaman login
    echo '<script type="text/javascript">document.location="index.php?page=login";</script>';
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
    <title>Sistem Informasi Poliklinik</title>   <!--Judul Halaman-->
</head>
<body>
    <div class="container">
            <!--Form Input Data-->

        <form class="form row" method="POST" action="" name="myForm" onsubmit="return(validate());">
            <!-- Kode php untuk menghubungkan form dengan database -->
            <?php
            $nama_obat = '';
            $kemasan = '';
            $harga = '';
            if (isset($_GET['id'])) {
                $ambil = mysqli_query($mysqli, 
                "SELECT * FROM obat 
                WHERE id='" . $_GET['id'] . "'");
                while ($row = mysqli_fetch_array($ambil)) {
                    $nama_obat = $row['nama_obat'];
                    $kemasan = $row['kemasan'];
                    $harga = $row['harga'];
                }
            ?>
                <input type="hidden" name="id" value="<?php echo
                $_GET['id'] ?>">
            <?php
            }
            ?>
            <div class="form-group">
                <label for="inputobat" class="form-label fw-bold">
                    Obat
                </label>
                <input type="text" class="form-control" name="nama_obat" id="inputobat" placeholder="nama_obat" value="<?php echo $nama_obat ?>">
            </div>
            <div class="form-group">
                <label for="inputkemasan" class="form-label fw-bold">
                    Kemasan
                </label>
                <input type="text" class="form-control" name="kemasan" id="inputkemasan" placeholder="kemasan" value="<?php echo $kemasan ?>">
            </div>
            <div class="form-group">
                <label for="inputharga" class="form-label fw-bold">
                    Harga
                </label>
                <input type="text" class="form-control" name="harga" id="inputharga" placeholder="harga" value="<?php echo $harga ?>">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary rounded-pill px-3" name="simpan">Simpan</button>
            </div>
        </form>

            <!-- Table-->
    <table class="table table-hover mx-auto text-center">
        <!--thead atau baris judul-->
        <thead>
            <tr>
                <th scope="col" style="text-align: center; vertical-align: middle;">No</th>
                <th scope="col" style="text-align: center; vertical-align: middle;">Obat</th>
                <th scope="col" style="text-align: center; vertical-align: middle;">Kemasan</th>
                <th scope="col" style="text-align: center; vertical-align: middle;">Harga</th>
                <th scope="col" style="text-align: center; vertical-align: middle;">Aksi</th>
            </tr>
        </thead>
        <!--tbody berisi isi tabel sesuai dengan judul atau head-->
        <tbody>
            <!-- Kode PHP untuk menampilkan semua isi dari tabel urut
            berdasarkan status dan tanggal awal-->
            <?php
            $result = mysqli_query($mysqli, "SELECT * FROM obat");
            $no = 1;
            while ($data = mysqli_fetch_array($result)) {
            ?>
                <tr>
                    <td class="text-center align-middle"><?php echo $no++ ?></td>
                    <td class="text-center align-middle"><?php echo $data['nama_obat'] ?></td>
                    <td class="text-center align-middle"><?php echo $data['kemasan'] ?></td>
                    <td class="text-center align-middle"><?php echo $data['harga'] ?></td>
                    <td class="text-center align-middle">
                        <a class="btn btn-success rounded-pill px-3" href="index.php?page=obat&id=<?php echo $data['id'] ?>">Ubah</a>
                        <a class="btn btn-danger rounded-pill px-3" href="index.php?page=obat&id=<?php echo $data['id'] ?>&aksi=hapus">Hapus</a>
                    </td>
                </tr>
            <?php
            }
            ?>
        </tbody>
    </table>

        <?php
    if (isset($_POST['simpan'])) {
        if (isset($_POST['id'])) {
            $ubah = mysqli_query($mysqli, "UPDATE obat SET 
                                            nama_obat = '" . $_POST['nama_obat'] . "',
                                            kemasan = '" . $_POST['kemasan'] . "',
                                            harga = '" . $_POST['harga'] . "'
                                            WHERE
                                            id = '" . $_POST['id'] . "'");
        } else {
            $tambah = mysqli_query($mysqli, "INSERT INTO obat(nama_obat,kemasan,harga) 
                                            VALUES ( 
                                                '" . $_POST['nama_obat'] . "',
                                                '" . $_POST['kemasan'] . "',
                                                '" . $_POST['harga'] . "'
                                                )");
        }

        echo "<script> 
                document.location='index.php?page=obat';
                </script>";
    }

    if (isset($_GET['aksi'])) {
        if ($_GET['aksi'] == 'hapus') {
            $hapus = mysqli_query($mysqli, "DELETE FROM obat WHERE id = '" . $_GET['id'] . "'");
        } else if ($_GET['aksi'] == 'ubah_status') {
            $ubah_status = mysqli_query($mysqli, "UPDATE obat SET 
                                            status = '" . $_GET['status'] . "' 
                                            WHERE
                                            id = '" . $_GET['id'] . "'");
        }

        echo "<script> 
                document.location='index.php?page=obat';
                </script>";
    }
    ?>
</body>
</html>