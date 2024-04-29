<?php 
    include 'helper/app_function.php';

    //Submit
    if( isset($_POST) && count($_POST)>0 ){
        $no_tiket       = no_tiket_keluhan( $cfg_db );
        $in_foto_struk  = ''; 
        $in_foto_menu   = '';

        if( isset($_POST['preview_menu']) ){
            $in_foto_menu   = 'menu'.$_POST['name_preview_menu'];
            uploadBlob('preview_menu', $in_foto_menu, $no_tiket.'_files');
        } else {
            $in_foto_menu = null; // Berikan nilai null jika kolom foto menu tidak diisi
        }

        if( isset($_POST['preview_struk']) ){
            $in_foto_struk  = 'struk'.$_POST['name_preview_struk']; 
            uploadBlob('preview_struk', $in_foto_struk, $no_tiket.'_files');
        }

        
        $insert     = [
            'no_tiket'          => $no_tiket,
            'nama'              => $_POST['nama'],
            'no_wa'             => $_POST['hp'],
            'email'             => $_POST['email'],
            'alamat'            => $_POST['alamat'],
            'tgl_lahir'         => $_POST['tgl_lahir'],
            'jen_kel'           => $_POST['jenis_kelamin'],
            'tgl_pembelian'     => date('Y-m-d', strtotime($_POST['tgl_beli'])),
            'area_pembelian'    => $_POST['kota'],
            'outlet_pembelian'  => $_POST['resto'],
            'tipe_keluhan'      => $_POST['tipe_keluhan'],
            'menu_masalah'      => $_POST['menu_keluhan'],
            'jumlah'            => $_POST['jumlah'],
            'rincian_keluhan'   => $_POST['detail_keluhan'],
            'foto_struk'        => $in_foto_struk,
            'foto_menu'         => $in_foto_menu,
            'status'            => 'Complaint',
        ];  
        insert($cfg_db, 'keluhan', $insert);

        setCookie('message_form', '1');
        // header('location:'.$base_url);
        echo true;
        die;
    }
    //end Submit


    $cookie         = readCookie();
    $show_message   = isset($cookie['message_form']) && trim($cookie['message_form']) == '1' 
                        ? true : false;
    if( count($cookie)>0 ){
        destroyCookie();
    }
    

    $list_kota  = get_data($cfg_db, "select * From master_city");
    $list_menu  = get_data($cfg_db, "select * From master_menu");
    $list_tipe  = get_data($cfg_db, "select * From tipe_keluhan");
?>


<head>
    <title>Form Keluhan | MieGacoan</title>
    <?php include 'layouts/main.php'; ?>
    <?php include 'layouts/title-meta.php'; ?>
    <?php include 'layouts/head-css.php'; ?>

    <!-- SweetAlert css-->
    <link rel="stylesheet" type="text/css" href="./assets/vendors/sweetalert/sweetalert2.min.css">
</head>

<body>
    <!-- Begin page -->
    <div class="wrapper">

        

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <div class="content-page">
            <div class="content">

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                              <h4 class="page-title">FORM KELUHAN PELANGGAN MIE GACOAN</h4>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">INFORMASI PELANGGAN</h4>
                                    <p class="text-muted fs-14">
                                        <em>Untuk menindaklanjuti keluhan Anda, mohon mengisi informasi di bawah sebenar-benarnya.
