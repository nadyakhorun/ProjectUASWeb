<?php 
  require 'connection.php';
  checkLogin();
  $warga = mysqli_query($conn, "SELECT * FROM warga ORDER BY nama_warga ASC");
  if (isset($_POST['btnEditWarga'])) {
    if (editWarga($_POST) > 0) {
      setAlert("Warga has been changed", "Successfully changed", "success");
      header("Location: warga.php");
    }
  }

  if (isset($_POST['btnTambahWarga'])) {
    if (addWarga($_POST) > 0) {
      setAlert("Warga has been added", "Successfully added", "success");
      header("Location: warga.php");
    }
  }
  if (isset($_GET['toggle_modal'])) {
    $toggle_modal = $_GET['toggle_modal'];
    echo "
    <script>
      $(document).ready(function() {
        $('#$toggle_modal').modal('show');
      });
    </script>
    ";
  }
?>

<!DOCTYPE html>
<html>
<head>
  <?php include 'include/css.php'; ?>
  <title>Warga</title>
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
        <div class="row justify-content-center mb-2">
          <div class="col-sm text-left">
            <h1 class="m-0 text-dark">Warga</h1>
          </div><!-- /.col -->
          <div class="col-sm text-right">
            <?php if ($_SESSION['id_jabatan'] !== '3'): ?>
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tambahWargaModal"><i class="fas fa-fw fa-plus"></i> Tambah Warga</button>
              <!-- Modal -->
              <div class="modal fade text-left" id="tambahWargaModal" tabindex="-1" role="dialog" aria-labelledby="tambahWargaModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <form method="post">
                    <div class="modal-content">
                      <div class="modal-header">
                      <h5 class="modal-title" id="tambahWargaModalLabel">Tambah Warga</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <div class="form-group">
                          <label for="nik">Nik</label>
                          <input type="number" id="nik" name="nik" class="form-control" required>
                        </div>
                        <div class="form-group">
                          <label for="nama_warga">Nama Warga</label>
                          <input type="text" id="nama_warga" name="nama_warga" class="form-control" required>
                        </div>
                        <div class="form-group">
                          <label>Jenis Kelamin</label><br>
                          <input type="radio" id="pria" name="jenis_kelamin" value="pria"> <label for="pria">Pria</label> |
                          <input type="radio" id="wanita" name="jenis_kelamin" value="wanita"> <label for="wanita">Wanita</label>
                        </div>
                        <div class="form-group">
                          <label for="no_telepon">No. Telepon</label>
                          <input type="number" name="no_telepon" id="no_telepon" class="form-control">
                        </div>
                        <div class="form-group">
                          <label for="alamat">email</label>
                          <input type="text" id="email" name="email" class="form-control">
                        </div>
                        <div class="form-group">
                          <label for="alamat">Alamat</label>
                          <input type="text" id="alamat" name="alamat" class="form-control">
                        </div>
                        <div class="form-group">
                          <label for="alamat">Status</label>
                        <select name="status" id="status" class="form-control">
                                <option value="aktif">Aktif</option>
                                <option value="tidak_aktif">Tidak Aktif</option>
                        </select>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-fw fa-times"></i> Close</button>
                        <button type="submit" class="btn btn-primary" name="btnTambahWarga"><i class="fas fa-fw fa-save"></i> Save</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            <?php endif ?>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg">
            <div class="table-responsive">
              <table class="table table-striped table-hover table-bordered" id="table_id">
                <thead>
                  <tr>
                    <th>No</th>
                    <th>Nik</th>
                    <th>Nama Warga</th>
                    <th>Jenis Kelamin</th>
                    <th>No. Telepon</th>
                    <th>Email</th>
                    <th>Alamat</th>
                    <th>Status</th>
                    <?php if ($_SESSION['id_jabatan'] !== '3'): ?>
                      <th>Aksi</th>
                    <?php endif ?>
                  </tr>
                </thead>
                <tbody>
                  <?php $i = 1; ?>
                  <?php foreach ($warga as $dw): ?>
                    <tr>
                      <td><?= $i++; ?></td>
                      <td><?= $dw['nik']; ?></td>
                      <td><?= ucwords(htmlspecialchars_decode($dw['nama_warga'])); ?></td>
                      <td><?= ucwords($dw['jenis_kelamin']); ?></td>
                      <td><?= $dw['no_telepon']; ?></td>
                      <td><?= $dw['email']; ?></td>
                      <td><?= $dw['alamat']; ?></td>
                      <td><?= $dw['status']; ?></td>
                      <?php if ($_SESSION['id_jabatan'] !== '3'): ?>
                        <td>
                          <!-- Button trigger modal -->
                          <a href="ubah_warga.php?id_warga=<?= $dw['id_warga']; ?>" class="badge badge-success" data-toggle="modal" data-target="#editWarga<?= $dw['id_warga']; ?>">
                            <i class="fas fa-fw fa-edit"></i> Ubah
                          </a>
                            <a data-nama="<?= $dw['nama_warga']; ?>" class="btn-delete badge badge-danger" href="hapus_warga.php?id_warga=<?= $dw['id_warga']; ?>"><i class="fas fa-fw fa-trash"></i> Hapus</a>
                          <!-- Modal -->
                          <div class="modal fade" id="editWarga<?= $dw['id_warga']; ?>" tabindex="-1" role="dialog" aria-labelledby="editWarga<?= $dw['id_warga']; ?>" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                              <form method="post">
                                <input type="hidden" name="id_warga" value="<?= $dw['id_warga']; ?>">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="editWargaModalLabel<?= $dw['id_Warga']; ?>">Ubah Warga</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                  <div class="modal-body">
                                    <div class="form-group">
                                      <label for="nama_warga<?= $dw['id_warga']; ?>">Nama Warga</label>
                                      <input type="text" id="nama_warga<?= $dw['id_warga']; ?>" value="<?= $dw['nama_warga']; ?>" name="nama_warga" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                      <label>Jenis Kelamin</label><br>
                                      <?php if ($dw['jenis_kelamin'] == 'pria'): ?>
                                        <input type="radio" id="pria<?= $dw['id_warga']; ?>" name="jenis_kelamin" value="pria" checked="checked"> <label for="pria<?= $dw['id_warga']; ?>">Pria</label> |
                                        <input type="radio" id="wanita<?= $dw['id_warga']; ?>" name="jenis_kelamin" value="wanita"> <label for="wanita<?= $dw['id_warga']; ?>">Wanita</label>
                                      <?php else: ?>
                                        <input type="radio" id="pria<?= $dw['id_warga']; ?>" name="jenis_kelamin" value="pria"> <label for="pria<?= $dw['id_warga']; ?>">Pria</label> |
                                        <input type="radio" id="wanita<?= $dw['id_warga']; ?>" name="jenis_kelamin" value="wanita" checked="checked"> <label for="wanita<?= $dw['id_warga']; ?>">Wanita</label>
                                      <?php endif ?>
                                    </div>
                                    <div class="form-group">
                                      <label for="nik<?= $dw['id_warga']; ?>">NIK</label>
                                      <input type="number" name="nik" value="<?= $dw['nik']; ?>" id="nik<?= $dw['id_warga']; ?>" class="form-control">
                                    </div>
                                    <div class="form-group">
                                      <label for="no_telepon<?= $dw['id_warga']; ?>">No. Telepon</label>
                                      <input type="number" name="no_telepon" value="<?= $dw['no_telepon']; ?>" id="no_telepon<?= $dw['id_warga']; ?>" class="form-control">
                                    </div>
                                    <div class="form-group">
                                      <label for="email<?= $dw['id_warga']; ?>">Email</label>
                                      <input type="text" name="email" value="<?= $dw['email']; ?>" id="email<?= $dw['id_warga']; ?>" class="form-control">
                                    </div>
                                  </div>
                                  <div class="form-group">
                                      <label for="alamat<?= $dw['id_warga']; ?>">Alamat</label>
                                      <input type="alamat" name="alamat" value="<?= $dw['alamat']; ?>" id="alamat<?= $dw['id_warga']; ?>" class="form-control">
                                    </div>
                                    <div class="form-group">
                                      <label for="status<?= $dw['id_warga']; ?>">Status</label>
                                      <?php if ($dw['status'] == 'aktif'): ?>
                                        <input type="radio" id="aktif<?= $dw['id_warga']; ?>" name="status" value="aktif" checked="checked"> <label for="aktif<?= $dw['id_warga']; ?>">Aktif</label> |
                                        <input type="radio" id="tidak aktif<?= $dw['id_warga']; ?>" name="status" value="tidak aktif"> <label for="tidak aktif<?= $dw['id_warga']; ?>">Tidak Aktif</label>
                                      <?php else: ?>
                                        <input type="radio" id="aktif<?= $dw['id_warga']; ?>" name="status" value="aktif> <label for="pria<?= $dw['id_warga']; ?>">Aktif</label> |
                                        <input type="radio" id="tidak aktif<?= $dw['id_warga']; ?>" name="status" value="tidak aktif" checked="checked"> <label for="wanita<?= $dw['id_warga']; ?>">Tidak Aktif</label>
                                      <?php endif ?>
                                    </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-fw fa-times"></i> Close</button>
                                    <button type="submit" class="btn btn-primary" name="btnEditWarga"><i class="fas fa-fw fa-save"></i> Save</button>
                                  </div>
                                </div>
                              </form>
                            </div>
                          </div>
                          
                        </td>
                      <?php endif ?>
                    </tr>
                  <?php endforeach ?>
                </tbody>
              </table>
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