<?php 
	require 'connection.php';
	$id_warga = $_GET['id_warga'];
	if (isset($id_warga)) {
		if (deleteWarga($id_warga) > 0) {
			setAlert("Siswa has been deleted", "Successfully deleted", "success");
		    header("Location: warga.php");
	    }
	} else {
	   header("Location: warga.php");
	}