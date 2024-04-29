
<div class="sidebar-wrapper">
          <div>
            <div class="logo-wrapper"><a href="index.html"><img class="img-fluid for-light" src="<?php echo $assets_path ?>images/logo/login-admin.png" alt=""></a>
              <div class="back-btn"><i class="fa fa-angle-left"></i></div>
              <div class="toggle-sidebar"><i class="fa fa-cog status_toggle middle sidebar-toggle"> </i></div>
            </div>
            <div class="logo-icon-wrapper"><a href="index.html"><img class="img-fluid" src="<?php echo $assets_path ?>images/logo/logo-icon1.png" alt=""></a></div>
            <nav class="sidebar-main">
              <div class="left-arrow" id="left-arrow"><i data-feather="arrow-left"></i></div>
              <div id="sidebar-menu">
                <ul class="sidebar-links" id="simple-bar">
                  <li class="back-btn"><a href="index.html"><img class="img-fluid" src="<?php echo $assets_path ?>images/logo/logo-icon.png" alt=""></a>
                    <div class="mobile-back text-end"><span>Back</span><i class="fa fa-angle-right ps-2" aria-hidden="true"></i></div>
                  </li>
                  <li class="sidebar-main-title">          
                    <h6 class="lan-1">General </h6>
                  </li>
                  <li class="menu-box"> 
                    <ul>             
                      <li class="sidebar-list"><a class="sidebar-link sidebar-title" href="javascript:void(0)"><i data-feather="home"></i><span class="lan-3">Dashboard</span></a>
                        <ul class="sidebar-submenu">
                          <li><a class="lan-4" href="">Datatables</a></li>
                          <li><a href="<?php echo $base_url.'./dashboard_chart'; ?>">Laporan</a></li>
                        </ul>
                      </li>
					   <li class="sidebar-list"><a class="sidebar-link sidebar-title link-nav" href="<?php echo $base_url.'dashboard_marketing'; ?>"><i data-feather="git-pull-request"> </i><span>DataTables</span></a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="right-arrow" id="right-arrow"><i data-feather="arrow-right"></i></div>
            </nav>
          </div>
        </div>