Kami akan menjaga kerahasiaan data diri anda sesuai undang-undang yang berlaku.</em>

                                    </p>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <form id="form_keluhan" action="<?php echo $_SERVER['PHP_SELF'] ?>" method="POST" enctype="multipart/form-data">
                                                <div class="mb-3">
                                                    <label for="simpleinput" class="form-label">Nama</label>
                                                    <input type="text" id="simpleinput" name="nama" class="form-control">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="example-password" class="form-label">No. Handphone / WhatsApp Aktif </label>
                                                    <input type="text" id="simpleinput" name="hp" class="form-control">
                                                </div>
												
												<div class="mb-3">
                                                    <label for="example-password" class="form-label">Alamat Email</label>
                                                    <input type="text" id="simpleinput" name="email" class="form-control">
                                                </div>
												
												
                                              <div class="mb-3">
                                                    <label for="example-email" class="form-label">Area Tempat Tinggal</label>
                                                    <textarea class="form-control" id="example-textarea" name="alamat" rows="5"></textarea>
                                              </div>
												
											  <div class="mb-3">
                                                    <label for="example-date" class="form-label">Tanggal Lahir</label>
                                                    <input class="form-control" id="example-date" name="tgl_lahir" type="date" name="date">
                                                </div>
												<h6 class="fs-15 mt-3">Jenis Kelamin</h6>

													<div class="mt-2">
														<div class="form-check form-check-inline">
															<input type="radio" id="customRadio3" name="jenis_kelamin" class="form-check-input" value="L">
															<label class="form-check-label" for="customRadio3">Laki-Laki</label>
														</div>
														<div class="form-check form-check-inline">
															<input type="radio" id="customRadio4" name="jenis_kelamin" class="form-check-input" value="P">
															<label class="form-check-label" for="customRadio4">Perempuan</label>
														</div>
													</div>
                                           
                                        </div> <!-- end col -->

                                        <div class="col-lg-6"></div> <!-- end col -->
                                    </div>
                                    <!-- end row-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card -->
                        </div><!-- end col -->
                    </div><!-- end row -->

                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="header-title">INFORMASI PEMBELIAN DAN KELUHAN</h4>
                                    <p class="text-muted fs-14">
                                        <em>Mohon isi rincian keluhan dengan sebenar-benarnya agar dapat ditindaklanjuti dengan segera.</em>
                                    </p>

                                    <div class="row">
                                        <div class="col-lg-6">
                                          
												<div class="mb-3">
                                                    <label for="example-date" class="form-label">Tanggal Pembelian</label>
                                                    <input class="form-control" id="example-date" type="date" name="tgl_beli">
                                                </div>
                                                
                                                <div class="mb-3">
                                                    <label for="example-select" class="form-label">Kota Pembelian</label>
                                                    <select class="form-select" id="example-select" name="kota" onChange="getListResto(this)">
														<option>Pilih Salah Satu</option>
                                                        <?php foreach($list_kota as $kota){ ?>
                                                            <option value="<?php echo $kota['id'] ?>"><?php echo $kota['city'] ?></option>
                                                        <?php } ?>
                                                    </select>
                                                </div>
											
												<div class="mb-3">
                                                    <label for="example-select" class="form-label">Nama Resto</label>
                                                    <select class="form-select" id="sl_nama_resto" name="resto">
														<option>Pilih Salah Satu</option>
                                                    </select>
                                                </div>
											
												<div class="mb-3">
                                                    <label for="tipe_keluhan_select" class="form-label">Tipe Keluhan</label>
                                                    <select class="form-select" id="tipe_keluhan_select" name="tipe_keluhan">
														<option>Pilih Salah Satu</option>
                                                        <?php foreach($list_tipe as $tp){ ?>
                                                            <option value="<?php echo $tp['id'] ?>"><?php echo $tp['tipe_keluhan'] ?></option>
                                                        <?php } ?>
                                                    </select>
                                                </div>
												
                                                <div class="mb-3">
                                                    <label class="form-label">Menu yang Dikeluhkan</label>
                                                    <div class="d-flex flex-wrap">
                                                        <?php foreach($list_menu as $menu){ ?>
                                                            <div class="form-check me-3">
                                                                <input class="form-check-input" type="checkbox" name="menu_keluhan[]" id="menu_<?php echo $menu['id'] ?>" value="<?php echo $menu['id'] ?>">
                                                                <label class="form-check-label" for="menu_<?php echo $menu['id'] ?>">
                                                                    <?php echo $menu['menu'] ?>
                                                                </label>
                                                            </div>
                                                        <?php } ?>
                                                    </div>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="example-password" class="form-label">Jumlah</label>
                                                    <input type="text" id="simpleinput" class="form-control" name="jumlah">
                                                </div>
												
												<div class="mb-3">
                                                    <label for="example-password" class="form-label">Rincian Keluhan</label>
                                                     <textarea class="form-control" id="example-textarea" rows="5" name="detail_keluhan"></textarea>
                                                </div>
												
												
												<div class="mb-3">
                                                    <label for="example-fileinput" class="form-label">Foto Struk Pembelian</label>
                                                    <input type="file" id="attachment_struk_beli" accept="image/*" onChange="attach_img('attachment_struk_beli', 'preview_struk')" class="form-control">
                                                    <img style="display:none;" id="preview_struk"></img>
                                                </div>
												
                                                <div class="mb-3" id="attachment_menu_div" style="display: none;">
                                                    <label for="attachment_menu" class="form-label">Foto Menu Bermasalah</label>
                                                    <input type="file" id="attachment_menu" accept="image/*" onchange="attach_img('attachment_menu', 'preview_menu')" class="form-control">
                                                    <img id="preview_menu" style="display: none;">
                                                </div>
											  <button type="button" onClick="form_submit()" class="btn btn-primary">Submit</button>
                                            </form>
                                        </div> <!-- end col -->

                                        <div class="col-lg-6"></div> <!-- end col -->
                                    </div>
                                    <!-- end row-->
                                </div> <!-- end card-body -->
                            </div> <!-- end card -->
                        </div><!-- end col -->
                    </div><!-- end row -->

                    <div class="row">
                        <div class="col-lg-6"><!-- end card -->
                        </div> <!-- end col -->

                        <div class="col-lg-6"><!-- end card -->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-lg-6"><!-- end card -->
                        </div> <!-- end col -->

                        <div class="col-lg-6"><!-- end card -->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->


                    <div class="row">
                        <div class="col-lg-6"><!-- end card-->
                        </div>
                        <!-- end col -->

                        <div class="col-lg-6"><!-- end card -->
                        </div> <!-- end col -->

                    </div>
                    <!-- end row -->


                    <!-- Inline Form -->
                    <div class="row">
                        <div class="col-md-12"><!-- end card -->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <div class="row">
                        <div class="col-12"><!-- end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                    <!-- Form row -->
                    <div class="row">
                        <div class="col-12"><!-- end card-->
                        </div> <!-- end col -->
                    </div>
                    <!-- end row -->

                </div> <!-- container -->

            </div> <!-- content -->

            <?php include 'layouts/footer.php'; ?>

        </div>

        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->
    </div>

    </div>
    <!-- END wrapper -->

    <?php include 'layouts/footer-scripts.php'; ?>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>

    <!-- Sweet Alert js-->
    <script src="./assets/vendors/sweetalert/sweetalert2.min.js"></script>
	
