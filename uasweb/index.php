<?php 
  require 'connection.php';
  checkLogin();
  if (isset($_SESSION['username'])) 
    $username = $_SESSION['username'];
  $jml_warga = mysqli_fetch_assoc(mysqli_query($conn, "SELECT count(id_warga) as jml_warga FROM warga"));
  $jml_warga = $jml_warga['jml_warga'];

  $jml_user = mysqli_fetch_assoc(mysqli_query($conn, "SELECT count(id_user) as jml_user FROM user"));
  $jml_user = $jml_user['jml_user'];

  $jml_jabatan = mysqli_fetch_assoc(mysqli_query($conn, "SELECT count(id_jabatan) as jml_jabatan FROM jabatan"));
  $jml_jabatan = $jml_jabatan['jml_jabatan'];

  $jml_pengeluaran = mysqli_fetch_assoc(mysqli_query($conn, "SELECT sum(jumlah_pengeluaran) as jml_pengeluaran FROM pengeluaran"));
  $jml_pengeluaran = $jml_pengeluaran['jml_pengeluaran'];

  $jml_uang_kas = mysqli_fetch_assoc(mysqli_query($conn, "SELECT sum(minggu_ke_1 + minggu_ke_2 + minggu_ke_3 + minggu_ke_4) as jml_uang_kas FROM uang_kas"));
  $jml_uang_kas = $jml_uang_kas['jml_uang_kas'];
?>

<!DOCTYPE html>
<html>
<head>
  <?php include 'include/css.php'; ?>
  <title>Dashboard</title>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  
  <?php include 'include/navbar.php'; ?>

  <?php include 'include/sidebar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm">
          <style>
        /* Styling untuk tampilan tanggal */
        #date {
            font-size: 18px;
            text-align: leftcenter;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div id="date"></div>

    <script>
        function updateDate() {
            var now = new Date();
            var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };

            // Menggunakan metode toLocaleDateString untuk mendapatkan tanggal yang diformat
            var formattedDate = now.toLocaleDateString('id-ID', options);

            // Menampilkan tanggal di elemen dengan id "date"
            document.getElementById('date').innerHTML = formattedDate;

            // Memanggil fungsi ini setiap detik untuk memperbarui tanggal
            setTimeout(updateDate, 1000);
        }

        // Memanggil fungsi updateDate saat halaman dimuat
        window.onload = updateDate;
    </script>
            <h1>Selamat datang, <?php echo $username; ?>!</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <?php if ($_SESSION['id_jabatan'] == '1'): ?>
            <div class="col-lg-3">
              <div class="card shadow">
                <div class="card-body">
                  <h5><i class="fas fa-fw fa-cog"></i> Jabatan</h5>
                  <h6 class="text-muted">Jumlah Jabatan: <?= $jml_jabatan; ?></h6>
                  <a href="jabatan.php" class="btn btn-info"><i class="fas fa-fw fa-align-justify"></i></a>
                </div>
              </div>
            </div>
            <div class="col-lg-3">
              <div class="card shadow">
                <div class="card-body">
                  <h5><i class="fas fa-fw fa-users"></i> User</h5>
                  <h6 class="text-muted">Jumlah User: <?= $jml_user; ?></h6>
                  <a href="user.php" class="btn btn-info"><i class="fas fa-fw fa-align-justify"></i></a>
                </div>
              </div>
            </div>
          <?php endif ?>
          <div class="col-lg-3">
            <div class="card shadow">
              <div class="card-body">
                <h5><i class="fas fa-fw fa-user-tie"></i> Warga</h5>
                <h6 class="text-muted">Jumlah Warga: <?= $jml_warga; ?></h6>
                <a href="warga.php" class="btn btn-info"><i class="fas fa-fw fa-align-justify"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="card shadow">
              <div class="card-body">
                <h5><i class="text-danger fas fa-fw fa-caret-down"></i><i class="text-danger fas fa-fw fa-dollar-sign"></i> Pengeluaran</h5>
                <h6 class="text-muted">Jumlah Pengeluaran: Rp. <?= number_format($jml_pengeluaran); ?></h6>
                <a href="pengeluaran.php" class="btn btn-info"><i class="fas fa-fw fa-align-justify"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="card shadow">
              <div class="card-body">
                <h5><i class="text-success fas fa-fw fa-caret-up"></i> <i class="text-success fas fa-fw fa-dollar-sign"></i> Uang Kas</h5>
                <h6 class="text-muted">Jumlah Uang Kas: Rp. <?= number_format($jml_uang_kas - $jml_pengeluaran); ?></h6>
                <a href="uang_kas.php" class="btn btn-info"><i class="fas fa-fw fa-align-justify"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <?php 
  require 'footer.php'; 
  ?>

</div>
</body>
</html>
