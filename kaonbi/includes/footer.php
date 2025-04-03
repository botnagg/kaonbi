
					</div>
				</div>



				<script type="text/javascript">
					$(document).ready(function () {
						$("#sidebarCollapse, #sidebarExtend").on("click", function () {
							$("#sidebar").toggleClass("active");
						});

						$("#sorted").DataTable( {
							"bStateSave": true,
							"sPaginationType": "full_numbers"
						});
					});
				</script>

				<script type="text/javascript">
					function navConfirm(loc) {						
						Swal.fire({
						  title: "Estás segur@?",
						  text: "No podrás recuperarlo!",
						  icon: "warning",
						  showCancelButton: true,
						  confirmButtonColor: "#3085d6",
						  cancelButtonColor: "#d33",
						  confirmButtonText: "Si, elimínalo!"
						}).then((result) => {
						  if (result.isConfirmed) {
							window.location.href = loc;
						  }
						})
						return false;
					}
				</script>
				
				<script type="text/javascript">
					function muestraError(mensaje) {						
						Swal.fire({
						  icon: "error",
						  title: "Oops...",
						  text: "" + mensaje
						})
						return false;
					}
				</script>
				
				
				<script type="text/javascript">
					$(document).ready(function () {
						$(".anotacionHTML").on("click", function () {
							if($(this).data("html") != ""){
								Swal.fire({
									html: $(this).data("html")
								});
							}
						});
					});
				</script>
			</body>
			</html>