</body>
</html>


<script>
    function getListResto( elm ){
        $('#sl_nama_resto').html('<option>Pilih Salah Satu</option>');
        $.ajax({
            type : "POST",
            data : {
                action  : 'get_resto',
                value   : $(elm).val(),
            },
            url : '<?php echo $base_url ?>api_keluhan',
            dataType: "json",
            success : function(resp){
                if( resp.valid && resp.list.length>0 ){
                    $.each( resp.list, function( key, value ) {
                        $('#sl_nama_resto').append('<option value="'+value.id+'">'+value.resto+'</option>');    
                    });
                }    
            },
        });
    }


    var canvas_struk    = '';
    var file_struk      = '';
    var canvas_menu     = '';
    var file_menu       = '';
    function attach_img(elm, elm_preview){
        var resize_width = 800; //max width
        var item = document.querySelector('#' + elm).files[0];
        var reader = new FileReader();
        reader.readAsDataURL(item);
        reader.name = item.name;//get the image's name
        reader.size = item.size; //get the image's size
        reader.onload = function(event) {
        
            var img = new Image();//create a image
            img.src = event.target.result;//result is base64-encoded Data URI
            img.name = event.target.name;//set name (optional)
            img.size = event.target.size;//set size (optional)
            img.onload = function(el) {
                var elem = document.createElement('canvas');//create a canvas

                var scaleFactor = resize_width / el.target.width;
                elem.width = resize_width;
                elem.height = el.target.height * scaleFactor;

                var ctx = elem.getContext('2d');
                ctx.drawImage(el.target, 0, 0, elem.width, elem.height);

                //get the base64-encoded Data URI from the resize image
                // var srcEncoded = ctx.canvas.toDataURL('image/png', 1);
                if( elm_preview == 'preview_struk' ){
                    canvas_struk    = ctx.canvas.toDataURL('image/png', 1);
                    file_struk      = reader.name;
                }else{
                    canvas_menu = ctx.canvas.toDataURL('image/png', 1);
                    file_menu   = reader.name;
                }
            }
        }
    }


    function form_submit(){
        Swal.fire({
            text: 'Proses Submit Keluhan',
            icon: "info",
            showCloseButton: false,
            showCancelButton: false,
            showConfirmButton: false,
            allowOutsideClick: false,
        });

        var fd = new FormData(document.querySelector('#form_keluhan'));
        fd.append('preview_struk', canvas_struk);
        fd.append('name_preview_struk', file_struk);
        fd.append('preview_menu', canvas_menu);
        fd.append('name_preview_menu', file_menu);
        $.ajax({
            type: 'POST',
            url: '<?php echo $base_url ?>',
            data: fd,
            processData: false,
            contentType: false
        }).done(function(data) {
            setTimeout(function(){
                window.location.href = '<?php echo $base_url ?>';
            }, 800);
        });
    }


    $(document).ready(function(){
        let show_message = "<?php echo $show_message ?>";
        
        //message after submit
        if( show_message == 1 ){
            let message = "Terima kasih telah mengisi form keluhan Mie Gacoan, dan mohon maaf atas ketidaknyamanan yang terjadi."
                            + " Keluhan Anda akan segera kami verifikasi dan tindaklanjuti.";
            Swal.fire({
                // title: "Good job!",
                text: message,
                icon: "success"
            });
        }
        //end message after submit

    });
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tipe_keluhan_select').change(function() {
            var selectedOption = $(this).val();

            // Tipe keluhan dengan ID 1, 2, 3, atau 4 memiliki kolom foto menu yang harus ditampilkan
            var showAttachmentMenu = [1, 2, 3, 4];

            // Periksa apakah tipe keluhan terpilih termasuk dalam tipe keluhan yang harus menampilkan kolom foto menu
            if (showAttachmentMenu.includes(parseInt(selectedOption))) {
                // Tampilkan kolom foto menu dan buat wajib diisi
                $('#attachment_menu_div').show();
                $('#attachment_menu').prop('required', true);
            } else {
                // Sembunyikan kolom foto menu dan buat tidak wajib diisi
                $('#attachment_menu_div').hide();
                $('#attachment_menu').prop('required', false);
            }
        });
    });
</script>


